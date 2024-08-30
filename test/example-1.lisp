;(ql:quickload :cl-linux-queue)

(in-package :cl-linux-queue) ;#<PACKAGE "CL-LINUX-QUEUE">

(setf a (make-mailbox 12345)) ;0

(send-message a 123) ;0
(send-message a 321) ;0

(setf b (cffi:convert-to-foreign '(mtype 1 mtext "00000000") '(:struct msgbuffer))) ;#.(SB-SYS:INT-SAP #X55D38C702DE0)

(receive-message a b) ;123
(receive-message a b) ;321

(receive-message a b) ;block
