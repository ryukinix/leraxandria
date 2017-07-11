(defun do-cancer (&rest cancerous)
  (loop for c in cancerous do (format t "This is cancer! ~a ~%" c)))

(defmacro cancer (&rest body)
  (let ((body-quoted (loop for b in body collect `(quote ,b))))
    `(do-cancer ,@body-quoted)))
