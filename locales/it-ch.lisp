(defclass locale-it-ch (locale-it) ()
    (:default-initargs
     :long-date-formats
	'(("LT"   . "HH:mm")
	  ("L"    . "DD.MM.YYYY")
	  ("LL"   . "D MMMM YYYY")
	  ("LLL"  . "D MMMM YYYY HH:mm")
	  ("LLLL" . "dddd D MMMM YYYY HH:mm")
	  ("l"    . "DD.MM.YYYY")
	  ("ll"   . "D MMMM YYYY")
	  ("lll"  . "D MMMM YYYY HH:mm")
	  ("llll" . "dddd D MMMM YYYY HH:mm"))))

(defmethod make-locale ((class (eql :it-ch)))
  (make-instance 'locale-it-ch))
