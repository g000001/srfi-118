;;;; package.lisp -*- Mode: Lisp;-*- 

(cl:in-package cl-user)


(defpackage "https://github.com/g000001/srfi-118"
  (:use)
  (:export string-append!
           string-replace!))


(defpackage "https://github.com/g000001/srfi-118#internals"
  (:use
   "https://github.com/g000001/srfi-118"
   cl 
   named-readtables 
   fiveam))


;;; *EOF*
