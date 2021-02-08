(in-package :local-time-locale)

(defclass locale-el (locale)
  ((month-names-genative :reader month-names-genative
			 :initform  #("" "Ιανουαρίου" "Φεβρουαρίου" "Μαρτίου" "Απριλίου" "Μαΐου" "Ιουνίου"
				      "Ιουλίου" "Αυγούστου" "Σεπτεμβρίου" "Οκτωβρίου" "Νοεμβρίου" "Δεκεμβρίου")))
  (:default-initargs
   :first-day-of-week 1
    :month-names
    #("" "Ιανουάριος" "Φεβρουάριος" "Μάρτιος" "Απρίλιος" "Μάιος" "Ιούνιος" "Ιούλιος"
      "Αύγουστος" "Σεπτέμβριος" "Οκτώβριος" "Νοέμβριος" "Δεκέμβριος")
    :short-month-names
    #("" "Ιαν" "Φεβ" "Μαρ" "Απρ" "Μαϊ" "Ιουν" "Ιουλ" "Αυγ" "Σεπ" "Οκτ" "Νοε" "Δεκ")
    :weekday-names
    #("Κυριακή" "Δευτέρα" "Τρίτη" "Τετάρτη" "Πέμπτη" "Παρασκευή" "Σάββατο")
    :short-weekday-names
    #("Κυρ" "Δευ" "Τρι" "Τετ" "Πεμ" "Παρ" "Σαβ")
    :minimal-weekday-names
    #("Κυ" "Δε" "Τρ" "Τε" "Πε" "Πα" "Σα")
    
    :long-date-formats
    '(("LT"   . "h:mm A")
      ("L"    . "DD/MM/YYYY")
      ("LL"   . "D MMMM YYYY")
      ("LLL"  . "D MMMM YYYY LT")
      ("LLLL" . "dddd, D MMMM YYYY LT"))))
	 
(defmethod get-ordinal (number token (locale locale-el))
  (declare (ignore token locale))
  (format nil "~dη" number))

(defmethod get-meridiem (hour minute upcase (locale locale-el))
  (declare (ignore locale))
  (if (> hour 11)
      (if upcase "ΜΜ" "μμ")
      (if upcase "ΠΜ" "πμ")))

(defmethod get-month-name (month format (locale locale-el))
  (if (and format
	   (search "D" format :end2 (search "MMMM" format)))
      (aref (month-names-genative locale) month)
      (aref (month-names locale) month)))

(defmethod meridiems ((locale locale-el))
  `(("μμ" ,#'%pm-conversion)
    ("ΜΜ" ,#'%pm-conversion)
    ("πμ" ,#'%am-conversion)
    ("ΠΜ" ,#'%am-conversion)))

(defmethod make-locale ((class (eql :el)))
  (make-instance 'locale-el))

