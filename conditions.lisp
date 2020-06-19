(in-package :local-time-locale)

(define-condition local-time-locale-condition (condition)
  ((format :reader error-format
           :initarg :format
           :initform nil)
   (args   :reader error-args
           :initarg :args
           :initform nil))
  (:report (lambda (condition stream)
	     (apply #'format stream (error-format condition) (error-args condition)))))

(define-condition local-time-locale-error (error local-time-locale-condition)
  ())

(define-condition undefined-locale-error (local-time-locale-error)
  ())

(defun undefined-locale-error (format &rest args)
  (error 'undefined-locale
         :format format
         :args   args))

(define-condition parsing-error (local-time-locale-error)
  ())

(defun parsing-error (format &rest args)
  (error 'parsing-error
         :format format
         :args   args))

(define-condition meridiem-error (local-time-locale-error)
  ())

(defun meridiem-error (format &rest args)
  (error 'meridiem-error
         :format format
         :args   args))
