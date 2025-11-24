(cl:in-package #:clidesdale)

(defclass history-item ()
  ((%text :initarg :text :reader text)
   (%current-package :initarg :current-package :reader current-package)
   (%warnings :initarg :warnings :initform '() :reader warnings)))

(defclass history ()
  ((%items :initarg :items :accessor items)))
