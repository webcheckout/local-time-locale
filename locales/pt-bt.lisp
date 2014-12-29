(in-package :local-time-locale)

(defmethod make-locale ((class (eql :pt-bz)))
  (make-instance 'locale-pt
		 :first-day-of-week 0))