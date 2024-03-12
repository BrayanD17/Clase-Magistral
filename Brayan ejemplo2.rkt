(define (Compose f g)
  (lambda (x)
    (f (g x))))

(define (Add1 x) (+ x 1))
(define (Multiply2 x) (* x 2))

;; Definimos una función que suma 1 al número y luego multiplica el resultado por 2
(define Composed-function (Compose Multiply2 Add1))

;; Usamos la función compuesta con un valor
(define Result (Composed-function 3))
(displayln Result) ; Debería imprimir 8
