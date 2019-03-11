;; Enter your code here. Read input from STDIN. Print output to STDOUT

(in-package :leraxandria/math)

(defun collect-points ()
  (loop repeat (read)
        collect (cons (read) (read))))

(defun function-or-not-p (points)
  (let ((map (make-hash-table)))
    (loop for (x . y) in points
          when (null (gethash x map))
            do (setf (gethash x map) y)
          if (/= (gethash x map) y)
            do (return "NO")
          finally (return "YES"))))

(eval-when (:execute)
  (defun main ()
    (loop repeat (read)
       do (format t "~a~%" (function-or-not-p (collect-points))))))
