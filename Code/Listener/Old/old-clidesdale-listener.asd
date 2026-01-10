(cl:in-package #:asdf-user)

(defsystem "clidesdale-listener"
  :depends-on ("mcclim")
  :serial t
  :components
  ((:file "packages")
   (:file "client")
   (:file "application-frame")
   (:file "eval")
   (:file "read-frame-command")))
