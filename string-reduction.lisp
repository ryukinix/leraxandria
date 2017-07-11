;; Enter your code here. Read input from STDIN. Print output to STDOUT
;; this code is from HackerRank contest 2017

(defun main ()
  (format t "~a~%" (remove-duplicates (read-line) :from-end t)))

(main)
