;;;; package.lisp -*- Mode: Lisp;-*- 

(cl:in-package :cl-user)


(defpackage :srfi-118
  (:use)
  (:Export :string-append!
           :string-replace!))


(defpackage :srfi-118.internal
  (:use :srfi-118 :cl :named-readtables :fiveam))

