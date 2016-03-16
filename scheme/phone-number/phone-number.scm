(define-module (phone-number)
  #:export (numbers area-code pprint)
  #:autoload (srfi srfi-1) (fold))

(define error_number "0000000000")

(define (numbers number_string)
  (define temp (string-filter char-numeric? number_string))

  (cond
   [(= 10 (string-length temp))            temp]
   [(> 10 (string-length temp))    error_number]
   [(= 11 (string-length temp)) (if (char=? (string-ref temp 0) #\1)
                                    (substring temp 1)
                                  error_number)]
   [else                           error_number]))

(define (area-code number_string)
  (substring (numbers number_string) 0 3))

(define (pprint number_string)
  (define temp (numbers number_string))

  (fold string-append "" (list
                           (substring temp 6)
                           "-"
                           (substring temp 3 6)
                           ") "
                           (substring temp 0 3)
                           "(")))
