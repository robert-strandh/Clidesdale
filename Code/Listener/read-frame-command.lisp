(cl:in-package #:clidesdale-listener)

(clim:define-presentation-type nothing ())

(defmethod clim:read-frame-command
    ((frame listener) &key (stream *standard-input*))
  (multiple-value-bind (object type)
      (let ((clim:*command-dispatchers* '(#\,)))
        (clim:accept 'clim:command-or-form
                     :stream stream
                     :prompt ""
                     :prompt-mode :raw
                     :default ""
                     :default-type 'nothing))
    (cond
      ((clim:presentation-subtypep type 'nothing)
       `(com-eval nil))
      ((clim:presentation-subtypep type 'clim:command)
       (climi::ensure-complete-command
        object (clim:frame-command-table frame) stream))
      (t `(com-eval ,object)))))
