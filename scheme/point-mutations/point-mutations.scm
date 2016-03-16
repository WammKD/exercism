(define-module (point-mutations)
  #:export (hamming-distance))
(use-modules (srfi srfi-1))

(define ++ 1+)  ;; 'Tis habit.
(define ! not)

(define (hamming-distance strand1 strand2)
  (if (= (string-length strand1) (string-length strand2))
      (fold
        (lambda (elem1 elem2 knil)
          (if (! (char=? elem1 elem2))
              (++ knil)
            knil))
        0
        (string->list strand1)
        (string->list strand2))
    (error "Only equal lengths allowed!")))
