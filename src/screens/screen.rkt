#lang racket
(define screen%
  (class object%

    ; should return the next screen to use
    (define/public (update key-event)
      (error 'screen% "Override this method"))

    ; called when gui needs to render the screen
    (define/public (draw canvas)
      (error 'screen% "Override this method"))

    (super-new)))

(provide screen%)
