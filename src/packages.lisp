;; Manoel Vilela


(defpackage #:leraxandria
  (:use #:cl
        #:cl-user
        #:leraxandria/math
        #:leraxandria/meta
        #:leraxandria/string)
  (:export #:primep ;; leraxandria/math
           #:factors
           #:common-divisors
           #:bits-to-integer
           #:list-of-bits
           #:memoize ;; leraxandria/meta
           #:transduce
           #:range
           #:partial
           #:comp
           #:filter
           #:find-substring ;; leraxandria/string
           #:staircase
           #:triangle
           #:compress-string))
