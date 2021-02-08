(in-package :local-time-locale)

(defclass locale-es-mx (locale-es) ()
  (:default-initargs
   :first-day-of-week 0))

(defmethod make-locale ((class (eql :es-mx)))
  (make-instance 'locale-es-mx))
