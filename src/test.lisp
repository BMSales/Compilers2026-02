(defun hello-world ()
  (format t "hello world"))

(hello-world)


? (forall '(2 4 6 12) #'even) ; Is every element a number?
T
? (forall '(1 2 (3) 4) #even)
NIL
? (forall '(nil nil nil nil) #'null) ; Is every element null?
T
? (forall '(nil definitely-not nil) #'null)
NIL
