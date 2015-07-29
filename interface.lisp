(in-package :local-time-locale)

(defmethod %get-locale ((name string))
  "We accept either - or _ seperated values in our string and are case
insenstive"
  (%get-locale (intern (substitute #\- #\_ (string-upcase name)) 'keyword)))

(defmethod %shortened-locale ((locale symbol))
  (let ((string (symbol-name locale)))
    (let ((p (position #\- string)))
      (if p (intern (subseq string 0 p) 'keyword)
	  nil))))
    
(defmethod %get-locale ((name symbol))
  (or (gethash name *locale-cache*)
      (let ((new-locale (make-locale name))
	    (shortened-locale (%shortened-locale name)))
	(cond (new-locale
	       (setf (gethash name *locale-cache*) new-locale))
	      (shortened-locale
	       (%get-locale shortened-locale))
	      (t (error "failed to find locale"))))))

(defmacro with-locale (locale-name &rest body)
  `(let* ((*default-locale* (%get-locale ,locale-name)))
     ,@body))

(defun set-locale (locale-name)
  (let ((locale (%get-locale locale-name)))
    (setf *default-locale* locale)))

(defun first-day-of-the-week ()
  (if *default-locale*
      (get-first-day-of-week *default-locale*)
      0))

;; Set the default.  See comment in local-time-locale about the
;; authors nationality.
(set-locale :en-us)