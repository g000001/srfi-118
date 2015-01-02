;;;; srfi-118.lisp -*- Mode: Lisp;-*- 

(cl:in-package :srfi-118.internal)


(Defun string-append! (string &rest strings)
  (Check-Type String (And String (Satisfies Array-Has-Fill-Pointer-P)))
  (Let* ((orig-len (Length String))
         (total-length (+ orig-len
                          (Reduce #'+ strings :key #'Length))))
    (Adjust-Array String total-length)
    (Setf (Fill-Pointer string) total-length)
    (Loop :for s :in strings
          :for start-pos := orig-len :then end-pos
          :for end-pos := (+ start-pos (Length s)) :then (+ end-pos (Length s))
          :Do (Replace String s :start1 start-pos :end1 end-pos))
    string))


(Defun string-replace! (dst dst-start dst-end src &Optional src-start src-end)
  (Check-Type dst (And String (Satisfies Array-Has-Fill-Pointer-P)))
  (Let ((result-length (Max dst-end (or src-end 0) (Length dst) (Length src))))
    (Adjust-Array dst result-length)
    (Setf (Fill-Pointer dst) result-length)
    (Replace dst src :start1 dst-start
                     :end1 dst-end
                     :start2 (or src-start 0)
                     :end2 (or src-end (Length src)))))


;;; *EOF*


