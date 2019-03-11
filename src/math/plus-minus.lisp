;; from hackerrank problem plus minus
;; check the number of positive, negative and null numbers

(in-package :leraxandria/math)

(defun collect-numbers ()
  (loop repeat (read)
        collect (read)))

(defun percent-of-numbers (predicate list size)
  (/ (count-if predicate list) size))

(eval-when (:execute)
 (defun main ()
   (let* ((list (collect-numbers))
          (size (length list)))
     (format t "~,5f~%~,5f~%~,5f~%"
             (percent-of-numbers #'plusp list size)
             (percent-of-numbers #'minusp list size)
             (percent-of-numbers #'zerop list size))))
 (main))
