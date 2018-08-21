;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname tutorial4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (sort lon)
  (cond
    [(empty? lon) empty]
    [else (insert (first lon) (sort (rest lon)))]))

(define (insert n lon)
  (cond
    [(empty? lon) (cons n empty)]
    [(<= n (first lon)) (cons n lon)]
    [else (cons (first lon) (insert n (rest lon)))]))