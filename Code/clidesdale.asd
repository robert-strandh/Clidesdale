(cl:in-package #:asdf-user)

(defsystem "clidesdale"
  :depends-on ("mcclim")
  :serial t
  :components
  ((:file "packages")
   (:file "history")
   (:file "gui")))
