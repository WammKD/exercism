#!/usr/bin/guile
!#
(define-module (hello-world)
  #:export (hello))

;; Sort of unnecessary for so small a program but I've always been confused
;; as to why Guile lacks a println equivalent function or why, in a language
;; that supports vardiatic functions, I can't just handle my printing in one
;; line.
(define (displayln . xs)
  (for-each display xs)
  (newline))

(define* (hello #:optional (name "World"))
  (displayln "Hello, " name "!"))
