;; Copryight <c> Manoel Vilela @ 2017
;;
;; numerical integration via limit definition of integral
;; calculate the area under curve and the revolution-x volume by
;; a polynomial.
;; feita em 10/07/2017 00:38:29

(in-package :leraxandria/math)

(defparameter *dx* 0.001)

;; correto
(defun parse-integer-list (string)
  (with-input-from-string (input string)
    (loop for x = (read input nil nil) while x collect x)))

;; CORRETO TAMBÉM CARAI
(defun make-polynomial (coefficients expoents)
  (lambda (x) (loop for a in coefficients
                    for b in expoents
                    sum (* a (expt x b)))))

;; tá tudo correto nessa porra
(defun get-polynomial ()
  (make-polynomial (parse-integer-list (read-line))
                   (parse-integer-list (read-line))))

;; correto
(defun numerical-integrate (f dx a b)
  (loop for x from a to b by dx
        sum (* (funcall f x) dx)))

;; correto
(defun get-area (f a b)
  (numerical-integrate f *dx* a b))

;; correto
(defun get-volume (f a b)
  (* pi (numerical-integrate (lambda (x) (expt (funcall f x) 2))
                             *dx* a b)))

(eval-when (:execute)
 (defun main ()
   (let* ((f (get-polynomial))
          (a (read))
          (b (read))
          (area (get-area f a b))
          (volume (get-volume f a b)))
     (format t "~,2f~%~,2f~%" area volume)))

 (main))
