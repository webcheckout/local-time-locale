(in-package :local-time-locale)

(defmethod make-locale ((class (eql :webco)))
  (make-instance 'locale-en
		 :long-date-formats
		 '(("LT"   . "h:mm A")
		   ("L"    . "MM/DD/YYYY")
		   ("LL"   . "MMMM D, YYYY")
		   ("LLL"  . "LT, MMMM D, YYYY")
		   ("LLLL" . "LT, dddd, MMMM D, YYYY"))))