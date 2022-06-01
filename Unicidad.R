# Tratamiento de duplicados.

library(dplyr)

df1 <- data.frame(sec = c(1, 2, 3, 4, 5, 6, 7, 8),
                  id = c(1, 1, 1, 3, 3, 4, 4, 4),
                  o = c(1, 1, 2, 1, 3, 3, 1, 2),
                  variant = c("a", "b", "c", "d", "e", "f", "g", "h"))
# reagrupar la variable verifica_id (reducir categorías) y aplicar lo mismo que se viene haciendo, 
# así trabajar como dummy.

# En la parte final para trabajar con sec (u otra variable númerica pero como último paso),
# se debe utilizar esta lógica
t5 <- df1 %>% group_by(id) %>% top_n(n = 1, wt=-o) # Ordenamos por la columna 'o' ascendente
t5

# El caso id=1 tiene dos valores, por eso se debe como paso previo revisar que no haya duplicado con la variables
# que sirve como criterio para depurar (en este caso la variable o para el caso 1 se repite dos veces)