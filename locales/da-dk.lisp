(in-package :local-time-locale)

(defclass locale-da-dk (locale-da) ())

(defmethod make-locale ((class (eql :da-dk)))
  (make-instance 'locale-da-dk))