;;;; test.lisp -*- Mode: Lisp;-*- 

(cl:in-package "https://github.com/g000001/srfi-118#internals")


(def-suite* srfi-118)


(Test String-Append!
  (Is-True (let* ((S (make-array 0
                                 :element-type 'character
                                 :fill-pointer 0
                                 :adjustable t))
                  (Res (String-Append! S "bar" "baz" "zot")))
             (and (eq S Res)
                  (string= S "barbazzot"))))
  (Is-True (let* ((s (make-array 0
                                 :element-type 'character
                                 :fill-pointer 0
                                 :adjustable t))
                  (Res (String-Append! S)))
             (and (eq S Res)
                  (string= S "")))))


(Test String-Replace!
  (Is-True (let* ((S (make-array 0
                                 :element-type 'character
                                 :initial-element #\_
                                 :fill-pointer 0
                                 :adjustable t))
                  (Res (String-Replace! s 0 9 "foobarbaz")))
             (and (eq S Res)
                  (string= S "foobarbaz"))))
  (Is-True (let* ((S (make-array 9
                                 :element-type 'character
                                 :initial-element #\_
                                 :fill-pointer 9
                                 :adjustable T))
                  (Res (String-Replace! S 3 6 "BAR")))
             (and (eq S Res)
                  (string= S "___BAR___")))))


;;; *EOF*
