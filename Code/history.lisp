(cl:in-package #:clidesdale)

(defclass warning ()
  ((%condition :initarg :condition :reader condition)
   (%location :initarg :location :initform nil :reader location)))

(defclass history-item ()
  ((%text :initarg :text :reader text)
   (%package :initarg :package :reader package)
   (%warnings :initarg :warnings :initform '() :reader warnings)))

(defclass history ()
  ((%items :initarg :items :accessor items)))
