;; borrowed from primep-factors.lisp

(in-package :leraxandria/math)

(defun common-divisors (a b)
  (let ((factors-a (factors-map a))
        (factors-b (factors-map b))
        (divisors 1))
    (loop for x in factors-a
          for m = (assoc (car x) factors-b)
          if m
            do (setq divisors (* divisors (1+ (min (second x) (second m)))))
          finally (return divisors))))
