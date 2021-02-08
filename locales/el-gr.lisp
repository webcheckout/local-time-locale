(in-package :local-time-locale)

(defclass locale-el-gr (locale-el) ())

(defmethod make-locale ((class (eql :el-gr)))
  (make-instance 'locale-el-gr))
