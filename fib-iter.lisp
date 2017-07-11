;; Enter your code here. Read input from STDIN. Print output to STDOUT

(defun fib (n)
  (loop with a = 0
        with b = 1
        repeat n
        do (psetq a b
                  b (+ a b))
        finally (return a)))


(princ (fib (1- (read))))
