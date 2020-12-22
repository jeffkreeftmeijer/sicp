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

## Excercise 1.7

    $ cat ex_1.7.rkt
    (define (square x)
      (* x x))

    (define (average x y)
      (/ (+ x y) 2))

    (define (good-enough? guess x)
      (< (abs(- (square guess) x)) 0.001))

    (define (improve guess x)
      (average guess (/ x guess)))

    (define (sqrt-iter guess x)
      (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

    (define (sqrt x)
      (sqrt-iter 1.0 x))
    $ racket --load ex_1.7.rkt --repl
    Welcome to Racket v7.9 [bc].
    > (sqrt 9)
    3.00009155413138
    > (sqrt 0.0009)
    0.04030062264654547
    > (exit)
    $
