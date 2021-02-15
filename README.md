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

# Exercise 1.14

    $ cat ex_1.14.rkt
    (define (first-denomination kinds-of-coins)
      (cond ((= kinds-of-coins 1) 1)
            ((= kinds-of-coins 2) 5)
            ((= kinds-of-coins 3) 10)
            ((= kinds-of-coins 4) 25)
            ((= kinds-of-coins 5) 50)))

    (define (cc amount kinds-of-coins)
      (cond ((= amount 0) 1)
            ((or (< amount 0) (= kinds-of-coins 0)) 0)
            (else (+ (cc amount (- kinds-of-coins 1))
                     (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))

    (define (count-change amount) (cc amount 5))
    $ racket --load ex_1.14.rkt --repl
    Welcome to Racket v7.9 [bc].
    > (count-change 11)
    4
    > (exit)

# Exercise 1.21

    $ cat ex_1.21.rkt
    (define (divides? a b) (= (remainder b a) 0))

    (define (square x) (* x x))

    (define (smallest-divisor n)
      (find-divisor n 2))

    (define (find-divisor n test)
      (cond ((> (square test) n) n)
            ((divides? test n) test)
            (else (find-divisor n (+ test 1)))))

    $ racket --load ex_1.21.rkt --repl
    Welcome to Racket v7.9 [bc].
    > (smallest-divisor 199)
    199
    > (smallest-divisor 1999)
    1999
    > (smallest-divisor 19999)
    7
    > (exit)

# Exercise 2.1

    $ cat ex_2.1.rkt 
    (define (make-rat n d) 
      (cond ((< d 0) (cons (- 0 n) (- 0 d)))
            (else (cons n d))))

    $ racket --load ex_2.1.rkt --repl
    Welcome to Racket v7.9 [bc].
    > (make-rat 1 2)
    '(1 . 2)
    > (make-rat -1 -2)
    '(1 . 2)
    > (make-rat -1 2)
    '(-1 . 2)
    > (make-rat 1 -2)
    '(-1 . 2)

# Exercise 2.2

    $ cat ex_2.2.rkt
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

    ~/sicp (master) 🦞 racket --load ex_2.2.rkt --repl
    Welcome to Racket v7.9 [bc].
    > (midpoint-segment (make-segment (make-point 0 0) (make-point 1 1))) 
    '(1/2 . 1/2)
