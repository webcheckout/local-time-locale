(in-package :local-time-locale)

(defclass locale-fr-fr (locale-fr) ())

(defmethod make-locale ((class (eql :fr-fr)))
  (make-instance 'locale-fr-fr))
