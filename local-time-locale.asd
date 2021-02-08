(defpackage :local-time-locale-system (:use #:asdf #:cl))
(in-package :local-time-locale-system)

(defsystem :local-time-locale
  :description "local-time-locale"
  :version "1.2"
  :author "WebCheckout, Inc."
  :license "MIT"
  :depends-on (:local-time :data-types)
  :serial t
  :components
  ((:file "package")
   (:file "conditions")
   (:file "local-time-locale")
   (:module "locales"
	    :components
            ((:file "ar")     ;; Arabia Arabic
	     (:file "ar-ae")  ;; United Arab Emirates Arabic
	     (:file "ar-eg")  ;; Egypt Arabic
	     (:file "ar-ma")  ;; Morocco Arabic
	     (:file "ar-qa")  ;; Qatar Arabic
	     (:file "ar-sa")  ;; Saudi Arabia Arabic
	     (:file "ar-tn")  ;; Tunisia Arabic
	     (:file "da")     ;; Danish
	     (:file "da-dk")  ;; Denmark Danish
	     (:file "de")     ;; German
	     (:file "de-at")  ;; Austria German
	     (:file "de-de")  ;; Germany German
	     (:file "el")     ;; Greek
	     (:file "el-gr")  ;; Greece Greek
	     (:file "en")     ;; English
 	     (:file "en-au")  ;; Australia English
	     (:file "en-ca")  ;; Canada English
	     (:file "en-gb")  ;; Great Britain English
	     ;; (:file "en-hk")  ;; Hong Kong English
	     (:file "en-nz")  ;; New Zealand English
	     (:file "en-us")  ;; United States English
	     (:file "es")     ;; Spanish
	     (:file "es-do")  ;; Dominican Spanish
	     (:file "es-es")  ;; Spain Spanish
	     (:file "es-mx")  ;; Mexico Spanish
	     (:file "es-us")  ;; United States Spanish
	     (:file "fr")     ;; French
	     (:file "fr-ca")  ;; Canada French
	     (:file "fr-fr")  ;; France French
	     (:file "id")     ;; Indonesian 
	     (:file "id-id")  ;; Indonesia Indonesian
	     (:file "it")     ;; Italian 
	     (:file "it-it")  ;; Italy Italian
	     (:file "it-ch")  ;; Switzerland Italian
	     (:file "ja")     ;; Japanese
	     (:file "ja-jp")  ;; Japan Japanese
	     (:file "ko")     ;; Korean
	     (:file "ko-kr")  ;; Republic of Korea Korean
	     (:file "nb")     ;; Bokmål
	     (:file "nb-no")  ;; Norway Bokmål
	     (:file "nl")     ;; Dutch
	     (:file "nl-nl")  ;; Netherlands Dutch
	     (:file "nn")     ;; Norwegian
 	     (:file "nn-no")  ;; Norway Norwegian
	     (:file "pt")     ;; Portuguese
	     (:file "pt-br")  ;; Brazil Portuguese
	     (:file "pt-pt")  ;; Portual Portuguese
	     (:file "ro")     ;; Romanian
	     (:file "ro-ro")  ;; Romania Romanian
	     (:file "sv")     ;; Swedish
	     (:file "sv-se")  ;; Sweden Swedish
	     (:file "zh")     ;; Chinese
	     (:file "zh-cn")  ;; Peoples Republic of China Chinese
	     ; (:file "zn-hk")  ;; Hong Kong Chinese
	     (:file "zh-tw")));; Taiwan Chinese
   (:file "format")
   (:file "parse")
   (:file "interface")))
