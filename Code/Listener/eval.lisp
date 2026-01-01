(cl:in-package #:clidesdale-listener)

(defgeneric eval (client form))

(define-listener-command (com-eval :name t)
    ((form 'clim:form :prompt "form"))
  (clim:surrounding-output-with-border ()
    (let ((values (multiple-value-list (eval *client* form))))
      (loop for value in values
            for i from 0
            do (format t "~d:~%" i)
               (finish-output)
               (clim:with-translation (*standard-output* 20 0)
                 (format t "~s~%" value))))))

(define-listener-command (com-eval :name t)
    ((form 'clim:form :prompt "form"))
  (terpri)
  (clim:surrounding-output-with-border ()
    (let ((values (multiple-value-list (eval *client* form)))
          (stream *standard-output*))
      (clim:formatting-table (stream)
        (loop for value in values
              for i from 0
              do (clim:formatting-row (stream)
                   (clim:formatting-cell (stream)
                     (format stream "~d:" i))
                   (clim:formatting-cell (stream)
                     (format stream "~s" value))))))))

(defmethod eval (client form)
  (declare (ignore client))
  (cl:eval form))
