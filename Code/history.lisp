(cl:in-package #:clidesdale)

(defgeneric condition (warning))

(defgeneric location (warning))

(defclass warning ()
  ((%condition :initarg :condition :reader condition)
   (%location :initarg :location :initform nil :reader location)))

(defgeneric text (history-item))

(defgeneric package (history-item))

(defgeneric warnings (history-item))

(defclass history-item ()
  ((%text :initarg :text :reader text)
   (%package :initarg :package :reader package)
   (%warnings :initarg :warnings :initform '() :reader warnings)))

(defgeneric items (history))

(defclass history ()
  ((%items :initarg :items :accessor items)))
