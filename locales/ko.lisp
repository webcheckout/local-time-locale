(in-package :local-time-locale)

(defclass locale-ko (locale) ()
  (:default-initargs
   :first-day-of-week 0
    :month-names
    #("" "1월" "2월" "3월" "4월" "5월" "6월" "7월" "8월" "9월" "10월" "11월" "12월")
    :short-month-names
    #("" "1월" "2월" "3월" "4월" "5월" "6월" "7월" "8월" "9월" "10월" "11월" "12월")
    :weekday-names
    #("일요일" "월요일" "화요일" "수요일" "목요일" "금요일" "토요일")
    :short-weekday-names
    #("일" "월" "화" "수" "목" "금" "토")
    :minimal-weekday-names
    #("일" "월" "화" "수" "목" "금" "토")
    
    :long-date-formats
    '(("LT"   . "A h시 m분")
      ("L"    . "YYYY.MM.DD")
      ("LL"   . "YYYY년 MMMM D일")
      ("LLL"  . "YYYY년 MMMM D일 LT")
      ("LLLL" . "YYYY년 MMMM D일 dddd LT"))))
	 
(defmethod get-ordinal (number token (locale locale-ko))
  (declare (ignore token locale))
  (format nil "~A일" number))

(defmethod get-meridiem (hour minute upcase (locale locale-ko))
  (declare (ignore upcase locale))
  (if (< hour 12) "오전" "오후"))

(defmethod meridiems ((locale locale-ko))
  `(("오전" ,#'%am-conversion)
    ("오후" ,#'%pm-conversion)))

(defmethod make-locale ((class (eql :ko)))
  (make-instance 'locale-ko))
