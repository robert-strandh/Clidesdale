(cl:in-package #:clidesdale-listener)

(clim:define-application-frame listener ()
  ()
  (:panes (interactor :interactor))
  (:layouts (default
             (clim:vertically ()
               (clim:scrolling (:scroll-bars t)
                 interactor)))))

(defun listener ()
  (let ((frame (clim:make-application-frame 'listener)))
    (clim:run-frame-top-level frame)))
