(in-package :local-time-locale)

(defvar *formatting-tokens*  "(\\[[^\\[]*\\])|(\\\\)?(Mo|MM?M?M?|Do|DDDo|DD?D?D?|ddd?d?|do?|w[o|w]?|W[o|W]?|Q|YYYYYY|YYYYY|YYYY|YY|gg(ggg?)?|GG(GGG?)?|e|E|a|A|hh?|HH?|mm?|ss?|S{1,4}|X|zz?|ZZ?|.)")

(defparameter *local-formatting-tokens*  "(\\[[^\\[]*\\])|(\\\\)?(LT|LL?L?L?|l{1,4})")

(defvar *format-functions* (make-hash-table :test 'equal))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FORMAT'S INTERFACE TO THE LOCALE OBJECTS

(defun month-name (month format &key (locale *default-locale*))
  (get-month-name month format locale))

(defun short-month-name (month format &key (locale *default-locale*))
  (get-short-month-name month format locale))

(defun weekday-name (dow format &key (locale *default-locale*))
  (get-weekday-name dow format locale))

(defun short-weekday-name (dow format &key (locale *default-locale*))
  (get-short-weekday-name dow format locale))

(defun min-weekday-name (dow format &key (locale *default-locale*))
  (get-min-weekday-name dow format locale))

(defun meridiem (hour minute upcase &key (locale *default-locale*))
  (get-meridiem hour minute upcase locale))

(defun ordinal (number token &key (locale *default-locale*))
  (get-ordinal number token locale))

(defun day-of-week (dow  &key (locale *default-locale*))
  (let ((fdow (get-first-day-of-week locale)))
    (mod (- (+ 7 dow) fdow) 7)))

(defun day-of-year (timestamp  &key (locale *default-locale*))
  ;; is this right?  Don't we need to concider the locale start of
  ;; year?
  (declare (ignore locale))
  (let ((start-of-day  (local-time::timestamp-minimize-part timestamp :hour))
	(start-of-year (local-time::timestamp-minimize-part timestamp :month)))
    (+ (- (local-time:day-of start-of-day)
	  (local-time:day-of start-of-year)) 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FORMAT FUNCTIONS  

(defmacro define-format-function ((key &key padded ordinal) &body body)
  `(progn
     (setf (gethash ,key *format-functions*)
	   (lambda (out timestamp nsec sec minute hour day month year weekday daylight-p offset abbrev format)
	     (declare #+sbcl (sb-ext:muffle-conditions style-warning))
	     ,@body))
     ,@(when padded
	     `((setf (gethash ,(format nil "~a~a" key key) *format-functions*)
		     (lambda (out timestamp nsec sec minute hour day month year weekday daylight-p offset abbrev format)
		       (declare #+sbcl (sb-ext:muffle-conditions style-warning))
		       (format nil "~2,'0d" ,@body)))))
     ,@(when ordinal
	     `((setf (gethash ,(format nil "~ao" key) *format-functions*)
		     (lambda (out timestamp nsec sec minute hour day month year weekday daylight-p offset abbrev format)
		       (declare #+sbcl (sb-ext:muffle-conditions style-warning))
		       (ordinal ,@body format)))))))

(define-format-function ("M" :ordinal t :padded t)
  month)

(define-format-function ("MMM")
  (short-month-name month format))

(define-format-function ("MMMM")
  (month-name month format))

(define-format-function ("D" :ordinal t :padded t)
  day)

(define-format-function ("DDD" :ordinal t)
   (day-of-year timestamp))

(define-format-function ("DDDD" :ordinal t)
   (format nil "~3,'0d" (day-of-year timestamp)))

(define-format-function ("d" :ordinal t)
    weekday)

(define-format-function ("dd")
    (min-weekday-name weekday format))

(define-format-function ("ddd")
    (short-weekday-name weekday format))

(define-format-function ("dddd")
    (weekday-name weekday format))

(define-format-function ("YY")
    (format nil "~2,'0d" (mod year 100)))

(define-format-function ("YYYY")
    (format nil "~4,'0d" year))

(define-format-function ("YYYYY")
    (format nil "~5,'0d" year))

(define-format-function ("YYYYYY")
  (format nil "~:[+~;-~]~6,'0d" year (abs year)))

(define-format-function ("e")
  (day-of-week weekday))

(define-format-function ("E")
  (if day day 7))

(define-format-function ("a")
  (meridiem hour minute nil))

(define-format-function ("A")
  (meridiem hour minute t))

(define-format-function ("H" :padded t)
  hour)

(define-format-function ("h" :padded t)
    (1+ (mod (1- hour) 12)))

(define-format-function ("m" :padded t)
    minute)

(define-format-function ("s" :padded t)
    sec)

(define-format-function ("S")
    (floor nsec 10000000))

(define-format-function ("SS")
    (format nil "~2,'0d" (floor nsec 10000000)))

(define-format-function ("SSS")
    (format nil "~3,'0d" (floor nsec 1000000)))

(define-format-function ("SSSS")
    (format nil "~3,'0d" (floor nsec 1000000)))

(defun %format-offset (offset colon-p)
  (multiple-value-bind (offset-hours offset-secs)
      (floor offset local-time::+seconds-per-hour+)
    (declare (fixnum offset-hours offset-secs))
    (format nil"~c~2,'0d~:[:~;~]~2,'0d"
	    (if (minusp offset-hours) #\- #\+)
	    (abs offset-hours)
	    colon-p
	    (truncate (abs offset-secs)
		      local-time::+seconds-per-minute+))))

(define-format-function ("Z")
    (%format-offset offset t))

(define-format-function ("ZZ")
    (%format-offset offset nil))

;; this format token is deprecated in Moment.js
(define-format-function ("z")
    abbrev)

;; zz  Not implemented, deprecated in Moment.js

(define-format-function ("X")
    (local-time::timestamp-to-unix timestamp))

(define-format-function ("Q")
    (ceiling month 3))

;; TODO: The following format directives have yet to be implemented
;;

;; w :ordinal t :padded t
;;  return this.week();

;; W :ordinal t :padded t
;;  return this.isoWeek();

;; gg
;;   return leftZeroFill(this.weekYear() % 100, 2);

;; gggg
;;   return leftZeroFill(this.weekYear(), 4);

;; ggggg
;;   return leftZeroFill(this.weekYear(), 5);

;; GG
;;   return leftZeroFill(this.isoWeekYear() % 100, 2);

;; GGGG
;;   return leftZeroFill(this.isoWeekYear(), 4);

;; GGGGG
;;   return leftZeroFill(this.isoWeekYear(), 5);

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FORMAT STRING HANDLING AND TIMESTAMP FORMATING

(defun lookup-long-date-format (key locale)
  (cdr (assoc key (long-date-formats locale) :test 'string=)))

(defun trim-downcased-long-format (format)
  (when format
    (cl-ppcre::regex-replace-all "MMMM|MM|DD|dddd"
				 format
				 (lambda (x s e ms me rs re)
				   (declare (ignore s e rs re))
				   (subseq x ms (- me 1))))))

(defun long-date-format (key locale)
  (expand-format
   (or (lookup-long-date-format key locale)
       (trim-downcased-long-format (lookup-long-date-format (string-upcase key) locale)))
   locale))

(defun expand-format (format locale)
  (when format
    (or (dt::get (format-lru locale) format)
	(let ((ex-format (cl-ppcre::regex-replace-all *local-formatting-tokens* format
					   (lambda (x s e ms me rs re)
					     (declare (ignore s e rs re))
					     (let ((match (subseq x  ms me)))
					       (if (char= (char match 0) #\[)
						   match
						   (long-date-format match locale)))))))
	  (dt::set (format-lru locale) format ex-format)
	  ex-format))))

(defun my-funcall (function out timestamp nsec sec minute hour day month year weekday daylight-p offset abbrev format)
  (funcall function out timestamp nsec sec minute hour day month year weekday daylight-p offset abbrev format))

(defvar *token-lru* (make-instance 'dt::lru :max-size 10))

(defun %tokenize-format (format)
  (when format
    (or (dt::get *token-lru* format)
	(let ((tokens (cl-ppcre::all-matches-as-strings ltl::*formatting-tokens* format)))
	  (dt::set *token-lru* format tokens)
	  tokens))))
  
(defun format-timestamp (timestamp format &key (timezone local-time::*default-timezone*) (locale *default-locale*))
  (multiple-value-bind (nsec sec minute hour day month year weekday daylight-p offset abbrev)
      (local-time::decode-timestamp timestamp :timezone timezone)
    (let ((string (expand-format format locale)))
      (with-output-to-string (out)
	(dolist (token (%tokenize-format string))
	  (let ((function (gethash token *format-functions*)))
	    (if function
		(princ (funcall function out timestamp nsec sec minute hour day month year weekday daylight-p offset abbrev format) out)
		(let ((l (length token)))
		  (if (and
		       (char= #\[ (schar token 0))
		       (char= #\] (schar token (1- l))))
		    (princ (subseq token 1 (1- l)) out)
		    (princ token out))))))))))




    
       
