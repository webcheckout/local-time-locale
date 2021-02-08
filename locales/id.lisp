(in-package :local-time-locale)

(defclass locale-id (locale)
  ()
  (:default-initargs
    :first-day-of-week 0
    :month-names
    #("" "Januari" "Februari" "Maret" "April" "Mei" "Juni" "Juli" "Agustus" "September" "Oktober" "November" "Desember")
    :short-month-names
    #("" "Jan" "Feb" "Mar" "Apr" "Mei" "Jun" "Jul" "Agt" "Sep" "Okt" "Nov" "Des")
    :weekday-names
    #("Minggu" "Senin" "Selasa" "Rabu" "Kamis" "Jumat" "Sabtu")
    :short-weekday-names
    #("Min" "Sen" "Sel" "Rab" "Kam" "Jum" "Sab")
    :minimal-weekday-names
    #("Mg" "Sn" "Sl" "Rb" "Km" "Jm" "Sb")
    
    :long-date-formats
    '(("LT"   . "HH.mm")
      ("L"    . "DD/MM/YYYY")
      ("LL"   . "D MMMM YYYY")
      ("LLL"  . "D MMMM YYYY [pukul] HH.mm")
      ("LLLL" . "dddd, D MMMM YYYY [pukul] HH.mm")
      ("l"    . "DD/MM/YYYY")
      ("ll"   . "D MMMM YYYY")
      ("lll"  . "D MMMM YYYY [pukul] HH.mm")
      ("llll" . "dddd, D MMMM YYYY [pukul] HH.mm"))))

(defmethod get-ordinal (number token (locale locale-id))
  (declare (ignore token locale))
  number)
  
(defmethod get-meridiem (hour minute upcase (locale locale-id))
  (declare (ignore minute upcase locale))
    (cond ((< hour 11) "pagi")
	  ((< hour 15) "siang")
	  ((< hour 19) "sore")
	  (t "malam")))

(defmethod meridiems ((locale locale-id))
  `(("pagi"  ,#'%am-conversion)
    ("siang" ,(lambda (hour) (if (= hour 11) (%am-conversion hour) (%pm-conversion hour))))
    ("sore"  ,#'%pm-conversion)
    ("malam" ,#'%pm-conversion)))

(defmethod make-locale ((class (eql :id)))
  (make-instance 'locale-id))
