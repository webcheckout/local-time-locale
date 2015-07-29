(in-package :local-time-locale)

(defclass locale-en-gb (locale-en) ()
  (:default-initargs
   :first-day-of-week 1
   :long-date-formats
      '(("LT"   . "HH:mm")
	("L"    . "DD/MM/YYYY")
	("LL"   . "D MMMM YYYY")
	("LLL"  . "D MMMM YYYY LT")
	("LLLL" . "dddd, D MMMM YYYY LT"))))

(defmethod make-locale ((class (eql :en-gb)))
  (make-instance 'locale-en-gb))