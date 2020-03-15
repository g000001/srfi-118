;;;; srfi-118.lisp -*- Mode: Lisp;-*- 

(cl:in-package "https://github.com/g000001/srfi-118#internals")


(defun String-Append! (String &rest Strings)
  (check-type String (and String (satisfies array-has-fill-pointer-p)))
  (let* ((Orig-Len (length String))
         (Total-Length (+ Orig-Len
                          (reduce #'+ Strings :key #'length))))
    (adjust-array String Total-Length)
    (setf (fill-pointer String) Total-Length)
    (loop :for S :in Strings
          :for Start-Pos := Orig-Len :then End-Pos
          :for End-Pos := (+ Start-Pos (length S)) :then (+ End-Pos (length S))
          :do (replace String S :start1 Start-Pos :end1 End-Pos))
    String))


(defun String-Replace! (Dst Dst-Start Dst-End Src &optional Src-Start Src-End)
  (check-type Dst (and String (satisfies array-has-fill-pointer-p)))
  (let ((Result-Length (max Dst-End (or Src-End 0) (length Dst) (length Src))))
    (adjust-array Dst Result-Length)
    (setf (fill-pointer Dst) Result-Length)
    (replace Dst Src :start1 Dst-Start
                     :end1 Dst-End
                     :start2 (or Src-Start 0)
                     :end2 (or Src-End (length Src)))))


;;; *EOF*


