;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname tutorial4.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define-struct customer (name fav-topping))
;; A Customer is a (make-customer Sym Sym)

;; (good-topping? customer topping)consumes a list of Customers and a
;; Symbol representing a pizza topping and produce true
;; only if at least one Customer’s favourite topping is the given topping.

;;Definition:
(define (good-topping? list-of-customer topping)
  (cond
    [(empty? list-of-customer) false]
    [else (cond
            [(symbol=? topping (customer-fav-topping (first list-of-customer))) true]
            [else (good-topping? (rest list-of-customer) topping)])]))

(check-expect (good-topping? (list (make-customer 'Julia 'meat) (make-customer 'Iris 'onion)) 'vegetable) false)
(check-expect (good-topping? (list (make-customer 'Julia 'meat) (make-customer 'Iris 'onion)) 'onion) true)