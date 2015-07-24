(in-package :local-time-locale)

(defclass locale-zh-cn (locale-zh) ())

(defmethod make-locale ((class (eql :zh-cn)))
  (make-instance 'locale-zh-cn))