(in-package :local-time-locale)

(defclass locale-pt-by (locale-pt) ()
  (:default-initargs   
   :first-day-of-week 0))

(defmethod make-locale ((class (eql :pt-br)))
  (make-instance 'locale-pt-br))