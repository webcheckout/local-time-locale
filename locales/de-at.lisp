(in-package :local-time-locale)

(defclass locale-de-at (locale-de)
  ()
  (:default-initargs
   :month-names
      #("" "Jänner" "Februar" "März" "April" "Mai" "Juni" "Juli"
	"August" "September" "Oktober" "November" "Dezember")
    :short-month-names
    #("" "Jän." "Febr." "Mrz." "Apr." "Mai" "Jun." "Jul." "Aug." "Sept." "Okt." "Nov." "Dez.")))

(defmethod make-locale ((class (eql :de-at)))
  (make-instance 'locale-de-at))