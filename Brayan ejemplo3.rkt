(define (make-tree value . children)
  (cons value children))

(define (tree-value tree)
  (car tree))

(define (tree-children tree)
  (cdr tree))

(define (map-tree f tree)
  (cond
    ((null? tree) '())
    (else
     (cons (f (tree-value tree))
           (map (lambda (child) (map-tree f child))
                (tree-children tree))))))

;; Ejemplo de uso de map-tree
(define my-tree (make-tree 1 (make-tree 2) (make-tree 3 (make-tree 4) (make-tree 5))))
(displayln "Arbol original:")
(displayln my-tree)

(define (Add1 x) (+ x 1))

(define mapped-tree (map-tree Add1 my-tree))
(displayln "Arbol después de aplicar Add1 a cada nodo:")
(displayln mapped-tree)