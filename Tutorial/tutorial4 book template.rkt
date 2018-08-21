;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |tutorial4 book template|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define-struct book (title date))
;; book is a (make-book Str Nat)
;; 
;;template
;;(define (book? list-of-book)
;;  (cond
;;    [(empty? list-of-book) ...]
;;    [else (...(book-title (first list-of-book))...
;;           ...(book-date (first list-of-book))...
;;           ...(rest list-of-book)...)]))

;; (sort-book list-of-book)sorts the list into
;;    chronological order (oldest to newest)
;; sort-book: (listof book) -> (listof book)
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



;; (books-published date list-of-book1)that consumes a number representing a year and a
;;    list of Books and produce a list of Books that
;;   contains all the books published in that year
;; books-published: Nat (listof book) -> (listof book)

(define (books-published date list-of-book1)
  (cond
    [(empty? list-of-book1) empty]
    [else (cond
            [(= date (book-date (first list-of-book1))) (cons (first list-of-book1)
                                                              (books-published date (rest list-of-book1)))]
            [else (books-published date (rest list-of-book1))])]))

(books-published 1973 (list (make-book "The Multics System" 1972)
                 (make-book "The Elements of Programming Style" 1982)
                 (make-book "Operating Systems Principles" 1973)))


;;(sbooks-published date listof-book) produce a list of Books that contains all the
;;   books published in that year.
;; sbooks-published: Nat (listof book) -> (listof book)

(define (sbooks-published date listof-book)
  (cond
    [(empty? listof-book) empty]
    [(> date (book-date (first listof-book))) (sbooks-published date (rest listof-book))]
    [(< date (book-date (first listof-book))) empty]
    [else (cons (first listof-book) (sbooks-published date (rest listof-book)))]))

(sbooks-published 1973 (list (make-book "The Multics System" 1972)
                 (make-book "The Elements of Programming Style" 1973)
                 (make-book "Operating Systems Principles" 1983)))