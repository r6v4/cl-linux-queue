;(ql:quickload :cl-linux-queue)

(in-package :cl-linux-queue)

(setf a (make-mailbox))

(setf b (cffi:convert-to-foreign '(mtype 1 mtext "00000000") '(:struct msgbuffer)))

(sb-thread:make-thread
    (lambda ()
        (loop
            (progn
                (format t "~A" (receive-message a b))
                (finish-output) ))))

(send-message a 123)
(send-message a 321)
