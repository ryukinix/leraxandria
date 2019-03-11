;; Enter your code here. Read input from STDIN. Print output to STDOUT
;; get product of n numbers given by A and product of m numbers given by B
;; print gcd(A,B) % 10^9 + 7

(in-package :leraxandria/math)

(defun collect-numbers ()
  (loop repeat (read)
        collect (read)))

(defun product (numbers)
  (reduce #'* numbers))

(eval-when (:execute)
  (defun main ()
    (let ((a (product (collect-numbers)))
          (b (product (collect-numbers))))
      (princ (mod (gcd a b)
                  (+ 7 (expt 10 9))))))

  (main))
