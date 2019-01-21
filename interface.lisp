(in-package :local-time-locale)

(defmethod %get-locale ((name string) &key (on-none :error))
  "We accept either - or _ seperated values in our string and are case
insenstive"
  (%get-locale (intern (substitute #\- #\_ (string-upcase name)) 'keyword) :on-none on-none))

(defmethod %shortened-locale ((locale symbol))
  (let ((string (symbol-name locale)))
    (let ((p (position #\- string)))
      (if p (intern (subseq string 0 p) 'keyword)
	  nil))))
    
(defmethod %get-locale ((name symbol) &key (on-none :error))
  (or (gethash name *locale-cache*)
      (let ((new-locale (make-locale name))
	    (shortened-locale (%shortened-locale name)))
	(cond (new-locale
	       (setf (gethash name *locale-cache*) new-locale))
	      (shortened-locale
	       (%get-locale shortened-locale :on-none on-none))
	      (t (cond
		   ((eq on-none :error)
		    (error (format nil "failed to find locale ~S"  name)))
		   ((eq on-none :warn)
		    (warn (format nil "failed to find locale ~S"  name)))
		   ((eq on-none :silent)
		    ;; no-op
		    )
		   (t
		    (error (format nil "failed to find locale ~S"  name)))))))))

;; attempts to set th default local if it can be found.  
(defmacro with-locale (locale-name &rest body)  
  `(let* ((*default-locale* (or (%get-locale ,locale-name :on-none :warn)
				*default-locale*)))
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
