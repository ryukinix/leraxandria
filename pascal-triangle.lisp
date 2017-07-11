;; this is a fucking meta fucked fucking fuckups script to
;; get the lines of a pascal triangle

(defun factorial (n)
  (reduce #'* (cons 1 (loop for x from 1 to n collect x))))

(defun pascal-cell (n r)
  (/ (factorial n)
     (* (factorial r)
        (factorial (- n r)))))

(defun pascal-row (n)
  (loop for r from 0 to n
        collect (pascal-cell n r)))

(defun pascal-triangle (k)
  (loop for n from 0 below k
        collect (pascal-row n)))

(defun print-pascal-triangle (triangle)
  (loop for row in triangle
        do (format t "~{~a~^ ~}~%" row)))

(defun main ()
  (print-pascal-triangle (pascal-triangle (read))))

(main)
