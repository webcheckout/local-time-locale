(in-package :local-time-locale)

(defclass locale-nl (locale)
  ((short-month-names-dots  :accessor short-month-names-dots
			    :initarg :short-month-names-dots
			    :initform
			    #("" "jan." "feb." "mrt." "apr." "mei" "jun." "jul."
			      "aug." "sep." "okt." "nov." "dec.")))
  (:default-initargs
   :first-day-of-week 1
    :month-names
    #("" "januari" "februari" "maart" "april" "mei" "juni" "juli"
      "augustus" "september" "oktober" "november" "december")
    :short-month-names
    #("" "jan" "feb" "mrt" "apr" "mei" "jun" "jul" "aug" "sep" "okt" "nov" "dec")
    :weekday-names
    #("zondag" "maandag" "dinsdag" "woensdag" "donderdag" "vrijdag" "zaterdag")
    :short-weekday-names
    #("zo." "ma." "di." "wo." "do." "vr." "za.")
    :minimal-weekday-names
    #("Zo" "Ma" "Di" "Wo" "Do" "Vr" "Za")
    :long-date-formats
    '(("LT" . "HH:mm")
      ("LTS" . "HH:mm:ss")
      ("L" . "DD-MM-YYYY")
      ("LL" . "D MMMM YYYY")
      ("LLL" . "D MMMM YYYY LT")
      ("LLLL" . "dddd D MMMM YYYY LT")
      ("l" . "DD-MM-YYYY")
      ("ll" . "D MMMM YYYY")
      ("lll" . "D MMMM YYYY LT")
      ("llll" . "dddd D MMMM YYYY LT"))))

(defmethod get-short-month-name (month format (locale locale-nl))
  (if (equal format "MMM")
      (aref (short-month-names locale) month)
      (aref (short-month-names-dots locale) month)))

(defmethod get-ordinal (number token (locale locale-nl))
  (declare (ignore token locale))
  (format nil "~d." number))

(defmethod make-locale ((class (eql :nl)))
  (make-instance 'locale-nl))