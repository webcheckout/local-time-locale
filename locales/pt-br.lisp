(in-package :local-time-locale)

(defmethod make-locale ((class (eql :pt-br)))
  (make-instance 'locale-pt
		 :first-day-of-week 0))