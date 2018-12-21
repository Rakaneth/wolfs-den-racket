#lang racket

(require "../../point.rkt")

(provide (struct-out entity)
         (struct-out creature)
         (struct-out item)
         (struct-out equipment))
                        

; private vals
(define cur-id 0)
(define (next-id!)
  (set! cur-id (add1 cur-id)))

; Struct definitions

(struct entity
  [id name desc glyph color pos] #:transparent)

(struct creature
  [inventory stg stam spd skl sag smt vis effects capacity] #:transparent #:super struct:entity)

(struct item
  [owner amt uses] #:transparent #:super struct:entity)

(struct equipment
  [atp dfp tou res dmg wil pwr dly] #:transparent #:super struct:item)



    







