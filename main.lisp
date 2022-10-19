;; [[file:readme.org::*Introduction][Introduction:3]]
(in-package :x-mpi)

(defun main ()
  (format t "hello from ~a~%"
          (mpi:mpi-comm-rank)))
;; Introduction:3 ends here
