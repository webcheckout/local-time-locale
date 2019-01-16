(in-package :local-time-locale)

(defclass locale-ar-ae (locale) ()
  (:default-initargs
    :first-day-of-week 6
    :month-names
    #("" "يناير" "فبراير" "مارس" "أبريل" "مايو" "يونيو" "يوليو" "أغسطس" "سبتمبر" "أكتوبر" "نوفمبر" "ديسمبر")
    :short-month-names
    #("" "يناير" "فبراير" "مارس" "أبريل" "مايو" "يونيو" "يوليو" "أغسطس" "سبتمبر" "أكتوبر" "نوفمبر" "ديسمبر")
    :weekday-names
    #("الأحد" "الإثنين" "الثلاثاء" "الأربعاء" "الخميس" "الجمعة" "السبت")
    :short-weekday-names
    #("أحد" "إثنين" "ثلاثاء" "أربعاء" "خميس" "جمعة" "سبت")
    :minimal-weekday-names
    #("ح" "ن" "ث" "ر" "خ" "ج" "س")
    
    :long-date-formats
    '(("LT"   . "HH:mm")
      ("L"    . "D/‏M/‏YYYY")
      ("LL"   . "D MMMM YYYY")
      ("LLL"  . "D MMMM YYYY HH:mm")
      ("LLLL" . "dddd D MMMM YYYY HH:mm"))))

(defmethod get-ordinal (number token (locale locale-ar-ae))
  (declare (ignore token locale))
  (format nil "~d" number))

(defmethod make-locale ((class (eql :ar-ae)))
  (make-instance 'locale-ar-ae))
