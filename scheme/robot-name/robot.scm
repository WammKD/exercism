(define-module (robot)
  #:export (build-robot
            robot-name
            reset-name)
  #:autoload (ice-9 common-list) (some))

(define used-names '())

(define (build-robot)
  (define name "")
  (define (reset-name)
    (set! name (list->string (map integer->char (list
                                                  (+ (random 26) 65)
                                                  (+ (random 26) 65)
                                                  (+ (random 10) 48)
                                                  (+ (random 10) 48)
                                                  (+ (random 10) 48)))))
    (if (some (lambda (n)
                  (string=? n name)) used-names)
        (reset-name)
      (set! used-names (cons name used-names))))

  (lambda (method)
    (cond
     [(eq? method #:get-name)   (when (string=? "" name)
                                  (reset-name))
                                name]
     [(eq? method #:reset-name) (reset-name)])))

(define (robot-name robot)
  (robot #:get-name))

(define (reset-name robot)
  (robot #:reset-name))
