;; borrowed from primep-factors.lisp

(defun factors (n)
  (let ((state n)
        (c 2))
    (loop while (> state 1)
          if (= (mod state c) 0)
            collect (prog1 c (setq state (/ state c)))
          else
            do (incf c))))

(defun factors-map (n)
  (loop with factors = (factors n)
        for x in (remove-duplicates factors)
        collect (list x (count x factors))))

(defun common-divisors (a b)
  (let ((factors-a (factors-map a))
        (factors-b (factors-map b))
        (divisors 1))
    (loop for x in factors-a
          for m = (assoc (car x) factors-b)
          if m
            do (setq divisors (* divisors (1+ (min (second x) (second m)))))
          finally (return divisors))))
