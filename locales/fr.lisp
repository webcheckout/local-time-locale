(in-package :local-time-locale)

(defclass locale-fr (locale) ())

(defmethod make-locale ((class (eql :fr)))
  (make-instance 'locale-fr
		 :first-day-of-week 1

		 :month-names
		 #("" "janvier" "février" "mars" "avril" "mai" "juin" "juillet"
                        "août" "septembre" "octobre" "novembre" "décembre")
		 :short-month-names
		 #("" "janv." "févr." "mars" "avr." "mai" "juin" "juil." "août"
                        "sept." "oct." "nov." "déc.")
		 :weekday-names
		 #("dimanche" "lundi" "mardi" "mercredi" "jeudi" "vendredi" "samedi")
		 :short-weekday-names
		 #("dim." "lun." "mar." "mer." "jeu." "ven." "sam.")
		 :minimal-weekday-names
		 #("Di" "Lu" "Ma" "Me" "Je" "Ve" "Sa")
		 
		 :long-date-formats
		 '(("LT"   . "HH:mm")
		   ("L"    . "DD/MM/YYYY")
		   ("LL"   . "D MMMM YYYY")
		   ("LLL"  . "D MMMM YYYY LT")
		   ("LLLL" . "dddd D MMMM YYYY LT"))))

(defmethod get-ordinal (number token (locale locale-fr))
  (declare (ignore token locale))
  (if (= number 1)
      (format nil "~der" number)
      number))