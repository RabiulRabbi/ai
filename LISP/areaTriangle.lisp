(format t "Enter the sides of the triangle: ")
(setq 
    a (read)
    b (read)
    c (read))

(setq s (/ (+ a b c) 2))
(setq area (sqrt (* s (- s a) (- s b) (- s c))))

(format t "Triangle Area: ~,2f~%" area)