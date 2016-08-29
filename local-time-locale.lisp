(in-package :local-time-locale)

(defparameter *default-locale* nil)

(defparameter *locale-cache* (make-hash-table))

(defclass locale ()
  ((first-day-of-week  :reader get-first-day-of-week
		       :initarg :first-day-of-week
		       :initform 0)
   
   (month-names :accessor month-names
		:initarg :month-names
		:initform
		#("" "January" "February" "March" "April"
		  "May" "June" "July" "August" "September"
		  "October" "November" "December"))
   
   (short-month-names  :accessor short-month-names
		       :initarg :short-month-names
		       :initform
		       #("" "Jan" "Feb" "Mar" "Apr" "May" "Jun"
			 "Jul" "Aug" "Sep" "Oct" "Nov" "Dec"))
   
   (weekday-names          :accessor weekday-names
			   :initarg :weekday-names
			   :initform
			   #("Sunday" "Monday" "Tuesday" "Wednesday"
			     "Thursday" "Friday" "Saturday"))
   
   (short-weekday-names    :accessor short-weekday-names
			   :initarg :short-weekday-names
			   :initform
			   #("Sun" "Mon" "Tue" "Wed" "Thu" "Fri" "Sat"))
   
   (minimal-weekday-names :accessor minimal-weekday-names
			  :initarg :minimal-weekday-names
			  :initform
			  #("Su" "Mo" "Tu" "We" "Th" "Fr" "Sa"))
   
   (long-date-formats      :accessor long-date-formats
			   :initarg :long-date-formats
			   :initform '(("LT"   . "h:mm A")
				       ("L"    . "MM/DD/YYYY")
				       ("LL"   . "MMMM D, YYYY")
				       ("LLL"  . "MMMM D, YYYY LT")
				       ("LLLL" . "dddd, MMMM D, YYYY LT")))

   (format-lru             :accessor format-lru
			   :initform  (make-instance 'dt::lru :max-size 10))))

(defmethod get-month-name (month format (locale locale))
  (aref (month-names locale) month))

(defmethod get-short-month-name (month format (locale locale))
   (aref (short-month-names locale) month))

(defmethod get-weekday-name (dow format (locale locale))
   (aref (weekday-names locale) dow))

(defmethod get-short-weekday-name (dow format (locale locale))
   (aref (short-weekday-names locale) dow))

(defmethod get-min-weekday-name (dow format (locale locale))
  (declare (ignore format))
  (aref (minimal-weekday-names locale) dow))

(defmethod get-meridiem (hour minute upcase (locale locale))
  (declare (ignore minute locale))
  (if upcase
      (if (< hour 12) "AM" "PM")
      (if (< hour 12) "am" "pm")))

(defmethod get-ordinal (number format (locale locale))
  (declare (ignore format locale))
  (format nil "~d~a" number
          (if (<= 11 number 13)
              "th"
              (case (mod number 10)
                (1 "st")
                (2 "nd")
                (3 "rd")
                (t "th")))))
 
(defmethod post-format (string (locale locale))
  string)

(defmethod get-long-date-format (key (locale locale))
  (cdr (assoc key (long-date-formats locale) :test 'string=)))

(defmethod set-long-date-format (key (locale locale) string)
  (setf (cdr (assoc key (long-date-formats locale) :test 'string=)) string)) 

(defmethod make-locale (name)
  nil)

(defvar *locales* (make-hash-table :test #'equal))

(defmethod register-locale (name label class)
  ;; this should eventually replace the subclass make-locale calls
  (declare (ignore class))
  (setf (gethash name *locales*) label))
  
