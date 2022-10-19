;; [[file:readme.org::*Introduction][Introduction:1]]
(load "config.lisp")
(asdf:defsystem "x-mpi"
  :description "Toying with mpi stuff"
  :version "0.0.1"
  :author "Alejandro Gallo <aamsgallo@gmail.com>"
  :licence "GPLv3"
  :depends-on (#:bordeaux-threads #:cl-mpi)
  :serial t
  :components ((:file "packages")
               (:file "main")))
;; Introduction:1 ends here
