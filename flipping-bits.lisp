;; Flipping Bits @ HackerRank Algorithms / Bit Manipulation
;; Solved by Manoel Vilela at 11/07/2017 05:05:05

(defun list-of-bits (integer)
  "Given a integer i return a list of bits
  Ex.: (integer-to-bits 3) => (1 1)
       (integer-to-bits 5) => (1 0 1)"
  (let ((bits '()))
    (dotimes (index (integer-length integer) bits)
      (push (if (logbitp index integer) 1 0) bits))
    (or bits '(0))))

(defun bits-to-integer (bits)
  (loop for x in (reverse bits)
        for i from 0
        when (= x 1)
          sum (expt 2 i)))


(defun padding-bits (integer &optional (size 32))
  (let ((bits (list-of-bits integer)))
    (loop repeat (- size (length bits))
          do (push 0 bits)
          finally (return bits))))


(defun flip-bit (bit)
  (if (= bit 1)
      0
      1))

(defun flip-bits (bits)
  (mapcar #'flip-bit bits))


(defun flip-integer (integer)
  (bits-to-integer (flip-bits (padding-bits integer))))


(defun main ()
  (loop repeat (read)
        do (format t "~d~%" (flip-integer (read)))))
