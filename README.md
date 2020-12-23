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

    (define (improve guess x)
      (average guess (/ x guess)))

    (define (sqrt-iter guess previous-guess x)
      (if (< (abs(- previous-guess guess)) 0.001)
        guess
        (sqrt-iter (improve guess x) guess x)))

    (define (sqrt x)
      (sqrt-iter 1.0 0.0 x))
    $ racket --load ex_1.7.rkt --repl
    Welcome to Racket v7.9 [bc].
    > (sqrt 9)
    3.000000001396984
    > (sqrt 0.00009)
    0.009487978730289174
    > (exit)
    $

## Excercise 1.8

    $ cat ex_1.8.rkt
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
    $ racket --load ex_1.8.rkt --repl
    Welcome to Racket v7.9 [bc].
    > (cube-root 27)
    9.000000000053902
    > (exit)
    $

## Exercise 1.11

    $ cat ex_1.11.rkt
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
    $ racket --load ex_1.11.rkt --repl
    Welcome to Racket v7.9 [bc].
    > (f_recursive 5)
    25
    > (f_iterative 5)
    25
    > (exit)
    $

# Exercise 1.12

    $ cat ex_1.12.rkt
    (define (pascal row column)
      (cond ((= row 1) 1)
            ((or (= column 1) (= column row)) 1)
            (else (+ (pascal (- row 1) (- column 1)) (pascal (- row 1) column)))))
    $ racket --load ex_1.12.rkt --repl
    Welcome to Racket v7.9 [bc].
    > (pascal 1 1)
    1
    > (pascal 2 1)
    1
    > (pascal 2 2)
    1
    > (pascal 3 1)
    1
    > (pascal 3 2)
    2
    > (pascal 3 3)
    1
    > (exit)
