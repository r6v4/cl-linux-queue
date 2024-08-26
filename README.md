# cl-linux-queue
## Project description
common-lisp mailbox use linux function,    
when there is no message in the queue,    
reading messages from it will block the thread,    
which can avoid busy waiting.
## Project structure
```text
cl-linux-queue/                        #software name.
    cl-linux-queue.asd                 #define project.
    package.lisp                       #define package and export symbol.
    code/                              #source code.
        c-bind.lisp                    #binding for c function
        sys-macro.lisp                 #project macro.
        user-function.lisp             #some function for user.
    test/                              #test part.
        example-1.lisp                 #simple example.
        example-2.lisp                 #use project with thread.
```
## Project loading
```bash
#mkdir 12345
cd 12345 #or other file menu
#git clone https://github.com/r6v4/cl-linux-queue.git
#sbcl
```
```common-lisp
;require system asdf
(require :asdf)
;NIL

;add project path
(pushnew
    (probe-file "./cl-linux-queue")
    asdf:*central-registry* :test #'equal)
;(#P"/12345/cl-linux-queue/" #P"/54321/quicklisp/")

;load project
(asdf:load-system :cl-linux-queue)
;T

;or use quickload
;(ql:quickload :cl-linux-queue)

```
## Project usage
```common-lisp
;package symbol as current symbol for example
(in-package :cl-linux-queue)
;#<PACKAGE "CL-LINUX-QUEUE">

;create mailbox a as message queue
(setf a (make-mailbox))
;0

;send message to a
(send-message a 123) ;0
(send-message a 321) ;0

;create pointer b to get single message 
(setf b (cffi:convert-to-foreign '(mtype 1 mtext "00000000") '(:struct msgbuffer)))
;#.(SB-SYS:INT-SAP #X55D38C702DE0)

;use b to receive message from a
(receive-message a b) ;123
(receive-message a b) ;321

(receive-message a b) ;block for no message
```

