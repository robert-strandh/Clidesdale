(cl:in-package #:clidesdale-listener)

(defgeneric contentents (buffer))

(defgeneric (setf contents) (new-contents buffer))

(defgeneric cursor (buffer))

(defgeneric (setf cursor) (new-cursor buffer))

(defclass buffer ()
  ((%contents
    :initform (make-array 10
                          :element-type 'character
                          :adjustable t
                          :fill-pointer 0)
    :reader contents)
   (%cursor :initform 0 :accessor cursor)))

(defun insert-character (character buffer)
  (with-accessors ((contents contents) (cursor cursor)) buffer
    (vector-push-extend #\Space contents 10)
    (replace contents contents :start1 (1+ cursor) :start2 cursor)
    (setf (char contents cursor) character)
    (incf cursor)))

(defun delete-character (buffer)
  (with-accessors ((contents contents) (cursor cursor)) buffer
    (if (= cursor (fill-pointer contents))
        (error 'end-of-buffer)
        (progn
          (replace contents contents :start1 cursor :start2 (1+ cursor))
          (decf (fill-pointer contents))))))

(defun forward-character (buffer)
  (with-accessors ((contents contents) (cursor cursor)) buffer
    (if (= cursor (fill-pointer contents))
        (error 'end-of-buffer)
        (incf cursor))))

(defun backward-character (buffer)
  (with-accessors ((cursor cursor)) buffer
    (if (zerop cursor)
        (error 'beginning-of-buffer)
        (decf cursor))))

(defun beginning-of-line (buffer)
  (with-accessors ((contents contents) (cursor cursor)) buffer
    (let ((position (position #\Newline contents :end cursor :from-end t)))
      (setf cursor
            (if (null position)
                0
                (1+ position))))))

(defun end-of-line (buffer)
  (with-accessors ((contents contents) (cursor cursor)) buffer
    (let ((position (position #\Newline contents :start cursor)))
      (setf cursor
            (if (null position)
                (length contents)
                position)))))
