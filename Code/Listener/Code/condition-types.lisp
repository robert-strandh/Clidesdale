(cl:in-package #:clidesdale-listener)

(define-condition beginning-of-buffer ()
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream
                     "An attempt was made to move backward, or to erase~@
                      the element before the first one in the buffer,~@
                      whereas the cursor is already at the beginning of~@
                      the buffer"))))

(define-condition end-of-buffer ()
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream
                     "An attempt was made to move forward, or to delete~@
                      the element after the last one in the buffer,~@
                      whereas the cursor is already at the end of the~@
                      buffer"))))
