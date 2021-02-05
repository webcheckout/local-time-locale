(in-package :local-time-locale)

(defclass locale-it (locale)
  ()
  (:default-initargs
    :first-day-of-week 1
    :month-names
    #("" "gennaio" "febbraio" "marzo" "aprile" "maggio" "giugno" "luglio" "agosto" "settembre" "ottobre" "novembre" "dicembre")
    :short-month-names
    #("" "gen" "feb" "mar" "apr" "mag" "giu" "lug" "ago" "set" "ott" "nov" "dic")
    :weekday-names
    #("domenica" "lunedì" "martedì" "mercoledì" "giovedì" "venerdì" "sabato")
    :short-weekday-names
    #("dom" "lun" "mar" "mer" "gio" "ven" "sab")
    :minimal-weekday-names
    #("do" "lu" "ma" "me" "gi" "ve" "sa")
    
    :long-date-formats
    '(("LT"   . "HH:mm")
      ("L"    . "DD/MM/YYYY")
      ("LL"   . "D MMMM YYYY")
      ("LLL"  . "D MMMM YYYY HH:mm")
      ("LLLL" . "dddd D MMMM YYYY HH:mm")
      ("l"    . "DD/MM/YYYY")
      ("ll"   . "D MMMM YYYY")
      ("lll"  . "D MMMM YYYY HH:mm")
      ("llll" . "dddd D MMMM YYYY HH:mm"))))

(defmethod get-ordinal (number token (locale locale-it))
  (declare (ignore locale token))
  (format nil "~Aº" number))

(defmethod make-locale ((class (eql :it)))
  (make-instance 'locale-it))
