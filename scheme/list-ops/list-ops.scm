(define-module (list-ops)
  #:export (my-length
            my-reverse
            my-map
            my-filter
            my-fold
            my-append
            my-concatenate
            ))

(define ++ 1+)

(define (my-length lst)
  (let ml ([len   0]
           [l   lst])
    (if (null? l)
        len
      (ml (++ len) (cdr l)))))

(define (my-length2 lst)
  (if (null? lst)
      0
    (+ 1 (my-length (cdr lst)))))



(define (my-reverse lst)
  (let mr ([new '()]
           [l   lst])
    (if (null? l)
        new
      (mr (cons (car l) new) (cdr l)))))



(define (my-map funct lst)
  (let mm ([new '()]
           [l   lst])
    (if (null? l)
        (my-reverse new)
      (mm (cons (funct (car l)) new) (cdr l)))))

(define (my-map2 funct lst)
  (if (null? lst)
      '()
    (cons (funct (car lst)) (my-map funct (cdr lst)))))



(define (my-filter pred lst)
  (let mf ([new '()]
           [l   lst])
    (if (null? l)
        (my-reverse new)
      (mf (if (pred (car l))
              (cons (car l) new)
            new) (cdr l)))))

(define (my-filter2 pred lst)
  (if (null? lst)
      '()
    (if (pred (car lst))
        (cons (car lst) (my-filter pred (cdr lst)))
      (my-filter pred (cdr lst)))))



(define (my-fold proc init lst)
  (if (null? lst)
      init
    (my-fold proc (proc (car lst) init) (cdr lst))))



(define (my-append lst element)
  (let ma ([l (my-reverse lst)]
           [e          element])
    (if (null? l)
        e
      (ma (cdr l) (cons (car l) e)))))

(define (my-append2 lst element)
  (if (null? lst)
      element
    (cons (car lst) (my-append (cdr lst) element))))



(define (my-concatenate lst)
  (if (null? lst)
      lst
    (let mc ([l (car lst)])
      (if (null? l)
          (my-concatenate (cdr lst))
        (cons (car l) (mc (cdr l)))))))
