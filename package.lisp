(in-package :cl-user)

(defpackage #:cl-linux-queue
    (:use :cl :cl-user :cffi)
    (:export 
        :make-mailbox
        :send-message
        :receive-message
        :send-message-macro
        :receive-message-macro) )
