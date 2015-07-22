(in-package :local-time-locale)

(defclass locale-ko-kr (locale-ko) ())

(defmethod make-locale ((class (eql :ko-kr)))
  (make-instance 'locale-ko-kr))