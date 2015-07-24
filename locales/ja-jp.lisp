(defclass locale-ja-jp (locale-ja) ())

(defmethod make-locale ((class (eql :ja-jp)))
  (make-instance 'locale-ja-jp))