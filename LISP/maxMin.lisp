(defun readNums (n)
    (loop repeat n
        collect (read)))

(format t "Enter the value of n: ")
(setq n (read))

(format t "Enter the numbers: ")
(setq nums (readNums n))

(setq max (apply #'max nums))
(format t "Maximum: ~a~%" max)

(setq min (apply #'min nums))
(format t "Minimum: ~a~%" min)