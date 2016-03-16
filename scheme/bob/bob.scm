(define-module (bob)
  #:export (response-for))

(define -- 1-)  ;; 'Tis habit.

(define (response-for response)
  (cond
   [(string=?         ""   (string-trim response))       "Fine. Be that way!"]
   [(or
      (string-suffix? "!"  response)
      (and
        (< 0 (string-count response char-alphabetic?))
        (= 0 (string-count response char-lower-case?))))   "Whoa, chill out!"]
   [(string-suffix?   "?"  response)                                  "Sure."]
   [else                                                          "Whatever."]))
