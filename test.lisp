;;;; test.lisp -*- Mode: Lisp;-*- 

(cl:in-package srfi-118.internal)


(def-suite srfi-118)


(in-suite srfi-118)


(test string-append!
  (is-true (Let* ((s (Make-Array 0
                                 :element-type 'character
                                 :Fill-Pointer 0
                                 :adjustable T))
                  (res (string-append! s "bar" "baz" "zot")))
             (And (Eq s res)
                  (String= s "barbazzot"))))
  (is-true (Let* ((s (Make-Array 0
                                 :element-type 'character
                                 :Fill-Pointer 0
                                 :adjustable T))
                  (res (string-append! s)))
             (And (Eq s res)
                  (String= s "")))))


(test string-replace!
  (is-true (Let* ((s (Make-Array 0
                                 :element-type 'character
                                 :initial-element #\_
                                 :Fill-Pointer 0
                                 :adjustable T))
                  (res (string-replace! s 0 9 "foobarbaz")))
             (And (Eq s res)
                  (String= s "foobarbaz"))))
  (is-true (Let* ((s (Make-Array 9
                                 :element-type 'character
                                 :initial-element #\_
                                 :Fill-Pointer 9
                                 :adjustable T))
                  (res (string-replace! s 3 6 "BAR")))
             (And (Eq s res)
                  (String= s "___BAR___")))))


;;; *EOF*


