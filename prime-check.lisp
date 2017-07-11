(defun primep (n)
  (if (<= n 1)
      (return-from primep nil))
  (loop for x from 2 to (isqrt n)
     never (and (/= x n)
                (= (mod n x)
                   0))))

(defun range (a b)
  (loop for x from a below b collect x))

(defun filter (predicate collection)
  (remove-if-not predicate collection))
