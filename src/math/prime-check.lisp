(in-package :leraxandria/math)

(defun primep (n)
  (if (<= n 1)
      (return-from primep nil))
  (loop for x from 2 to (isqrt n)
     never (and (/= x n)
                (= (mod n x)
                   0))))
