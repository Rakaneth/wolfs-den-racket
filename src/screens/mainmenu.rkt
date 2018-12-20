#lang racket
(require
  "screen.rkt")

(define main-menu-screen%
  (class screen%
    (define/override (update key-event)
      ; TODO (new game-screen%)
      this)
    (define/override (draw canvas)
      (send canvas clear)
      (send canvas write-center "Wolf's Den: Racket Edition" 10)
      (send canvas write-center "Press any key" 12))
    (super-new)))

(provide main-menu-screen%)
