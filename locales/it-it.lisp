(defclass locale-it-it (locale-it) ())

(defmethod make-locale ((class (eql :it-it)))
  (make-instance 'locale-it-it))
