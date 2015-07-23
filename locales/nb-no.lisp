(defclass locale-nb-no (locale-nb) ())

(defmethod make-locale ((class (eql :nb-no)))
  (make-instance 'locale-nb-no))