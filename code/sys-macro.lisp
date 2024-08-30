(in-package :cl-linux-queue)

(defmacro send-message-m (queue message)
    (let ((c (gensym))
          (d (gensym)) )
        `(progn
            (setf 
                ,c (format nil "~8,'0d" ,message)
                ,d (cffi:convert-to-foreign (list 'mtype 1 'mtext ,c) '(:struct msgbuffer)) )
            (msgsnd ,queue ,d 8 100) )))

(defmacro receive-message-m (queue pointer)
    (let ((c (gensym))
          (d (gensym))
          (e (gensym)) )
        `(progn
            (setf 
                ,c (msgrcv ,queue ,pointer 8 0 100)
                ,d (cffi:foreign-slot-value ,pointer '(:struct msgbuffer) 'mtext)
                ,e (parse-integer ,d :junk-allowed t) )
            (values ,e))))
