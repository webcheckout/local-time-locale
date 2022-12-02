(in-package :local-time-locale)

(defclass locale-sv (locale)
  ()
  (:default-initargs
   :first-day-of-week 1
    :month-names
    #("" "januari" "februari" "mars" "april" "maj" "juni" "juli"
      "augusti" "september" "oktober" "november" "december")
    :short-month-names
    #("" "jan" "feb" "mar" "apr" "maj" "jun" "jul" "aug" "sep" "okt" "nov" "dec")
    :weekday-names
    #("söndag" "måndag" "tisdag" "onsdag" "torsdag" "fredag" "lördag")
    :short-weekday-names
    #("sön" "mån" "tis" "ons" "tor" "fre" "lör")
    :minimal-weekday-names
    #("sö" "må" "ti" "on" "to" "fr" "lö")
    :long-date-formats
    '(("LT" . "HH:mm")
      ("LTS" . "LT:ss")
      ("L" . "YYYY-MM-DD")
      ("LL" . "D MMMM YYYY")
      ("LLL" . "D MMMM YYYY LT")
      ("LLLL" . "dddd D MMMM YYYY LT'"))))
   
(defmethod get-ordinal (number token (locale locale-sv))
  (declare (ignore token locale))
  (let* ((b (mod number 10))
	 (output (cond ((= (floor (/ (mod number 100) 10)) 1)
			"e")
		       ((= b 1) "a")
		       ((= b 2) "a")
		       (t "e"))))
    (format nil "~d~a" number output)))

(defmethod make-locale ((class (eql :sv)))
  (make-instance 'locale-sv))
