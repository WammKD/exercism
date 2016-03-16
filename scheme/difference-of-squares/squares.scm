(define-module (squares)
  #:export (sum-of-squares
            square-of-sums
            difference)
  #:autoload (srfi srfi-1) (fold iota))

(define (square-of-sums n)
  (expt (fold + 0 (iota n 1)) 2))

(define (sum-of-squares n)
  (fold (lambda (x y)
          (+ (expt x 2) y)) 0 (iota n 1)))

(define (difference n)
  (- (square-of-sums n) (sum-of-squares n)))
