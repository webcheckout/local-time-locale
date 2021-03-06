(in-package :local-time-locale)

(defclass locale-zh (locale)
  ()
  (:default-initargs
    :first-day-of-week 1
    :month-names
    #("" "一月" "二月" "三月" "四月" "五月" "六月" "七月" "八月" "九月" "十月" "十一月" "十二月")
    :short-month-names
    #("" "1月" "2月" "3月" "4月" "5月" "6月" "7月" "8月" "9月" "10月" "11月" "12月")
    :weekday-names
    #("星期日" "星期一" "星期二" "星期三" "星期四" "星期五" "星期六")
    :short-weekday-names
    #("周日" "周一" "周二" "周三" "周四" "周五" "周六")
    :minimal-weekday-names
    #("日" "一" "二" "三" "四" "五" "六")
    
    :long-date-formats
    '(("LT"   . "Ah点mm")
      ("L"    . "YYYY-MM-DD")
      ("LL"   . "YYYY年MMMD日")
      ("LLL"  . "YYYY年MMMD日LT")
      ("LLLL" . "YYYY年MMMD日ddddLT")
      ("l"    . "YYYY-MM-DD")
      ("ll"   . "YYYY年MMMD日")
      ("lll"  . "YYYY年MMMD日LT")
      ("llll" . "YYYY年MMMD日ddddLT"))))

(defmethod get-ordinal (number token (locale locale-zh))
  (declare (ignore locale))
           (cond ((or (string= token "do")
		      (string= token "Do")
		      (string= token "DDDo"))
		  (format nil "~A日" number))
		 ((string= token "Mo")
		  (format nil "~A月" number))
		 ((or (string= token "wo")
		      (string= token "Wo"))
		   (format nil "~A周" number))
		 (t number)))

(defmethod get-meridiem (hour minute upcase (locale locale-zh))
  (declare (ignore upcase locale))
  (let ((hm (+ (* hour 100) minute)))
    (cond ((< hm 600) "凌晨")
	  ((< hm 900) "早上")
	  ((< hm 1130) "上午")
	  ((< hm 1230) "中午")
	  ((< hm 1800) "下午")
	  (t "晚上"))))

(defmethod meridiems ((locale locale-zh))
  `(("凌晨" ,#'%am-conversion)
    ("早上" ,#'%am-conversion)
    ("上午" ,#'%am-conversion)
    ("中午" ,(lambda (hour) (if (= hour 11) (%am-conversion hour) (%pm-conversion hour))))
    ("下午" ,#'%pm-conversion)
    ("晚上" ,#'%pm-conversion)))

(defmethod make-locale ((class (eql :zh)))
  (make-instance 'locale-zh))
