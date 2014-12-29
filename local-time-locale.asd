(defpackage :local-time-locale-system (:use #:asdf #:cl))
(in-package :local-time-locale-system)

(defsystem :local-time-locale
    :description "local-time-locale"
    :version "1.0"
    :author "WebCheckout, Inc."
    :license "MIT"
    :depends-on (:local-time)
    :serial t
    :components
    ((:file "package")
     (:file "local-time-locale")
     (:file "format")
     (:module "locales"
	      :components
              ((:file "en-au")
	       (:file "en-ca")
	       (:file "en-gb")
	       (:file "es")
	       (:file "fr")
	       (:file "fr-ca")
	       (:file "ko")
	       (:file "pt")
	       (:file "pt-bt")
	       (:file "zh-cn")
	       (:file "zh-tw")))))