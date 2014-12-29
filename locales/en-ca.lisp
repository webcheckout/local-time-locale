(in-package :local-time-locale)

(defmethod make-locale ((class (eql :en-ca)))
  (make-instance 'locale-en
		 :long-date-formats
		 '(("LT"   . "h:mm A")
		   ("L"    . "YYYY-MM-DD")
		   ("LL"   . "D MMMM, YYYY")
		   ("LLL"  . "D MMMM, YYYY LT")
		   ("LLLL" . "dddd, D MMMM, YYYY LT"))))