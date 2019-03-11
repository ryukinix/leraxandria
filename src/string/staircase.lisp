;; HackerRank problem StairCase
;; Manoel Vilela solved at 11/07/2017 03:16:02

(in-package :leraxandria/string)

(defun staircase (x pad)
  (format nil "~v:<~v,,,'#:<~>~>" pad x))


(defun triangle (pad)
  (loop for x from 1 to pad
        do (format t "~a~%" (staircase x pad))))

(eval-when (:execute)
  (defun main ()
    (triangle (read)))
  (main))
