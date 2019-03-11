;; NOTE: I'm not the author and I don't know who wrote this too, just
;; found somewhere in the past

(defpackage #:leraxandria/game-of-life
  (:use :cl :cl-user)
  (:export #:main ))

(in-package #:leraxandria/game-of-life)

(proclaim '(optimize (speed 3) (space 0) (debug 0)))

(defparameter *width* 80)
(defparameter *height* 23)
(defparameter *length* (* *width* *height*))

(defun neighbours (pos)
  (mapcar (lambda (x) (mod x *length*))
          (delete pos
                  (mapcan (lambda (pos)
                            (list (1- pos)
                                  pos
                                  (1+ pos)))
                          (list pos
                                (+ pos *width*)
                                (- pos *width*))))))

(defun alive-neighbours (board pos)
  (reduce #'+
          (mapcar (lambda (pos) (sbit board pos))
                  (neighbours pos))))

(defun evolve (board)
  (let ((new-board (make-array (array-dimensions board)
                               :element-type 'bit)))
    (loop for pos from 0 below (array-total-size board)
       do (let ((alive-neighbours (alive-neighbours board pos))
                (alive-cell (= (sbit board pos) 1)))
            (cond
              ((and alive-cell (< alive-neighbours 2))
               (setf (sbit new-board pos) 0))
              ((and alive-cell (< alive-neighbours 4))
               (setf (sbit new-board pos) 1))
              ((and alive-cell (>= alive-neighbours 4))
               (setf (sbit new-board pos) 0))
              ((and (not alive-cell)
                    (= alive-neighbours 3))
               (setf (sbit new-board pos) 1))
              (t (setf (sbit new-board pos)
                       (sbit board pos))))))
    new-board))

(defun print-board (board &optional (stream *standard-output*))
  (loop for j from 0 below *height*
     do (loop for i from 0 below *width*
           do (write-char
               (if (= (sbit board (+ i (* j *width*))) 1) #\* #\space)
               stream)
           finally (write-char #\newline stream))))

(defun make-board (lst)
  (let ((board (make-array (list *length*)
                           :element-type 'bit
                           :initial-element 0)))
    (loop for pair in lst
       do (setf (sbit board (+ (car pair)
                               (* (cdr pair) *width*))) 1))
    board))

(defun make-random-pairs (p)
  (loop for j from 0 below *height*
     append (loop for i from 0 below *width*
                when (= (random p) 0)
                collect (cons i j))))

(defun evolution (board)
  (print-board board)
  (unless (char= (read-char) #\q)
    (evolution (evolve board))))

(defun main ()
  (evolution (make-board (make-random-pairs 22))))

(eval-when (:execute)
 (main))
