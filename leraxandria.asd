(asdf:defsystem #:leraxandria/math
  :description "A library of lerax functions, macros and applications: math"
  :author "Manoel Vilela <manoel_vilela@engineer.com>"
  :license "BSD"
  :version "0.1.0"
  :serial t
  :pathname "src/math"
  :components ((:file "package")
               (:file "fib-iter" :depends-on ("package"))
               (:file "flipping-bits" :depends-on ("package"))
               (:file "huge-gcd" :depends-on ("package"))
               (:file "lonely-integer" :depends-on ("package"))
               (:file "plus-minus" :depends-on ("package"))
               (:file "polygon-area" :depends-on ("package"))
               (:file "polygon-perimeter" :depends-on ("package"))
               (:file "polynomial-volume-area-integral"
                :depends-on ("package"))
               (:file "prime-check" :depends-on ("package"))
               (:file "prime-factors"
                :depends-on ("package" "prime-check"))
               (:file "common-divisors"
                :depends-on ("package" "prime-factors"))))

(asdf:defsystem #:leraxandria/meta
  :description "A library of lerax functions, macros and applications: meta"
  :author "Manoel Vilela <manoel_vilela@engineer.com>"
  :license "BSD"
  :version "0.1.0"
  :serial t
  :pathname "src/meta"
  :components ((:file "package")
               (:file "memoization" :depends-on ("package"))
               (:file "transducer" :depends-on ("package"))))

(asdf:defsystem #:leraxandria/string
  :description "A library of lerax functions, macros and applications: string"
  :author "Manoel Vilela <manoel_vilela@engineer.com>"
  :license "BSD"
  :version "0.1.0"
  :serial t
  :pathname "src/string"
  :components ((:file "package")
               (:file "kmp-substring-search" :depends-on ("package"))
               (:file "staircase" :depends-on ("package"))
               (:file "string-compression" :depends-on ("package"))))

(asdf:defsystem #:leraxandria/apps
  :description "A library of lerax functions, macros and applications: apps"
  :author "Manoel Vilela <manoel_vilela@engineer.com>"
  :license "BSD"
  :version "0.1.0"
  :serial t
  :pathname "apps"
  :components ((:file "brainfuck-interpreter")
               (:file "game-of-life")
               (:file "game-of-life-lain")))

(asdf:defsystem #:leraxandria/gui
  :description "A library of lerax functions, macros and applications: GUIs"
  :author "Manoel Vilela <manoel_vilela@engineer.com>"
  :license "BSD"
  :version "0.1.0"
  :serial t
  :pathname "apps/gui"
  :depends-on (:cl-cffi-gtk)
  :components (
               (:file "cl-gtk-example")
               (:file "package" :depends-on ("cl-gtk-example"))
               ))


(asdf:defsystem #:leraxandria
  :description "A library of lerax functions, macros and applications"
  :author "Manoel Vilela <manoel_vilela@engineer.com>"
  :license "BSD"
  :version "0.1.0"
  :depends-on (#:leraxandria/math
               #:leraxandria/string
               #:leraxandria/meta)
  :serial t
  :pathname "src"
  :components ((:file "packages")))
