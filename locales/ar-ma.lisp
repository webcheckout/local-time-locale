(in-package :local-time-locale)

(defclass locale-ar-ma (locale) ()
  (:default-initargs
    :first-day-of-week 6
    :month-names
    #("" "يناير" "فبراير" "مارس" "أبريل" "ماي" "يونيو" "يوليوز" "غشت" "شتنبر" "أكتوبر" "نونبر" "دجنبر")
    :short-month-names
    #("" "يناير" "فبراير" "مارس" "أبريل" "ماي" "يونيو" "يوليوز" "غشت" "شتنبر" "أكتوبر" "نونبر" "دجنبر")
    :weekday-names
    #("الأحد" "الإتنين" "الثلاثاء" "الأربعاء" "الخميس" "الجمعة" "السبت")
    :short-weekday-names
    #("احد" "اتنين" "ثلاثاء" "اربعاء" "خميس" "جمعة" "سبت")
    :minimal-weekday-names
    #("ح" "ن" "ث" "ر" "خ" "ج" "س")
    
    :long-date-formats
    '(("LT"   . "HH:mm")
      ("L"    . "DD/MM/YYYY")
      ("LL"   . "D MMMM YYYY")
      ("LLL"  . "D MMMM YYYY HH:mm")
      ("LLLL" . "dddd D MMMM YYYY HH:mm"))))

(defmethod get-ordinal (number token (locale locale-ar-ma))
  (declare (ignore token locale))
  (format nil "~d" number))

(defmethod make-locale ((class (eql :ar-ma)))
  (make-instance 'locale-ar-ma))
