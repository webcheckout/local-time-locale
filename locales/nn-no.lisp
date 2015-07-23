(defclass locale-nn-no (locale-nn) ())

(defmethod make-locale ((class (eql :nn-no)))
  (make-instance 'locale-nn-no))