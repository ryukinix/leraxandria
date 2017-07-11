;; Manoel Vilela

(defun collect-points ()
  (loop repeat (read) ;; n points
        collect (cons (read) (read)))) ;; pairs

(defun distance-between-two-points (a b)
  (sqrt (+ (expt (- (car a) (car b)) 2)
           (expt (- (cdr a) (cdr b)) 2))))

(defun segment-length (s)
  (let ((a (first s))
        (b (second s)))
    (distance-between-two-points a b)))

(defun segments (points &optional (head nil)) ;; the last point is linked to the first
  (when points
    (cons (list (first points)
                (or (second points) head))
          (segments (cdr points) (or head (first points))))))

(defun reduce-perimeter (points)
  (reduce #'+ (mapcar #'segment-length (segments points))))

(defun main ()
  (let ((perimeter (reduce-perimeter (collect-points))))
    (format t "~d~%" perimeter)))

(main)
