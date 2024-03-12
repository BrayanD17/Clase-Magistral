
;Mapeo de datos


(define (list-functor mapper lst)
  (map mapper lst))

(define (Add1 x)
         (+ x 1))

(define lista '(1 2 3 4 5))
(displayln "Lista original:")
(displayln lista)
(displayln "Aplicando add1 a la lista:")
(displayln (list-functor Add1 lista))
