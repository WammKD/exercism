(define-module (nucleotide-count)
  #:export (nucleotide-counts dna-count)
  #:autoload (srfi srfi-1) (count))

(define ++ 1+)

(define (nucleotide-counts dna)
  (define result (make-hash-table 4))
  (map (lambda (x)
         (hash-set! result x 0)) '(#\A #\C #\G #\T))

  (string-for-each (lambda (char)
                     (hash-set!
                       result
                       char
                       (++ (hash-ref result char)))) dna)
  (sort (hash-map->list cons result) (lambda (x y)
                                       (char<? (car x) (car y)))))

(define (dna-count nucleotide dna)
  (if (null? (filter (lambda (x)
                       (char=? x nucleotide)) '(#\A #\C #\G #\T)))
      (error "Not a valid dna nucleotide!")
    (count (lambda (x)
             (char=? x nucleotide)) (string->list dna))))

