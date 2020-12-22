# SICP Exercises

## Setup

    $ brew install racket

## Exercise 1.3

    $ cat ex_1.3.rkt
    (define (square x) (* x x))

    (define (square_sum x y) (+ (square x) (square y)))

    (define
      (square_top_two x y z)
      (cond
        ((and (> x z) (> y z)) (square_sum x y))
        ((and (> x y) (> z y)) (square_sum x z))
        (else (square_sum y z))))
    $ racket --load ex_1.3.rkt --repl
    Welcome to Racket v7.9 [bc].
    > (square_top_two 1 2 3)
    13
    > (exit)
    $
