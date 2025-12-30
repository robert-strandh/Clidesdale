(cl:in-package #:asdf-user)

(defsystem "clidesdale-listener"
  :depends-on ("mcclim")
  :serial t
  :components
  ((:file "packages")
   (:file "application-frame")))
