(define-module (anagram)
  #:export (anagrams-for))

(define ! not)  ;; 'Tis habit.
(define ++ 1+)

(define (anagrams-for word lst)
  (let af ([orig_str      (string-downcase word)]
           [word_str      (string-downcase word)]
           [compare_lst (string->list (car lst))]
           [compare_str                (car lst)]
           [cdr_lst                    (cdr lst)]
           [sub_lst                          '()]
           [check_length                      #t])
    (cond
     [(null? cdr_lst)
           sub_lst]
     [check_length
           (if (! (=
                    (string-length word_str)
                    (string-length compare_str)))
               (af orig_str word_str (string->list
                                       (car cdr_lst)) (car cdr_lst) (cdr cdr_lst) sub_lst #t)
             (af orig_str word_str compare_lst compare_str cdr_lst sub_lst #f))]
     [(string=? word_str "")
           (af orig_str orig_str (string->list
                                   (car cdr_lst)) (car cdr_lst) (cdr cdr_lst) (append sub_lst (list compare_str)) #t)]
     [(string-index (string-downcase word_str) (char-downcase (car compare_lst)))
           (let ([index (string-index
                          (string-downcase word_str)
                          (char-downcase (car compare_lst)))])
             (af orig_str (string-concatenate (list
                                                (substring word_str 0 index)
                                                (substring word_str (++ index)))) (cdr compare_lst) compare_str cdr_lst sub_lst check_length))]
     [else (af orig_str orig_str (string->list
                                   (car cdr_lst)) (car cdr_lst) (cdr cdr_lst) sub_lst #t)])))
