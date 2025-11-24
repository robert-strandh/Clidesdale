(cl:in-package #:clidesdale)

(clim:define-application-frame clidesdale ()
  ()
  (:panes (text :application
                :scroll-bar nil
                :width 1200)
          (inter :interactor
                 :scroll-bar nil
                 :width 1200))
  (:layouts
   (:defalt (clim:vertically ()
              (clim:scrolling (:scroll-bar t) text)
              (clim:scrolling (:scroll-bar t) inter)))))

(defun clidesdale ()
  (clim:run-frame-top-level
   (clim:make-application-frame 'clidesdale)))
