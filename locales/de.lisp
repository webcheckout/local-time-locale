(in-package :local-time-locale)

(defclass locale-de (locale)
  ()
  (:default-initargs
   :first-day-of-week 1
    :month-names
    #("" "Januar" "Februar" "März" "April" "Mai" "Juni" "Juli"
      "August" "September" "Oktober" "November" "Dezember")
    :short-month-names
    #("" "Jan." "Febr." "Mrz." "Apr." "Mai" "Jun." "Jul." "Aug." "Sept." "Okt." "Nov." "Dez.")
    :weekday-names
    #("Sonntag" "Montag" "Dienstag" "Mittwoch" "Donnerstag" "Freitag" "Samstag")
    :short-weekday-names
    #("So." "Mo." "Di." "Mi." "Do." "Fr." "Sa.")
    :minimal-weekday-names
    #("So" "Mo" "Di" "Mi" "Do" "Fr" "Sa")
    :long-date-formats
    '(("LT" . "HH:mm")
      ("LTS" . "HH:mm:ss")
      ("L" . "DD.MM.YYYY")
      ("LL" . "D. MMMM YYYY")
      ("LLL" . "D. MMMM YYYY LT")
      ("LLLL" . "dddd, D. MMMM YYYY LT")
      ("l" . "DD.MM.YYYY")
      ("ll" . "D. MMMM YYYY")
      ("lll" . "D. MMMM YYYY LT")
      ("llll" . "dddd, D. MMMM YYYY LT"))))
	
   
(defmethod get-ordinal (number token (locale locale-de))
  (declare (ignore token locale))
  (format nil "~d." number))

(defmethod make-locale ((class (eql :de)))
  (make-instance 'locale-de))