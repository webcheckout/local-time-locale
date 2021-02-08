(in-package :local-time-locale)

(defclass locale-es-do (locale-es) ()
  (:default-initargs
   :long-date-formats
    '(("LT"   . "h:mm A")
      ("L"    . "DD/MM/YYYY")
      ("LL"   . "D [de] MMMM [de] YYYY")
      ("LLL"  . "D [de] MMMM [de] YYYY LT")
      ("LLLL" . "dddd, D [de] MMMM [de] YYYY LT"))))

(defmethod make-locale ((class (eql :es-do)))
  (make-instance 'locale-es-do))
