# Reglas del Portafolio (jsr-mario-portafolio)

## Modificación del Curriculum Vitae (CV)
- **Sincronización Obligatoria de Binarios:** Cada vez que se modifique `cv/cv.tex`, es obligatorio compilar el documento y actualizar **ambas** copias del PDF antes de hacer commit:
  1. `cv/cv.pdf` (copia en el directorio de fuentes LaTeX).
  2. `me/JuanSosa_CV.pdf` (archivo servido en producción por Nginx para el botón de descarga del portafolio).
- **Prohibido dejar el PDF desactualizado:** Ningún PR o rama de cambio de CV puede cerrarse o fusionarse sin incluir los dos archivos PDF recompilados.
- **Compilación en 1 solo paso:** No realizar pruebas exploratorias de compiladores. Ejecutar directamente:
  ```bash
  ./cv/compile.sh
  ```
  Este script compila con LaTeX (`cv-builder`), actualiza ambos binarios y limpia archivos temporales de forma automática.
- **Flujo Git y Producción:**
  - Todo cambio se realiza en una rama de característica (`feat/...`, `fix/...`).
  - Subir la rama al remoto con `git push -u origin <rama>`.
  - Regresar siempre a `main` tras subir los cambios (`git checkout main`).
