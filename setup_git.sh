#!/bin/bash

# Script de inicialización para Git y deployment

echo "🚀 Inicializando repositorio Git..."

# Inicializar repositorio si no existe
if [ ! -d .git ]; then
    git init
    echo "✅ Repositorio Git inicializado"
else
    echo "⚠️  Repositorio Git ya existe"
fi

# Agregar archivos
git add .
echo "✅ Archivos agregados al staging"

# Primer commit
git commit -m "Initial commit: Sistema de Detección de Fraude con K-means"
echo "✅ Commit inicial creado"

echo ""
echo "📝 Siguiente paso: Conectar con GitHub"
echo "Ejecuta estos comandos (reemplaza con tu URL de repositorio):"
echo ""
echo "  git remote add origin https://github.com/tu-usuario/tu-repositorio.git"
echo "  git branch -M main"
echo "  git push -u origin main"
echo ""
echo "🌐 Para deployar en Render:"
echo "  1. Ve a https://render.com"
echo "  2. Conecta tu repositorio de GitHub"
echo "  3. Crea un nuevo Web Service"
echo "  4. Render detectará automáticamente el render.yaml"
echo ""
