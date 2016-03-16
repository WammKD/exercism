(define-module (grains)
  #:export (square total)
  #:autoload (srfi srfi-1) (iota fold))

(define -- 1-)  ;; 'Tis habit.

(define (square n)
  (expt 2 (-- n)))

(define (total)
  (fold (lambda (n knil)
          (+ (square n) knil)) 0 (iota 64 1)))
