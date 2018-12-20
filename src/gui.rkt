#lang racket
(require
  racket/gui
  racket/draw
  "screens/screen.rkt"
  "screens/mainmenu.rkt"
  ascii-canvas)

(define gui%
  (class object%
    (init-field width-in-chars
                height-in-chars)

    ; Define the active screen
    (define active-screen (new main-menu-screen%))
    
    ; Define the frame
    (define frame
      (new frame%
           [label "Wolf's Den-Racket"]
           [style '(no-resize-border)]))

    ; Define a canvas
    (define canvas 
      (new (class ascii-canvas%
             (inherit-field
              width-in-characters
              height-in-characters)

             (define/override (on-char key-event)
               (case (send key-event get-key-code)
                 ; ESC: Exits
                 [(escape) (exit)]
                 ; Ignore key releases and alts
                 [(release menu) (void)]
                 [else
                  (set! active-screen (send active-screen update key-event))
                  (cond
                    ; if it's a valid screen, draw it
                    [(is-a? active-screen screen%)
                     (send active-screen draw this)
                     (send frame refresh)]
                    ; Exit otherwise
                    [else (exit)])]))

             ; init ascii-canvas fields
             (super-new
              [parent frame]
              [width-in-characters width-in-chars]
              [height-in-characters height-in-chars]))))
                    

    ; Make everything visible
    (send frame show #t)

    ; initial drawing
    (send active-screen draw canvas)
    (send frame refresh)

    ; Finish initialization
    (super-new)))

; Create a new GUI
(define (make-gui wide high)
  (new gui%
       [width-in-chars wide]
       [height-in-chars high]))

(provide make-gui)


