;; Enter your code here. Read input from STDIN. Print output to STDOUT

(in-package :leraxandria/math)

(defun fib-iter (n)
  (loop with a = 0
        with b = 1
        repeat n
        do (psetq a b
                  b (+ a b))
        finally (return a)))


(eval-when (:execute)
  (princ (fib-iter (1- (read)))))
