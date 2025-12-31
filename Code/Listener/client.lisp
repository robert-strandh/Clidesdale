(cl:in-package #:clidesdale-listener)

(defparameter *client* nil)

(setf (documentation '*client* 'variable)
      (format nil "This variable is used by the listener to supply~@
                   the CLIENT argument to some generic functions like~@
                   for instance EVAL.  Listener methods do not specialize~@
                   to the CLIENT parameter, but client code can override~@
                   those methods by specializing to some CLIENT object~@
                   defined by client code."))
