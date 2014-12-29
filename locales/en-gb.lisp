(in-package :local-time-locale)

(defmethod make-locale ((class (eql :en-gb)))
  (make-instance 'locale-en
		 :long-date-formats
		 '(("LT"   . "HH:mm")
		   ("L"    . "DD/MM/YYYY")
		   ("LL"   . "D MMMM YYYY")
		   ("LLL"  . "D MMMM YYYY LT")
		   ("LLLL" . "dddd, D MMMM YYYY LT"))))