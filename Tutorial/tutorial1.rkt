;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname tutorial1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; (pair? card1 card2 card3 card4) produces true
;;    if 2 of card are the same, and false otherwise
;; pair?: Nat Nat -> Bool
;; requires: 1 <= card <= 13
;; examples:
(check-expect (pair? 1 1 1 1) true)

(define (pair? card1 card2 card3 card4)
  (or (= card1 card2) (= card1 card3)
      (= card1 card4) (= card2 card3)
      (= card2 card4) (= card3 card4)))

;; tests:
(check-expect (pair? 1 2 3 4) false)
(check-expect (pair? 3 3 2 1) true)