(cl:in-package #:asdf-user)

(defsystem "clidesdale-listener"
  :depends-on ("esclados"
               "esclados-info-pane"
               "esclados-command-processing"
               "esclados-pane"
               "esclados-frame"
               "esclados-standard-key-bindings"
               "esclados-keyboard-macros"
               "esclados-help")
  :serial t
  :components
  ((:file "packages")
   (:file "buffer")
   (:file "example-application")
   (:file "commands-and-key-bindings")
   (:file "com-insert-character")
   (:file "com-delete-character")
   (:file "condition-types")))
