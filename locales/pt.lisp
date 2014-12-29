(in-package :local-time-locale)

(defclass locale-pt (locale) ())

(defmethod make-locale ((class (eql :pt)))
  (make-instance 'locale-pt
		 :first-day-of-week 1

		 :month-names
		 #("" "janeiro" "fevereiro" "março" "abril" "maio" "junho" "julho"
		   "agosto" "setembro" "outubro" "novembro" "dezembro")
		 :short-month-names
		 #("" "jan" "fev" "mar" "abr" "mai" "jun" "jul" "ago" "set" "out"
		   "nov" "dez")
		 :weekday-names
		 #("domingo" "segunda-feira" "terça-feira" "quarta-feira"
		   "quinta-feira" "sexta-feira" "sábado")
		 :short-weekday-names
		 #("dom" "seg" "ter" "qua" "qui" "sex" "sáb")
		 :minimal-weekday-names
		 #("dom" "2ª" "3ª" "4ª" "5ª" "6ª" "sáb")
		 
		 :long-date-formats
		 '(("LT"   . "HH:mm")
		   ("L"    . "DD/MM/YYYY")
		   ("LL"   . "D [de] MMMM [de] YYYY")
		   ("LLL"  . "D [de] MMMM [de] YYYY LT")
		   ("LLLL" . "dddd, D [de] MMMM [de] YYYY LT"))))

(defmethod get-ordinal (number token (locale locale-pt))
  (declare (ignore token locale))
  (format nil "~dº" number))