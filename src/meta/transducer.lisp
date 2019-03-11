(setf (symbol-function 'filter) #'remove-if-not)

(defun range (a b)
  (loop for k from a to b
        collect k))


(defun comp (&rest funs)
  (let ((funs (reverse funs)))
    (lambda (&rest args)
      (loop with result = args
            for fun in funs
            do (setf result (list (apply fun result)))
            finally (return (car result))))))

(defun square (x)
  (* x x))

(defun transducer (fs reductor list)
  (reduce reductor
          (funcall fs list)))

(defmacro partial (f pred)
  `(lambda (x) (,f ,pred x)))

(eval-when (:execute)

    (print (transducer (comp (partial filter #'evenp)
                             (partial mapcar #'square))
                       #'+
                       (range 1 10))))
