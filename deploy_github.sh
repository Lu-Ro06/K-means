#!/bin/bash

echo "🚀 Script de Deploy a GitHub y Render"
echo "======================================"
echo ""

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Verificar que estamos en el directorio correcto
if [ ! -f "app.py" ]; then
    echo -e "${RED}❌ Error: No se encuentra app.py${NC}"
    echo "Por favor ejecuta este script desde el directorio del proyecto"
    exit 1
fi

echo -e "${BLUE}📋 Verificando archivos...${NC}"
echo ""

# Verificar que las imágenes existan
if [ ! -d "static/images" ]; then
    echo -e "${RED}❌ Error: No existe el directorio static/images/${NC}"
    exit 1
fi

# Contar imágenes
IMAGE_COUNT=$(ls static/images/*.png 2>/dev/null | wc -l)
echo -e "${GREEN}✅ Imágenes encontradas: $IMAGE_COUNT${NC}"

# Verificar .gitignore
if [ ! -f ".gitignore" ]; then
    echo -e "${RED}❌ Error: No existe .gitignore${NC}"
    exit 1
fi

echo -e "${GREEN}✅ .gitignore configurado (datasets/ excluido)${NC}"

# Verificar archivos importantes
echo ""
echo -e "${BLUE}📄 Archivos del proyecto:${NC}"
FILES=("app.py" "requirements.txt" "Procfile" "runtime.txt" "render.yaml" "README.md")
for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${GREEN}  ✅ $file${NC}"
    else
        echo -e "${RED}  ❌ $file (faltante)${NC}"
    fi
done

echo ""
echo -e "${YELLOW}⚠️  IMPORTANTE: El dataset NO se subirá a GitHub (excluido en .gitignore)${NC}"
echo ""

# Preguntar si desea continuar
read -p "¿Deseas continuar con el commit y push? (s/n): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Ss]$ ]]; then
    echo -e "${RED}❌ Cancelado por el usuario${NC}"
    exit 0
fi

echo ""
echo -e "${BLUE}🔧 Configurando Git...${NC}"

# Verificar si es un repositorio git
if [ ! -d ".git" ]; then
    echo -e "${YELLOW}⚠️  Inicializando repositorio Git...${NC}"
    git init
    echo -e "${GREEN}✅ Repositorio Git inicializado${NC}"
fi

# Agregar todos los archivos (respetando .gitignore)
echo -e "${BLUE}📦 Agregando archivos al stage...${NC}"
git add .

# Mostrar estado
echo ""
echo -e "${BLUE}📊 Estado del repositorio:${NC}"
git status --short

echo ""
read -p "Ingresa el mensaje del commit: " commit_message

if [ -z "$commit_message" ]; then
    commit_message="Deploy: Sistema de Detección de Fraude con K-means"
fi

# Hacer commit
echo ""
echo -e "${BLUE}💾 Creando commit...${NC}"
git commit -m "$commit_message"

echo ""
echo -e "${GREEN}✅ Commit creado exitosamente${NC}"
echo ""
echo -e "${BLUE}📋 Próximos pasos:${NC}"
echo ""
echo "1️⃣  Crea un repositorio en GitHub (si no lo has hecho)"
echo "    👉 https://github.com/new"
echo ""
echo "2️⃣  Conecta tu repositorio local con GitHub:"
echo -e "    ${YELLOW}git remote add origin https://github.com/TU-USUARIO/TU-REPO.git${NC}"
echo ""
echo "3️⃣  Sube los cambios a GitHub:"
echo -e "    ${YELLOW}git branch -M main${NC}"
echo -e "    ${YELLOW}git push -u origin main${NC}"
echo ""
echo "4️⃣  Deploy en Render:"
echo "    a) Ve a https://render.com/"
echo "    b) Click en 'New +' → 'Web Service'"
echo "    c) Conecta tu repositorio de GitHub"
echo "    d) Render detectará automáticamente render.yaml"
echo "    e) Click en 'Create Web Service'"
echo ""
echo -e "${GREEN}🎉 ¡Todo listo para deployar!${NC}"
echo ""
echo -e "${YELLOW}📌 Recuerda:${NC}"
echo "   - Las imágenes en static/images/ SÍ se suben"
echo "   - El dataset en datasets/ NO se sube (demasiado grande)"
echo "   - La app funciona con datos estáticos en app.py"
echo ""
