(in-package :local-time-locale)

(defclass locale-zh-tw (locale-zh) ()
  (:default-initargs
   :first-day-of-week 0
    :month-names
    #("" "一月" "二月" "三月" "四月" "五月" "六月" "七月" "八月" "九月" "十月" "十一月" "十二月")
    :short-month-names
    #("" "1月" "2月" "3月" "4月" "5月" "6月" "7月" "8月" "9月" "10月" "11月" "12月")
    :weekday-names
    #("星期日" "星期一" "星期二" "星期三" "星期四" "星期五" "星期六")
    :short-weekday-names
    #("週日" "週一" "週二" "週三" "週四" "週五" "週六")
    :minimal-weekday-names
    #("日" "一" "二" "三" "四" "五" "六")  
    :long-date-formats
    '(("LT"   . "Ah點mm")
      ("L"    . "YYYY年MM日DD")
      ("LL"   . "YYYY年MMMD日")
      ("LLL"  . "YYYY年MMMD日LT")
      ("LLLL" . "YYYY年MMMD日ddddLT")
      ("l"    . "YYYY年MM日DD")
      ("ll"   . "YYYY年MMMD日")
      ("lll"  . "YYYY年MMMD日LT")
      ("llll" . "YYYY年MMMD日ddddLT"))))

(defmethod get-ordinal (number token (locale locale-zh-tw))
  (declare (ignore locale))
           (cond ((or (string= token "do")
		      (string= token "Do")
		      (string= token "DDDo"))
		  (format nil "~A日" number))
		 ((string= token "Mo")
		  (format nil "~A月" number))
		 ((or (string= token "wo")
		      (string= token "Wo"))
		   (format nil "~A週" number))
		 (t number)))

(defmethod get-meridiem (hour minute upcase (locale locale-zh-tw))
  (declare (ignore upcase locale))
  (let ((hm (+ (* hour 100) minute)))
    (cond ((< hm 900) "早上")
	  ((< hm 1130) "上午")
	  ((< hm 1230) "中午")
	  ((< hm 1800) "下午")
	  (t "晚上"))))

(defmethod make-locale ((class (eql :zh-tw)))
  (make-instance 'locale-zh-tw))
		 