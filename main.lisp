;; [[file:readme.org::*Introduction][Introduction:3]]
(in-package :x-mpi)

(defparameter *mpi-root* 0)

(defun run-repl ()
  (if (eq (mpi:mpi-comm-rank) *mpi-root*)
      (bt:make-thread #'repl)
      (repl)))

(defmacro with-mpi (code)
  `(mpi-extensions:mpi-broadcast-anything
    *mpi-root* :object ',code))

(defun repl ()
  (loop
    (let (new-code)
      ;; (sleep 1)
      (mpi-extensions:mpi-broadcast-anything
       *mpi-root* :object new-code)
      (when new-code
        (format t "received ~a in rank ~a~%"
                new-code
                (mpi-comm-rank))))))
;; Introduction:3 ends here
