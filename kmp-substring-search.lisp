;; kmp-fp: Substring Search @ HackerRank
;; Date: Thu 13 Jul 2017 08:48:40 AM -03
;; Manoel Vilela

;; FIXME: THIS IMPLEMENTATION IS WRONG, O(n²)

(defun longest-prefix-suffix (n pattern)
  "Get the value of longest prefix of substring pattern on position n
   which match its suffix"
  (loop for end from 0 to n
        for start from n above 0
        for prefix = (subseq pattern 0 (1+ end))
        for suffix = (subseq pattern start (1+ n))
        if (equal prefix suffix)
          maximize (length prefix)))

(defun make-prefix-table (pattern length)
  "Get the shift prefix array table to use on KMP
   algorithm. This value is used to shift string comparison
   on the next evaluation after a mismatch"
  (make-array length :initial-contents
              (loop for x from 0 below length
                    collect (longest-prefix-suffix x pattern))))

;; we have a problem when pattern > string
(defun find-substring (pattern string)
  "Using the KMP algorithm, find the position of the pattern in string if exists
   Otherwise return nil."
  (let* ((pattern-length (length pattern))
         (string-length (length string))
         (prefix (make-prefix-table pattern pattern-length))
         (mismatch 0))
    (when (> pattern-length string-length)
      (return-from find-substring nil))
    (loop for start from 0 below string-length by (1+ (aref prefix mismatch))
          for found = (loop for pattern-index from 0 below pattern-length
                            for string-index from start below string-length
                            do (setq mismatch pattern-index)
                            always (eq (aref string string-index)
                                       (aref pattern pattern-index))
                            finally (return start))
          if found
            return found)))


(defun main ()
  (loop repeat (read)
        for string = (read-line)
        for pattern = (read-line)
        for found = (find-substring pattern string)
        for message = (if found "YES" "NO")
        do (format t "~a~%" message)))

(main)
