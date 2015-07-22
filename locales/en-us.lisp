(in-package :local-time-locale)

(defclass locale-en-us (locale-en) ())

(defmethod make-locale ((class (eql :en-us)))
  (make-instance 'locale-en-us))