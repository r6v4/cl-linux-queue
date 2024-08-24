# cl-linux-queue
## Project description
common-lisp mailbox use linux function,    
when there is no message in the queue,    
reading messages from it will block the thread,    
which can avoid busy waiting.
## Project structure
```text
cl-linux-queue/                        #software name.
    cl-linux-queue.asd                 #defproject.
    package.lisp                       #defpackage and export symbol.
    code/                              #source code.
        c-bind.lisp                    #binding for c function
        sys-macro.lisp                 #project macro.
        user-function.lisp             #some function for user.
    test/                              #test part.
        example-1.lisp                 #simple example.
        example-2.lisp                 #use project with thread.
```
## Project loading
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
## Project Usage
[main.lisp](https://github.com/r6v4/cl-linux-queue/blob/0aed57515f735c2a28e2965c07f30f82e599762c/test/example-1.lisp#L11)
