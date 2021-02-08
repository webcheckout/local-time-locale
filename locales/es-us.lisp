(in-package :local-time-locale)

(defclass locale-es-us (locale-es) ()
  (:default-initargs
   :first-day-of-week 0
    :long-date-formats
    '(("LT"   . "h:mm A")
      ("L"    . "MM/DD/YYYY")
      ("LL"   . "D [de] MMMM [de] YYYY")
      ("LLL"  . "D [de] MMMM [de] YYYY LT")
      ("LLLL" . "dddd, D [de] MMMM [de] YYYY LT"))))

(defmethod make-locale ((class (eql :es-us)))
  (make-instance 'locale-es-us))
