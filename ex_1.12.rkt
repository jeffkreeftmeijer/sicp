(define (pascal row column)
  (cond ((= row 1) 1)
        ((or (= column 1) (= column row)) 1)
        (else (+ (pascal (- row 1) (- column 1)) (pascal (- row 1) column)))))
