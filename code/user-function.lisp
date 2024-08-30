(in-package :cl-linux-queue)

(defun make-mailbox (&optional (id 12345))
    (msgget id 950) ) ;

(defun send-message (queue message)
    (send-message-macro queue message) )

(defun receive-message (queue pointer)
    (receive-message-macro queue pointer) )
