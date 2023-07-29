(defun readNums (n)
    (loop repeat n
        collect (read)))

(format t "Enter the value of n: ")
(setq n (read))

(format t "Enter the numbers: ")
(setq nums (readNums n))
(format t "The numbers are: ~a~%" nums)

(setq sum (apply #'+ nums))
(setq avg (/ sum n))

(format t "Sum = ~a~%" sum)
(format t "Average = ~,2f~%" avg)
