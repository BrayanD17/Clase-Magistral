;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CODIGO ORIGINAL HECHO EN CLASE Y REPOSITORIO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;LISTA DE PRODUCTOS DE LA FORMA NOMBRE CANT P/U
(define listaProductos '(
                         ("Arroz" 8 1800)
                         ("Leche" 17 950)
                         ("Maíz" 5 1200)
                         ("Posta Cerdo" 2 3100)
                         ("Mantequilla" 7 1100)
                         ("Avena" 7 1100)
                         ("Filet Pescado" 3 1500)
                         ("Queso" 9 2500))
  )

;;LISTA QUE REPRESENTAN FACTURAS DE LA FORMA NOMBRE CANT P/U
(define primerFactura '(("Azúcar" 3 1000)
                        ("Café" 2 2800))
  )

(define segundaFactura '(("Arroz" 2 1800)
                         ("Azúcar" 1 1000)
                         ("Leche" 5 1200))
  )

;;METODOS/FUNCIONES
(define (agregarProducto lista nombre cant c/u )
  (cond
    ((null? lista)
     (list(list nombre cant c/u)))
    ((equal? nombre (caar lista))
     (cons (list (caar lista)
                 (+ (cadar lista) cant) c/u)
           (cdr lista)))
    (else
     (cons (car lista) (agregarProducto (cdr lista) nombre cant c/u))
     )
    )
  )

(define (venderProducto lista nombre cant)
  (cond
    ((null? lista)
     (display "No se encontro el producto") '() )
    ((equal? nombre (caar lista))
     (cons (list (caar lista)
                 (- (cadar lista) cant) (cddar lista))
           (cdr lista)))
    (else
     (cons (car lista) (venderProducto(cdr lista) nombre cant))
     )
    )
  )

(define (existenciasMinimas lista cant)
  (filter (lambda (x) (<= (cadr x) cant)
            lista)
          )
  )

(define (impuestoTotalFactura factura umbral)
  (cond
    ((null? factura)
     0)
    ((> (caddar factura) umbral)
     (+ (* (caddar factura)(cadar factura) 0.13)
        (impuestoTotalFactura (cdr factura) umbral)))
    (else
     (+ 0 (impuestoTotalFactura (cdr factura) umbral)))
    )
  )

(define (subtotalFactura factura)
  (if (null? factura)
      0                                           
      (+ (* (caddar factura) (cadar factura))     
         (subtotalFactura (cdr factura)))))

;;AGREGANDO ESTRUCTURAS PARA APLICACION DEL FUNCTOR
(define (categoriaProducto producto)
  (cond
    ((equal? (car producto) "Arroz") 'Cereales)
    ((equal? (car producto) "Maíz") 'Cereales)
    ((equal? (car producto) "Avena") 'Cereales)
    ((equal? (car producto) "Leche") 'Lacteos)
    ((equal? (car producto) "Queso") 'Lacteos)
    ((equal? (car producto) "Mantequilla") 'Lacteos)
    ((equal? (car producto) "Filet Pescado") 'Carnes)
    ((equal? (car producto) "Posta Cerdo") 'Carnes)
    (else 'otro)
    )
  )

(define (categorizarProductos listaProductos categorizador)
  (map (lambda (producto)
         (cons (categorizador producto) (cadr producto)))
       listaProductos))




