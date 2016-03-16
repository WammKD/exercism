(define-module (leap-year)
  #:export (leap-year?))

(define % modulo)  ;; 'Tis habit
(define ! not)

(define (leap-year? year)
  (if (and
        (zero? (% year 4))
        (or
          (! (zero? (% year 100)))
          (zero? (% year 400))))
      #t
    #f))
