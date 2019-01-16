(in-package :local-time-locale)

(defclass locale-ar-tn (locale) ()
  (:default-initargs
    :first-day-of-week 1
    :month-names
    #("" "جانفي" "فيفري" "مارس" "أفريل" "ماي" "جوان" "جويلية" "أوت" "سبتمبر" "أكتوبر" "نوفمبر" "ديسمبر")
    :short-month-names
    #("" "جانفي" "فيفري" "مارس" "أفريل" "ماي" "جوان" "جويلية" "أوت" "سبتمبر" "أكتوبر" "نوفمبر" "ديسمبر")
    :weekday-names
    #("الأحد" "الإثنين" "الثلاثاء" "الأربعاء" "الخميس" "الجمعة" "السبت")
    :short-weekday-names
    #("أحد" "إثنين" "ثلاثاء" "أربعاء" "خميس" "جمعة" "سبت")
    :minimal-weekday-names
    #("ح" "ن" "ث" "ر" "خ" "ج" "س")
    
    :long-date-formats
    '(("LT"   . "HH:mm")
      ("L"    . "DD/MM/YYYY")
      ("LL"   . "D MMMM YYYY")
      ("LLL"  . "D MMMM YYYY HH:mm")
      ("LLLL" . "dddd D MMMM YYYY HH:mm"))))

(defmethod get-ordinal (number token (locale locale-ar-tn))
  (declare (ignore token locale))
  (format nil "~d" number))

(defmethod make-locale ((class (eql :ar-tn)))
  (make-instance 'locale-ar-tn))
