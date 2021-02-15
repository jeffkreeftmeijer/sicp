(define (make-point x y) 
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-segment start-segment end-segment)
  (cons start-segment end-segment))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (midpoint-segment segment)
  (make-point 
    (/ 
      (+ 
        (x-point (start-segment segment))
        (x-point (end-segment segment)))
      2)
    (/ 
      (+
        (y-point (start-segment segment))
        (y-point (end-segment segment)))
      2)))

