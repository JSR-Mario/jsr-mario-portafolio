#!/usr/bin/env bash
set -euo pipefail

CV_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${CV_DIR}/.." && pwd)"

echo "==> [1/3] Compilando cv.tex con docker cv-builder..."
docker run --rm \
  -v "${CV_DIR}:/work" \
  cv-builder \
  sh -c "pdflatex -interaction=nonstopmode cv.tex >/dev/null && pdflatex -interaction=nonstopmode cv.tex >/dev/null"

echo "==> [2/3] Sincronizando con me/JuanSosa_CV.pdf..."
cp "${CV_DIR}/cv.pdf" "${ROOT_DIR}/me/JuanSosa_CV.pdf"

echo "==> [3/3] Limpiando archivos temporales de LaTeX..."
rm -f "${CV_DIR}"/cv.{aux,bcf,log,out,run.xml,synctex.gz,xdv} "${CV_DIR}/missfont.log" 2>/dev/null || true

echo "==> ¡Compilación y sincronización completada exitosamente!"
