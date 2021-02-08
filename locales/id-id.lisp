(defclass locale-id-id (locale-id) ())

(defmethod make-locale ((class (eql :id-id)))
  (make-instance 'locale-id-id))
