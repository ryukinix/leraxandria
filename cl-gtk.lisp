(ql:quickload :cl-cffi-gtk)

(defpackage :gtk-tutorial
  (:use :gtk :gdk :gdk-pixbuf :gobject
        :glib :gio :pango :cairo :common-lisp)
  (:export :example-simple-window :example-hello-world
           :example-text-view-tooltip))

(in-package :gtk-tutorial)

(defun example-simple-window ()
  (within-main-loop
   (let (;; Create a toplevel window.
         (window (gtk-window-new :toplevel)))
     ;; Signal handler for the window to handle the signal "destroy".
     (g-signal-connect window "destroy"
                       (lambda (widget)
                         (declare (ignore widget))
                         (leave-gtk-main)))
     ;; Show the window.
     (gtk-widget-show-all window))))

(defun example-hello-world ()
  (within-main-loop
    (let (;; Create a toplevel window, set a border width.
          (window (make-instance 'gtk-window
                                 :type :toplevel
                                 :title "Hello World"
                                 :default-width 250
                                 :border-width 12))
          ;; Create a button with a label.
          (button (make-instance 'gtk-button :label "Hello World")))
      ;; Signal handler for the button to handle the signal "clicked".
      (g-signal-connect button "clicked"
                        (lambda (widget)
                          (declare (ignore widget))
                          (format t "Hello world.~%")
                          (gtk-widget-destroy window)))
      ;; Signal handler for the window to handle the signal "destroy".
      (g-signal-connect window "destroy"
                        (lambda (widget)
                          (declare (ignore widget))
                          (leave-gtk-main)))
      ;; Signal handler for the window to handle the signal "delete-event".
      (g-signal-connect window "delete-event"
                        (lambda (widget event)
                          (declare (ignore widget event))
                          (format t "Delete Event Occured.~%")
                          +gdk-event-stop+))
      ;; Put the button into the window.
      (gtk-container-add window button)
      ;; Show the window and the button.
      (gtk-widget-show-all window))))


(let ((tooltip nil))
  (defun get-tip (word)
    (cdr (assoc word
                '(("printf" . "(const char *format, ...)")
                  ("fprintf" . "(FILE *stream, const char *format, ...)")
                  ("sprintf" . "(char *str, const char *format, ...)")
                  ("fputc" . "(int c, FILE *stream)")
                  ("fputs" . "(const char *s, FILE *stream)")
                  ("putc" . "(int c, FILE *stream)")
                  ("putchar" . "(int c)")
                  ("puts" . "(const char *s)"))
                :test #'equal)))

  (defun tip-window-new (tip-text)
    (let ((win (make-instance 'gtk-window
                              :type :popup
                              :border-width 0))
          (event-box (make-instance 'gtk-event-box
                                    :border-width 1))
          (label (make-instance 'gtk-label
                                :label tip-text)))
      (gtk-widget-override-font
          label
          (pango-font-description-from-string "Courier"))
      (gtk-widget-override-background-color win
                                            :normal
                                            (gdk-rgba-parse "Black"))
      (gtk-widget-override-color win :normal (gdk-rgba-parse "Blue"))
      (gtk-container-add event-box label)
      (gtk-container-add win event-box)
      win))

  (defun insert-open-brace (window text-view location)
    (let ((start (gtk-text-iter-copy location)))
      (when (gtk-text-iter-backward-word-start start)
        (let* ((word (string-trim " "
                                  (gtk-text-iter-get-text start location)))
               (tip-text (get-tip word)))
          (when tip-text
            (let ((rect (gtk-text-view-get-iter-location text-view location))
                  (win (gtk-text-view-get-window text-view :widget)))
              (multiple-value-bind (win-x win-y)
                  (gtk-text-view-buffer-to-window-coords
                      text-view
                      :widget
                      (gdk-rectangle-x rect)
                      (gdk-rectangle-y rect))
                (multiple-value-bind (x y)
                    (gdk-window-get-origin win)
                  ;; Destroy any previous tool tip window
                  (when tooltip
                    (gtk-widget-destroy tooltip)
                    (setf tooltip nil))
                  ;; Create a new tool tip window
                  (setf tooltip (tip-window-new tip-text))
                  ;; Place it at the calculated position.
                  (gtk-window-move tooltip
                                   (+ win-x x)
                                   (+ win-y y (gdk-rectangle-height rect)))
                  (gtk-widget-show-all tooltip)))))))))

  (defun example-text-view-tooltip ()
    (within-main-loop
      (let* ((window (make-instance 'gtk-window
                                    :title "Multiline Text Search"
                                    :type :toplevel
                                    :default-width 450
                                    :default-height 200))
             (scrolled (make-instance 'gtk-scrolled-window))
             (text-view (make-instance 'gtk-text-view
                                       :hexpand t
                                       :vexpand t))
             (buffer (gtk-text-view-buffer text-view)))
        ;; Signal handler for the window
        (g-signal-connect window "destroy"
                        (lambda (widget)
                          (declare (ignore widget))
                          (when tooltip
                            (gtk-widget-destroy tooltip)
                            (setf tooltip nil))
                          (leave-gtk-main)))
        ;; Signal handler for the buffer of the text view
        (g-signal-connect buffer "insert-text"
           (lambda (buffer location text len)
             (declare (ignore buffer len))
             (when (equal text "(")
               (insert-open-brace window text-view location))
             (when (equal text ")")
               (when tooltip
                 (gtk-widget-destroy tooltip)
                 (setf tooltip nil)))))
        ;; Change the default font
        (gtk-widget-override-font
            text-view
            (pango-font-description-from-string "Monoid 12"))
        ;; Add the widgets to window and show all
        (gtk-container-add scrolled text-view)
        (gtk-container-add window scrolled)
        (gtk-widget-show-all window)))))
