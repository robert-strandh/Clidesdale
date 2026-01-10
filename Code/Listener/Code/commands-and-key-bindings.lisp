(cl:in-package #:clidesdale-listener)

(clim:define-command-table global-example-table
  :inherit-from (key:global-table kbm:keyboard-macro-table help:help-table))

(clim:define-command
    (com-forward-character
     :name t
     :command-table global-example-table)
    ()
  (forward-character (buffer clim:*application-frame*)))

(clim:define-command
    (com-backward-character
     :name t
     :command-table global-example-table)
    ()
  (backward-character (buffer clim:*application-frame*)))

(clim:define-command
    (com-beginning-of-line
     :name t
     :command-table global-example-table)
    ()
  (beginning-of-line (buffer clim:*application-frame*)))

(clim:define-command
    (com-end-of-line
     :name t
     :command-table global-example-table)
    ()
  (end-of-line (buffer clim:*application-frame*)))

(tbl:set-key 'com-forward-character
             'global-example-table
             `((#\f :control)))

(tbl:set-key 'com-backward-character
             'global-example-table
             `((#\b :control)))

(tbl:set-key 'com-beginning-of-line
             'global-example-table
             `((#\a :control)))

(tbl:set-key 'com-end-of-line
             'global-example-table
             `((#\e :control)))

(defmethod clim:execute-frame-command :around ((frame example) command)
  (declare (ignore command))
  (handler-case (call-next-method)
    (beginning-of-buffer ()
      (mini:display-message "Beginning of buffer"))
    (end-of-buffer ()
      (mini:display-message "End of buffer"))))
