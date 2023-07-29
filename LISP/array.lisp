(setq arr #(10 20 30 40 50))

(format t "Array: ")
(dotimes (i (length arr))
    (format t "~a " (aref arr i)))