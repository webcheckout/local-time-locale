(in-package :local-time-locale)

(defclass locale-en-au (locale-en) ()
  (:default-initargs
   :long-date-formats
      '(("LT"   . "h:mm A")
	("L"    . "DD/MM/YYYY")
	("LL"   . "D MMMM YYYY")
	("LLL"  . "D MMMM YYYY LT")
	("LLLL" . "dddd, D MMMM YYYY LT"))))

(defmethod make-locale ((class (eql :en-au)))
  (make-instance 'locale-en-au))
		