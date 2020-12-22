(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

; Given a guess y, the result is "good enough" if y^2 is
; within 0.001 of x.
(define (good-enough? guess x)
  (< (abs(- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

; y such that y >= 0 and y^2 = x
;
; Given a guess y for the value of x^2, get a better guess
; by averaging y with x/y, until the result is "good enough".

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) guess x)))

(define (sqrt x) 
  (sqrt-iter 1.0 0.0 x))
