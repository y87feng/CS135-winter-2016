;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |tutorial4 book template|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define-struct book (title date))
;; book is a (make-book Sym Nat)
;; 
;;template
;;(define (book? list-of-book)
;;  (cond
;;    [(empty? list-of-book) ...]
;;    [else (...(book-title (first list-of-book))...
;;           ...(book-date (first list-of-book))...
;;           ...(rest list-of-book)...)]))

(define (sort-book list-of-book)
  (cond
    [(empty? list-of-book) empty]
    [else (insert (first list-of-book) (sort-book (rest list-of-book)))]))
(define (insert book slist-of-book)
  (cond
    [(empty? slist-of-book) (cons book empty)]
    [(<= (book-date book) (book-date (first slist-of-book)))
     (cons book slist-of-book)]
    [else (cons (first slist-of-book) (insert book (rest slist-of-book)))]))

(sort-book (list (make-book "The Multics System" 1972)
                 (make-book "The Elements of Programming Style" 1982)
                 (make-book "Operating Systems Principles" 1973)))