(cl:in-package #:clidesdale-listener)

(clim:define-command
    (com-delete-character
     :name t
     :command-table global-example-table)
    ()
  (delete-character (buffer clim:*application-frame*)))

(setf (documentation 'com-delete-character 'function)
      (format nil "Delete a character at the position immediately after~@
                   the cursor.  If the cursor is at the end of the buffer~@
                   then an error is reported."))

(tbl:set-key 'com-delete-character
             'global-example-table
             `((#\d :control)))
