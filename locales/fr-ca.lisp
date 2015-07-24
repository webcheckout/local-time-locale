(in-package :local-time-locale)

(defclass locale-fr-ca (locale-fr) ()
  (:default-initargs
   :first-day-of-week 0
    :long-date-formats
    '(("LT"   . "HH:mm")
      ("L"    . "YYYY-MM-DD")
      ("LL"   . "D MMMM YYYY")
      ("LLL"  . "D MMMM YYYY LT")
      ("LLLL" . "dddd D MMMM YYYY LT"))))

(defmethod make-locale ((class (eql :fr-ca)))
  (make-instance 'locale-fr-ca))
		 