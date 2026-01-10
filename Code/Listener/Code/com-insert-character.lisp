(cl:in-package #:clidesdale-listener)

(clim:define-command
    (com-insert-character
     :name t
     :command-table global-example-table)
    ((character 'character))
  (insert-character character (buffer clim:*application-frame*)))

(setf (documentation 'com-insert-character 'function)
      (format nil "Insert a character at the position of the cursor~@
                   and then move the cursor one position to the right."))

(loop for character across " !\"#$%&'()*+,-./"
      do (tbl:set-key `(com-insert-character ,character)
                      'global-example-table
                      `(,character)))

(loop for character across "0123456789:;<=>?"
      do (tbl:set-key `(com-insert-character ,character)
                      'global-example-table
                      `(,character)))

(loop for character across "@ABCDEFGHIJKLMNO"
      do (tbl:set-key `(com-insert-character ,character)
                      'global-example-table
                      `(,character)))

(loop for character across "PQRSTUVWXYZ[\\]^_"
      do (tbl:set-key `(com-insert-character ,character)
                      'global-example-table
                      `(,character)))

(loop for character across "`abcdefghijklmno"
      do (tbl:set-key `(com-insert-character ,character)
                      'global-example-table
                      `(,character)))

(loop for character across "pqrstuvwxyz{|}~"
      do (tbl:set-key `(com-insert-character ,character)
                      'global-example-table
                      `(,character)))

(tbl:set-key `(com-insert-character #\Newline)
             'global-example-table
             `(#\Return))
