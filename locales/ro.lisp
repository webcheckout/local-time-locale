(in-package :local-time-locale)

(defclass locale-ro (locale) ()
  (:default-initargs
   :first-day-of-week 1

    :month-names
    #("" "ianuarie" "februarie" "martie" "aprilie" "mai" "iunie" "iulie" "august" "septembrie" "octombrie" "noiembrie" "decembrie")
    :short-month-names
    #("" "ian." "feb." "mart." "apr." "mai" "iun." "iul." "aug." "sept." "oct." "nov." "dec.")
    :weekday-names
    #("duminică" "luni" "marți" "miercuri" "joi" "vineri" "sâmbătă")
    :short-weekday-names
    #("Dum" "Lun" "Mar" "Mie" "Joi" "Vin" "Sâm")
    :minimal-weekday-names
    #("Du" "Lu" "Ma" "Mi" "Jo" "Vi" "Sâ")
    
    :long-date-formats
    '(("LT"   . "H:mm")
      ("L"    . "DD.MM.YYYY")
      ("LL"   . "D MMMM YYYY")
      ("LLL"  . "D MMMM YYYY LT")
      ("LLLL" . "dddd, D MMMM YYYY LT"))))

(defmethod get-ordinal (number token (locale locale-ro))
  (declare (ignore token locale))
  number)

(defmethod make-locale ((class (eql :ro)))
  (make-instance 'locale-ro))
