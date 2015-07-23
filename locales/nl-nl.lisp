(in-package :local-time-locale)

(defclass locale-nl-nl (locale-nl) ())

(defmethod make-locale ((class (eql :nl-nl)))
  (make-instance 'locale-nl-nl))