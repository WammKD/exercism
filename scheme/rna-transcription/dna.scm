(define-module (dna)
  #:export (to-rna))

(define (to-rna strand)
  (string-map (lambda (letter)
                (cond
                 [(char=? #\G letter) #\C]
                 [(char=? #\C letter) #\G]
                 [(char=? #\T letter) #\A]
                 [(char=? #\A letter) #\U])) strand))
