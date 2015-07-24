(in-package :local-time-locale)

(defclass locale-sv-se (locale-sv) ())

(defmethod make-locale ((class (eql :sv-se)))
  (make-instance 'locale-sv-se))
