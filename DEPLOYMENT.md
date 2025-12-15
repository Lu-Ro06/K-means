# Guía de Deployment

## 🚀 Pasos para Subir a GitHub

### 1. Crear repositorio en GitHub
- Ve a https://github.com/new
- Nombra tu repositorio (ej: `fraud-detection-kmeans`)
- NO inicialices con README (ya tenemos uno)
- Crea el repositorio

### 2. Configurar Git localmente

```bash
# Dar permisos al script
chmod +x setup_git.sh

# Ejecutar el script de inicialización
./setup_git.sh

# Conectar con tu repositorio (reemplaza con tu URL)
git remote add origin https://github.com/TU-USUARIO/TU-REPO.git
git branch -M main
git push -u origin main
```

### 3. Verificar en GitHub
- Actualiza la página de tu repositorio
- Deberías ver todos los archivos

---

## 🌐 Pasos para Deployar en Render

### Opción 1: Usando render.yaml (Recomendado)

1. **Crear cuenta en Render**
   - Ve a https://render.com
   - Regístrate con GitHub

2. **Crear nuevo Blueprint**
   - Dashboard → New → Blueprint
   - Conecta tu repositorio
   - Render detectará automáticamente `render.yaml`
   - Click en "Apply"

3. **Esperar deployment**
   - Render instalará dependencias
   - Iniciará la aplicación
   - Te dará una URL pública

### Opción 2: Manualmente

1. **Crear Web Service**
   - Dashboard → New → Web Service
   - Conecta tu repositorio

2. **Configurar**
   - **Name:** fraud-detection-kmeans
   - **Environment:** Python 3
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `gunicorn app:app`
   - **Instance Type:** Free

3. **Deploy**
   - Click en "Create Web Service"
   - Espera a que complete el deployment

---

## 📝 Notas Importantes

### Para GitHub:
- El archivo `.gitignore` evita subir archivos innecesarios
- Asegúrate de tener el dataset en `datasets/creditcard.csv`

### Para Render:
- Primera carga puede tardar ~5 minutos
- La app se "duerme" después de 15 min sin uso (plan free)
- Los logs están disponibles en el dashboard

### Verificar funcionamiento:
```bash
# Probar localmente primero
python app.py
# Abrir http://localhost:5000
```

---

## 🔧 Troubleshooting

**Error: Dataset no encontrado**
- Verificar que `datasets/creditcard.csv` existe
- El archivo debe estar en el repositorio

**Error: Módulo no encontrado**
- Verificar `requirements.txt`
- Reinstalar: `pip install -r requirements.txt`

**Render: Build failed**
- Revisar logs en dashboard de Render
- Verificar versión de Python en `runtime.txt`

**Render: App no responde**
- Esperar a que termine el build completo
- Revisar logs para errores

---

## 🎯 URLs de Referencia

- **GitHub:** https://github.com
- **Render:** https://render.com
- **Documentación Flask:** https://flask.palletsprojects.com
- **Documentación Render:** https://render.com/docs

---

## ✅ Checklist de Deployment

- [ ] Código funciona localmente
- [ ] Repository creado en GitHub
- [ ] Código subido a GitHub
- [ ] Cuenta creada en Render
- [ ] Render conectado a GitHub
- [ ] Web Service creado
- [ ] Deployment exitoso
- [ ] URL pública funcionando
