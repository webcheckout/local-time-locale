(in-package :local-time-locale)

(defclass locale-pt-pt (locale-pt) ())

(defmethod make-locale ((class (eql :pt-pt)))
  (make-instance 'locale-pt-pt))