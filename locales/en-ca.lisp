(in-package :local-time-locale)

(defclass locale-en-ca (locale-en) ()
  (:default-initargs
    :long-date-formats
      '(("LT"   . "h:mm A")
	("L"    . "YYYY-MM-DD")
	("LL"   . "D MMMM, YYYY")
	("LLL"  . "D MMMM, YYYY LT")
	("LLLL" . "dddd, D MMMM, YYYY LT"))))

(defmethod make-locale ((class (eql :en-ca)))
  (make-instance 'locale-en-ca))
		