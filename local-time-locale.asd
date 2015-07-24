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
              (; (:file "ar")     ;; Saudi Arabia Arabic
	      ; (:file "ar-ae")  ;; United Arab Emirates Arabic
	      ; (:file "ar-eg")  ;; Egypt Arabic
	      ; (:file "ar-ma")  ;; Morocco Arabic
	      ; (:file "ar-qa")  ;; Qatar Arabic
	      ; (:file "ar-sa")  ;; Saudi Arabia Arabic
	      ; (:file "ar-tn")  ;; Tunisia Arabic
	       (:file "da")     ;; Denmark Danish
	       (:file "da-dk")  ;; Denmark Danish
	       (:file "de")     ;; Germany German
	       (:file "de-at")  ;; Austria German
	       (:file "de-de")  ;; Germany German
	       (:file "en")     ;; United States English
 	       (:file "en-au")  ;; Australia English
	       (:file "en-ca")  ;; Canada English
	       (:file "en-gb")  ;; Great Britain English
	      ; (:file "en-hk")  ;; Hong Kong English
	       (:file "en-us")  ;; United States English
	       (:file "es")     ;; Spain Spanish
	       (:file "es-es")  ;; Spain Spanish
	       (:file "fr")     ;; France French
	       (:file "fr-ca")  ;; Canada French
	       (:file "fr-fr")  ;; France French
	       (:file "ja")     ;; Japanese
	       (:file "ja-jp")  ;; Japan Japanese
	       (:file "ko")     ;; Republic of Korea Korean
	       (:file "ko-kr")  ;; Republic of Korea Korean
	       (:file "nb")     ;; Norway Bokmål
	       (:file "nb-no")  ;; Norway Bokmål
	       (:file "nl")     ;; Netherlands Dutch
	       (:file "nl-nl")  ;; Netherlands Dutch
	       (:file "nn")     ;; Norway Norwegian
 	       (:file "nn-no")  ;; Norway Norwegian
	       (:file "pt")     ;; Portual Portuguese
	       (:file "pt-br")  ;; Brazil Portuguese
	       (:file "pt-pt")  ;; Portual Portuguese
	       (:file "sv")     ;; Sweden Swedish
	       (:file "sv-se")  ;; Sweden Swedish
	       (:file "zh")     ;; Peoples Republic of China Chinese
	       (:file "zh-cn")  ;; Peoples Republic of China Chinese
	      ; (:file "zn-hk")  ;; Hong Kong Chinese
	       (:file "zh-tw")));; Taiwan Chinese
         (:file "format")
         (:file "interface")))