;;;; srfi-118.asd -*- Mode: Lisp;-*- 

(cl:in-package :asdf)


(defsystem :srfi-118
  :version "20200316"
  :description "SRFI 118 for CL: Simple adjustable-size strings"
  :long-description "SRFI 118 for CL: Simple adjustable-size strings
https://srfi.schemers.org/srfi-118"
  :author "CHIBA Masaomi"
  :maintainer "CHIBA Masaomi"
  :serial t
  :depends-on (:fiveam)
  :components ((:file "package")
               (:file "srfi-118")
               (:file "test")))


(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-118))))
  (let ((name "https://github.com/g000001/srfi-118")
        (nickname :srfi-118))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))


(defmethod perform ((o test-op) (c (eql (find-system :srfi-118))))
  (let ((*package*
         (find-package
          "https://github.com/g000001/srfi-118#internals")))
    (eval
     (read-from-string
      "
      (or (let ((result (run 'srfi-118)))
            (explain! result)
            (results-status result))
          (error \"test-op failed\") )"))))


;;; *EOF*
