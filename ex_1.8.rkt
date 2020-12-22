(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (improve guess x)
  (/ (+ (* 2 guess) (square (/ x guess))) 3))

(define (cube-root-iter guess previous-guess x)
  (if (< (abs(- previous-guess guess)) 0.001)
    guess
    (cube-root-iter (improve guess x) guess x)))

(define (cube-root x) 
  (cube-root-iter 1.0 0.0 x))
