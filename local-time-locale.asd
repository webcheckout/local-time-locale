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
     (:module "locales"
	      :components
              ((:file "en")
	       (:file "en-au")
	       (:file "en-ca")
	       (:file "en-gb")
	       (:file "en-us")
	       (:file "es")
	       (:file "es-es")
	       (:file "fr")
	       (:file "fr-ca")
	       (:file "fr-fr")
	       (:file "ko")
	       (:file "ko-kr")
	       (:file "pt")
	       (:file "pt-br")
	       (:file "pt-pt")
	       (:file "zh")
	       (:file "zh-cn")
	       (:file "zh-tw")))
         (:file "format")
         (:file "interface")))