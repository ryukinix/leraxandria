;; kmp-fp: Substring Search @ HackerRank
;; Date: Thu 13 Jul 2017 08:48:40 AM -03
;; Manoel Vilela

;; NOTE: I'm programming in Common Lisp or in LOOP-MACRO?

(defun make-prefix-table (pattern length)
  "Get the shift prefix array table to use on KMP
   algorithm. This value is used to shift string comparison
   on the next evaluation after a mismatch"
  (loop with prefix-table = (make-array length :initial-element 0)
         and prefix = 0
        for i from 1 below length
        do (loop while (and (> prefix 0)
                            (not (eq (aref pattern i)
                                     (aref pattern prefix))))
                 do (setq prefix (aref prefix-table (1- prefix))))
        when (eq (aref pattern i)
                 (aref pattern prefix))
          do (incf prefix)
        end
        do (setf (aref prefix-table i) prefix)
        finally (return prefix-table)))


(defun find-substring (pattern string)
  "Using the KMP algorithm, find the position of the pattern in string if exists
   Otherwise return nil."
  (loop with string-length = (length string)
         and pattern-length = (length pattern)
         and string-index = 0
         and pattern-index = 0
        with prefix = (make-prefix-table pattern pattern-length)
        while (< string-index string-length)
        when (eq (aref string string-index)
                 (aref pattern pattern-index))
          do (progn (incf string-index)
                    (incf pattern-index))
        if (= pattern-index pattern-length)
          return (- string-index pattern-index)
        else
          if (and (< string-index string-length)
                  (not (eq (aref string string-index)
                           (aref pattern pattern-index))))
            if (/= pattern-index 0)
              do (setq pattern-index (aref prefix (1- pattern-index)))
        else
          do (incf string-index)))

(defun main ()
  (loop repeat (read)
        for string = (read-line)
        for pattern = (read-line)
        for found = (find-substring pattern string)
        for message = (if found "YES" "NO")
        do (format t "~a~%" message)))

(main)
