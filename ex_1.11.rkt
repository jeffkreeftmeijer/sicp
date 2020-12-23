(define (f_recursive n)
  (cond ((< n 3) n)
        (else (+ (f_recursive (- n 1))
                 (* 2 (f_recursive (- n 2)))
                 (* 3 (f_recursive (- n 3)))))))

(define (f_iterative n)
  (f_iterative-iter 2 1 0 (- n 2)))

(define (f_iterative-iter a b c n)
  (cond ((= n 0) a)
        (else (f_iterative-iter (+ a (* 2 b) (* 3 c)) a b (- n 1)))))
