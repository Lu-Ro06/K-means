#!/bin/bash

# ============================================
# COMANDOS RÁPIDOS - Sistema de Detección de Fraude
# ============================================

# COLORES PARA OUTPUT
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
echo "╔════════════════════════════════════════════════════════════╗"
echo "║    🛡️  Sistema de Detección de Fraude - Comandos Rápidos  ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# FUNCIONES
function test_local() {
    echo -e "${YELLOW}🧪 Probando aplicación localmente...${NC}"
    python app.py
}

function install_deps() {
    echo -e "${YELLOW}📦 Instalando dependencias...${NC}"
    pip install -r requirements.txt
    echo -e "${GREEN}✅ Dependencias instaladas${NC}"
}

function setup_github() {
    echo -e "${YELLOW}🔧 Configurando Git...${NC}"
    ./setup_git.sh
}

function check_files() {
    echo -e "${YELLOW}📁 Verificando archivos...${NC}"
    echo ""
    
    files=(
        "app.py"
        "requirements.txt"
        "Procfile"
        "runtime.txt"
        "render.yaml"
        "templates/index.html"
        "datasets/creditcard.csv"
    )
    
    for file in "${files[@]}"; do
        if [ -f "$file" ]; then
            echo -e "${GREEN}✓${NC} $file"
        else
            echo -e "${RED}✗${NC} $file ${RED}(FALTA)${NC}"
        fi
    done
    echo ""
}

function show_help() {
    echo -e "${BLUE}Comandos disponibles:${NC}"
    echo ""
    echo "  ./comandos.sh check         → Verificar archivos necesarios"
    echo "  ./comandos.sh install       → Instalar dependencias"
    echo "  ./comandos.sh test          → Probar localmente"
    echo "  ./comandos.sh git           → Configurar Git"
    echo "  ./comandos.sh help          → Mostrar esta ayuda"
    echo ""
    echo -e "${BLUE}Comandos manuales útiles:${NC}"
    echo ""
    echo "  # Probar localmente"
    echo "  python app.py"
    echo ""
    echo "  # Ver logs en tiempo real (si está corriendo)"
    echo "  tail -f logs/app.log"
    echo ""
    echo "  # Verificar versiones"
    echo "  python --version"
    echo "  pip list | grep -E 'Flask|pandas|scikit'"
    echo ""
    echo "  # Git"
    echo "  git status"
    echo "  git add ."
    echo "  git commit -m 'Mensaje'"
    echo "  git push"
    echo ""
}

# MANEJO DE ARGUMENTOS
case "$1" in
    check)
        check_files
        ;;
    install)
        install_deps
        ;;
    test)
        test_local
        ;;
    git)
        setup_github
        ;;
    help|--help|-h|"")
        show_help
        ;;
    *)
        echo -e "${RED}❌ Comando no reconocido: $1${NC}"
        echo ""
        show_help
        ;;
esac
