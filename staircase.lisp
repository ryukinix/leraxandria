;; HackerRank problem StairCase
;; Manoel Vilela solved at 11/07/2017 03:16:02


(defun staircase (x pad)
  (format nil "~v:<~v,,,'#:<~>~>" pad x))

(defun main ()
  (loop with pad = (read)
        for x from 1 to pad
        do (format t "~a~%" (staircase x pad))))
