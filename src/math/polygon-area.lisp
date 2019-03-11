;; Manoel Vilela -- HackerRank

(in-package :leraxandria/math)

(defun collect-points ()
  (loop repeat (read) ;; n points
        collect (cons (read) (read)))) ;; pairs

(defun cross-fit (s)
  (let ((a (first s))
        (b (second s)))
    (- (* (car a) (cdr b))
       (* (car b) (cdr a)))))

(defun segments (points &optional (head nil)) ;; the last point is linked to the first
  (when points
    (cons (list (first points)
                (or (second points) head))
          (segments (cdr points) (or head (first points))))))

(defun reduce-area (points)
  (/ (abs (reduce #'+ (mapcar #'cross-fit (segments points))))
     2))

(eval-when (:execute)
 (defun main ()
   (let ((area (reduce-area (collect-points))))
     (format t "~f~%" area)))

 (main))
