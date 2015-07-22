(in-package :local-time-locale)

(defclass locale-es-es (locale-es) ())

(defmethod make-locale ((class (eql :es-es)))
  (make-instance 'locale-es-es))
