;;;; srfi-118.asd -*- Mode: Lisp;-*- 

(cl:in-package :asdf)


(defsystem :srfi-118
  :serial t
  :depends-on (:fiveam)
  :components ((:file "package")
               (:file "srfi-118")
               (:file "test")))


(defmethod perform ((o test-op) (c (eql (find-system :srfi-118))))
  (load-system :srfi-118)
  (or (flet (($ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
        (let ((result (funcall ($ :fiveam :run) ($ :srfi-118.internal :srfi-118))))
          (funcall ($ :fiveam :explain!) result)
          (funcall ($ :fiveam :results-status) result)))
      (error "test-op failed") ))


;;; *EOF*
