(defclass locale-de-de (locale-de) ())

(defmethod make-locale ((class (eql :de-de)))
  (make-instance 'locale-de-de))