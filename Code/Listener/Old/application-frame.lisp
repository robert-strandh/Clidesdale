(cl:in-package #:clidesdale-listener)

(clim:define-application-frame listener ()
  ()
  (:panes (interactor :interactor))
  (:top-level (clim:default-frame-top-level
               :prompt (format nil "Form:~%")))
  (:layouts (default
             (clim:vertically ()
               (clim:scrolling (:scroll-bars t)
                 interactor)))))

(defun listener ()
  (let ((frame (clim:make-application-frame 'listener
                 :width 1000 :height 1000)))
    (clim:run-frame-top-level frame)))
