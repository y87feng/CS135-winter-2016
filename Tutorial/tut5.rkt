;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname tut5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (remove-firsts listof-any)
  (cond
    [(empty? listof-any) empty]
    [(empty? (first listof-any)) (cons empty (remove-firsts (rest listof-any)))]
    [else (cons (rest (first listof-any))
                (remove-firsts (rest listof-any)))]))