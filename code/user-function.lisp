(in-package :cl-linux-queue)

(defun make-mailbox ()
    (msgget 12345 950)) ;

(defun send-message (q m)
    (send-message-m q m))

(defun receive-message (q m)
    (receive-message-m q m))
