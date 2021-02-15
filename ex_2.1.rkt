(define (make-rat n d) 
  (cond ((< d 0) (cons (- 0 n) (- 0 d)))
        (else (cons n d))))
