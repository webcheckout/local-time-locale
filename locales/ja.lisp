(in-package :local-time-locale)

(defclass locale-ja (locale)
  ()
  (:default-initargs
   :month-names
      #("1月" "2月" "3月" "4月" "5月" "6月" "7月" "8月" "9月" "10月" "11月" "12月")
    :short-month-names
    #("1月" "2月" "3月" "4月" "5月" "6月" "7月" "8月" "9月" "10月" "11月" "12月")
    :weekday-names
    #("日曜日" "月曜日" "火曜日" "水曜日" "木曜日" "金曜日" "土曜日")
    :short-weekday-names
    #("日" "月" "火" "水" "木" "金" "土")
    :minimal-weekday-names
    #("日" "月" "火" "水" "木" "金" "土")
    :long-date-formats
    '(("LT" . "Ah時m分")
      ("LTS" . "LTs秒")
      ("L" . "YYYY/MM/DD")
      ("LL" . "YYYY年M月D日")
      ("LLL" . "YYYY年M月D日LT")
      ("LLLL" . "YYYY年M月D日LT dddd"))))

(defmethod get-meridiem (hour minute upcase (locale locale-ja))
  (declare (ignore upcase locale))
  (if (< hour 12) "午前" "午後"))

(defmethod make-locale ((class (eql :ja)))
  (make-instance 'locale-ja))