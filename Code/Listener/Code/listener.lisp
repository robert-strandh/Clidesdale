(cl:in-package #:clidesdale-listener)

(defclass example-info-pane (info:info-pane)
  ()
  (:default-initargs
   :display-function 'display-info
   :incremental-redisplay t))

(defun display-info (frame pane)
  (format pane
          "Pane name: ~s ~a"
          (clim:pane-name (info:master-pane pane))
          (if (cmd:recordingp frame) "(Def)" "")))

(defclass example-minibuffer-pane (mini:minibuffer-pane)
  ())

(defclass example-pane (pane:pane-mixin clim:application-pane)
  ())

(clim:define-application-frame example
    (frame:frame-mixin clim:standard-application-frame)
  ((%buffer
    :initform (make-instance 'buffer)
    :reader buffer))
  (:panes
   (window (let* ((my-pane (clim:make-pane
                            'example-pane
                            :width 900 :height 400
                            :display-function 'display-my-pane
                            :name "Example"
                            :command-table 'global-example-table))
                  (my-info-pane (clim:make-pane
                                 'example-info-pane
                                 :master-pane my-pane
                                 :width 900))
                  (minibuffer (clim:make-pane
                               'example-minibuffer-pane
                               :width 900)))
             (setf (frame:windows clim:*application-frame*) (list my-pane))
             (clim:vertically ()
               (clim:scrolling ()
                 my-pane)
               (20 my-info-pane)
               (20 minibuffer)))))
  (:layouts
   (default window))
  (:top-level (top:top-level)))

(defun display-my-pane (frame pane)
  (let* ((buffer (buffer frame))
         (contents (contents buffer))
         (cursor (cursor buffer)))
    (princ (subseq contents 0 cursor) pane)
    (finish-output pane)
    (multiple-value-bind (x y)
        (clim:cursor-position (clim:stream-text-cursor pane))
      (clim:with-drawing-options (pane :ink clim:+red+)
        (clim:draw-line* pane (1+ x) (- y 2) (1+ x) (+ y 20))))
    (princ (subseq contents cursor) pane)))

(defun example (&key (width 900) (height 400))
  "Starts up the example application"
  (let ((frame (clim:make-application-frame
                'example
                :width width :height height)))
    (clim:run-frame-top-level frame)))
