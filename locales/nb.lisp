(in-package :local-time-locale)

(defclass locale-nb (locale)
  ()
  (:default-initargs

   :first-day-of-week 1
   :month-names
    #("" "januar" "februar" "mars" "april" "mai" "juni" "juli" "august"
      "september" "oktober" "november" "desember")
    
    :short-month-names
    #("" "jan" "feb" "mar" "apr" "mai" "jun" "jul" "aug" "sep" "okt" "nov" "des")

    :weekday-names
    #("søndag" "mandag" "tirsdag" "onsdag" "torsdag" "fredag" "lørdag")
    
    :short-weekday-names
    #("søn" "man" "tirs" "ons" "tors" "fre" "lør")

    :minimal-weekday-names
    #("sø" "ma" "ti" "on" "to" "fr" "lø")

    :long-date-formats
    '(("LT" . "HH.mm")
      ("LTS" . "LT.ss")
      ("L" . "DD.MM.YYYY")
      ("LL" . "D. MMMM YYYY")
      ("LLL" . "D. MMMM YYYY [kl.] LT")
      ("LLLL" . "dddd D. MMMM YYYY [kl.] LT"))))

(defmethod get-ordinal (number token (locale locale-nb))
  (declare (ignore token locale))
  (format nil "~d." number))

(defmethod make-locale ((class (eql :nb)))
  (make-instance 'locale-nn))