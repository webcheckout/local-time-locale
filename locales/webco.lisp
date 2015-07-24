(in-package :local-time-locale)

(defclass locale-en-webco (locale-en-us) ()
  (:default-initargs 
   :long-date-formats
		 '(("LT"   . "h:mm A")
		   ("L"    . "MM/DD/YYYY")
		   ("LL"   . "MMMM D, YYYY")
		   ("LLL"  . "LT, MMMM D, YYYY")
		   ("LLLL" . "LT, dddd, MMMM D, YYYY"))))

(defmethod make-locale ((class (eql :en-webco)))
  (make-instance 'locale-en-webco))