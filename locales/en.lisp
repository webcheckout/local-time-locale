(in-package :local-time-locale)

(defclass locale-en (locale) ())

(defmethod make-locale ((class (eql :en)))
  (make-instance 'locale-en))
