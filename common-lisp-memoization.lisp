;; Maybe useless, but I'll define it anyway.
;; Manoel Vilela -- 31/03/2017
;; Lexical Memoization Macro
;; Example of usage: (memoize fib (fib 100))

(defmacro memoize (func &rest body)
  `(let ((table (make-hash-table))
         (old-func (symbol-function ',func)))
     (labels ((,func (x)
                (if (not (null (nth-value 1 (gethash x table))))
                    (gethash x table)
                    (setf (gethash x table)
                          (funcall old-func x)))))
       (setf (symbol-function ',func) #',func)
       (prog1 ,@body
             (setf (symbol-function ',func) old-func)))))

(defun fib (n)
  (if (<= n 1)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))


(memoize fib (fib 100))
