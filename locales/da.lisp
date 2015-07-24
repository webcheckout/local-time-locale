(in-package :local-time-locale)

(defclass locale-da (locale)
  ()
  (:default-initargs
   :first-day-of-week 1
    :month-names
    #("" "januar" "februar" "marts" "april" "maj" "juni" "juli"
      "august" "september" "oktober" "november" "december")
    
    :short-month-names
     #("" "jan" "feb" "mar" "apr" "maj" "jun" "jul" "aug" "sep" "okt" "nov" "dec")
    
    :weekday-names
     #("søndag" "mandag" "tirsdag" "onsdag" "torsdag" "fredag" "lørdag")
    
    :short-weekday-names
     #("søn" "man" "tir" "ons" "tor" "fre" "lør")
    
    :minimal-weekday-names
    #("sø" "ma" "ti" "on" "to" "fr" "lø")
    
    :long-date-formats
    
    '(("LT" . "HH:mm")
      ("LTS" . "LT:ss")
      ("L" . "DD/MM/YYYY")
      ("LL" . "D. MMMM YYYY")
      ("LLL" . "D. MMMM YYYY LT")
      ("LLLL" . "dddd [d.] D. MMMM YYYY LT"))))

(defmethod get-ordinal (number token (locale locale-da))
  (declare (ignore token locale))
  (format nil "~d." number))

(defmethod make-locale ((class (eql :da)))
  (make-instance 'locale-da))