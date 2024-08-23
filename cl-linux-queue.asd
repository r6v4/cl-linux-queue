(asdf:defsystem cl-linux-queue
    :name "cl-linux-queue"
    :description "message-queue-use-linux-function"
    :author "r6v4@pm.me"
    :version 1.1
    :depends-on ("cffi") 
    :serial t
    :components (
        (:static-file "LICENSE")
        (:file "package")
        (:module "code"
            :serial t
            :components
                (   (:file "c-bind")
                    (:file "sys-macro")
                    (:file "user-function") ))
        ;(:module "test"
        ;    :serial t
        ;    :components
        ;        (  (:file "example-1")
        ;           (:file "example-2")))
        ))
        