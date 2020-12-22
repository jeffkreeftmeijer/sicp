(define (square x) (* x x))

(define (square_sum x y) (+ (square x) (square y)))

(define
  (square_top_two x y z)
  (cond 
    ((and (> x z) (> y z)) (square_sum x y))
    ((and (> x y) (> z y)) (square_sum x z))
    (else (square_sum y z))))
