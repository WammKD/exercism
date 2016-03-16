(define-module (raindrops)
  #:export (convert)
  #:autoload (srfi srfi-1) (fold))

(define % modulo)  ;; 'Tis habit.

(define (convert num)
  (let* ([answer (fold
                   (lambda (pair knil)
                     (if (zero? (% num (car pair)))
                         (string-append knil (cdr pair))
                       knil))
                   (number->string num)
                   '((3 . "Pling") (5 . "Plang") (7 . "Plong")))]
         [index  (string-contains answer "Pl")])
    (substring answer (if index index 0))))
