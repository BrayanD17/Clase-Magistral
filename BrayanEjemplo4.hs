-- Ejemplo de uso del functor Maybe para modelar efectos y acciones que pueden tener éxito o fallar
safeDivide :: Double -> Double -> Maybe Double
safeDivide _ 0 = Nothing
safeDivide x y = Just (x / y)

main :: IO ()
main = do
    -- División segura de 10 entre 2
    let result1 = safeDivide 10 2
    putStrLn "Resultado 1:"
    case result1 of
        Just x  -> putStrLn $ "El resultado es: " ++ show x
        Nothing -> putStrLn "La división por cero no está permitida."

    -- División segura de 10 entre 0
    let result2 = safeDivide 10 0
    putStrLn "\nResultado 2:"
    case result2 of
        Just x  -> putStrLn $ "El resultado es: " ++ show x
        Nothing -> putStrLn "La división por cero no está permitida."

    -- Mapeo de una función sobre el resultado de safeDivide utilizando el functor Maybe
    let mappedResult = fmap (+ 1) result1
    putStrLn "\nResultado mapeado:"
    case mappedResult of
        Just x  -> putStrLn $ "El resultado mapeado es: " ++ show x
        Nothing -> putStrLn "No se puede mapear sobre un resultado Nothing."
