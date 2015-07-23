(in-package :local-time-locale)

(defclass locale-nn (locale)
  ()
  (:default-initargs
   :first-day-of-week 1
    :month-names
    #("" "januar" "februar" "mars" "april" "mai" "juni" "juli" "august"
      "september" "oktober" "november" "desember")
    :short-month-names
    #("" "jan" "feb" "mar" "apr" "mai" "jun" "jul" "aug" "sep" "okt" "nov" "des")
    :weekday-names
    #("sundag" "måndag" "tysdag" "onsdag" "torsdag" "fredag" "laurdag")
    :short-weekday-names
    #("sun" "mån" "tys" "ons" "tor" "fre" "lau")
    :minimal-weekday-names
    #("su" "må" "ty" "on" "to" "fr" "lø")
    :long-date-formats
    '(("LT" . "HH:mm")
      ("LTS" . "LT:ss")
      ("L" . "DD.MM.YYYY")
      ("LL" . "D MMMM YYYY")
      ("LLL" . "D MMMM YYYY LT")
      ("LLLL" . "dddd D MMMM YYYY LT")
      ("l" . "DD.MM.YYYY")
      ("ll" . "D MMMM YYYY")
      ("lll" . "D MMMM YYYY LT")
      ("llll" . "dddd D MMMM YYYY LT"))))

(defmethod get-ordinal (number token (locale locale-nn))
  (declare (ignore token locale))
  (format nil "~d." number))

(defmethod make-locale ((class (eql :nn)))
  (make-instance 'locale-nn))