# http://destio.us.es/calvo/descargas/asig/demografia/RparaDemografia.pdf
# Hasta la p+agina 35

#  download.file(url="https://www.ecuadorencifras.gob.ec/documentos/web-inec/Poblacion_y_Demografia/Proyecciones_Poblacionales/PROYECCION_POR_EDADES_PROVINCIAS_2010-2020_Y_NACIONAL_2010-2020.xlsx", destfile = "pob_proy.xlsx")
# datosweb = read.table("pob_proy.xlsx")


# Leer archivo de un excel y adecuar
library(readxl)
datos = read_excel("PROYECCION_PROVINCIAS_SEXOS_Y_AREAS_2010_2020.xlsx",sheet = 1, range = "B5:M46", col_names = T)

# filtrar casos sin NA
library(dplyr)
datos=datos %>%
  filter(!is.na(PROVINCIAS))
knitr::kable(datos)

# Eliminar la fila TOTAL PAÍS
datos=datos %>% filter(PROVINCIAS != c("TOTAL PAÍS"))

# Crea variable con casos T/F según coincidencia de texto REGION... (para dejar sólo provincias)
datos = datos %>% mutate(REGION=grepl("REGIÓN", datos$PROVINCIAS))  # grepl admite un sólo valor

datos=datos %>% filter(REGION == "FALSE") %>% select(-REGION)
knitr::kable(datos)

save(datos,file="Proyeccion guardado excel.RData")
# para cargar
# load("Proyeccion guardado excel.RData")
