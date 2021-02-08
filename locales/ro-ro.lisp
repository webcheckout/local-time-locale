(defclass locale-ro-ro (locale-ro) ())

(defmethod make-locale ((class (eql :ro-ro)))
  (make-instance 'locale-ro-ro))
