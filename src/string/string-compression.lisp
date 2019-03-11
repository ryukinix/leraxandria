;; Enter your code here. Read input from STDIN. Print output to STDOUT

(in-package :leraxandria/string)

;; "aaabbc" => ((#\a  3) (#\b  2) (#\c  1))
(defun string-char-map (string)
  (let ((alist nil))
    (loop for x across string
          if (and (last alist)
                  (eq (caar (last alist)) x))
            do (incf (cadar (last alist)))
          else
            do (setf alist (append alist (list (list x 1))))
          finally (return alist))))

(defun join-char-map (char-map)
  (apply #'append (mapcar (lambda (x) (if (= (second x) 1)
                                       (list (car x))
                                       x))
                          char-map)))

(defun compress-string (string)
  (format nil "~{~A~}" (join-char-map (string-char-map string))))

(eval-when (:execute)
  (defun main ()
    (format t "~A~%" (compress-string (read-line))))
  (main))
