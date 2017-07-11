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


(defun primep (n)
  (when (<= n 1)
    (return-from primep nil))
  (loop for x from 2 to (isqrt n)
        never (= (mod n x) 0)))

;; year that is prime
(loop for x from 2018
      when (primep x)
        return x)

(loop for x from 1 to 2017
      for result = (if (integerp (/ 2017 x)) (/ 2017 x) "não é divisível")
      do (format t "~%2017/~a = ~a" x result))
