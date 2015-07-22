(in-package :local-time-locale)

(defun language-tag-delimiterp (c) (or (char= c #\-) (char= c #\_)))

(defun split-string (string &key (delimiterp #'language-tag-delimiterp))
  (loop :for beg = (position-if-not delimiterp string)
    :then (position-if-not delimiterp string :start (1+ end))
    :for end = (and beg (position-if delimiterp string :start beg))
    :when beg :collect (subseq string beg end)
    :while end))

(defmethod %get-locale ((name string))
  (%get-locale (intern (string-upcase name) 'keyword)))

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

;; Set the default.  See comment in local-time-locale about the
;; authors nationality.
(set-locale :en-us)