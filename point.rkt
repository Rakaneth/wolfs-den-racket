#lang racket
(struct point (x y)
  #:transparent)

(provide (all-defined-out))

(define (dist ptA ptB)
  (max (abs (- (point-x ptA) (point-x ptB)))
       (abs (- (point-y ptA) (point-y ptB)))))

(define (adjacent? ptA ptB)
  (= 1 (dist ptA ptB)))

(define (to-index pt width)
  (+ (* (point-y pt) width) (point-x pt)))

(define (from-index idx width)
  (point (modulo idx width) (quotient idx width)))

 

 