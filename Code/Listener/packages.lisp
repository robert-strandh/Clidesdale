(cl:in-package #:common-lisp-user)

(defpackage #:clidesdale-listener
  (:use #:common-lisp)
  (:shadow
   #:eval)
  (:export
   #:*client*
   #:listener))
