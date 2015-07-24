(in-package :local-time-locale)

(defclass locale-es (locale) ()
  (:default-initargs
   :first-day-of-week 1
    :month-names
    #("" "enero" "febrero" "marzo" "abril" "mayo" "junio" "julio"
      "agosto" "septiembre" "octubre" "noviembre" "diciembre'")
    :short-month-names
    #("" "ene" "feb" "mar" "abr" "may" "jun" "jul" "ago" "sep"
      "oct" "nov" "dic'")
    :weekday-names
    #("" "domingo" "lunes" "martes" "miércoles" "jueves" "viernes" "sábado'")
    :short-weekday-names
    #("" "dom." "lun." "mar." "mié." "jue." "vie." "sáb.")
    :minimal-weekday-names
    #("" "Do" "Lu" "Ma" "Mi" "Ju" "Vi" "Sá")
    
    :long-date-formats
    '(("LT"   . "H:mm")
      ("L"    . "DD/MM/YYYY")
      ("LL"   . "D [de] MMMM [de] YYYY")
      ("LLL"  . "D [de] MMMM [de] YYYY LT")
      ("LLLL" . "dddd, D [de] MMMM [de] YYYY LT"))))

(defmethod get-short-month-name (dow format (locale locale-es))
  (if (string= format "MMM")
      (format nil "~a." (aref (short-month-names locale) dow))
      (aref (short-month-names locale) dow)))

(defmethod get-ordinal (number token (locale locale-es))
  (declare (ignore token locale))
  (format nil "~dº" number))

(defmethod make-locale ((class (eql :es)))
  (make-instance 'locale-es))
		 