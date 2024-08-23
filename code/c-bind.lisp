(in-package :cl-linux-queue)

(declaim
    (optimize
        (speed              3)
        (space              1)
        (safety             0)
        (debug              0)
        (compilation-speed  0)))

(cffi:defcstruct msgbuffer (mtype :long) (mtext :string))

(cffi:defcfun (msgget "msgget") :int (key :int) (flag :int))

(cffi:defcfun (msgsnd "msgsnd") :int (id :int) (buf :pointer) (size :int) (flag :int))

(cffi:defcfun (msgrcv "msgrcv") :int (id :int) (buf :pointer) (size :int) (opt :long) (flag :int))
