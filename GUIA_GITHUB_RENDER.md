# 📝 GUÍA COMPLETA: SUBIR PROYECTO A GITHUB Y DEPLOY EN RENDER

## ✅ Estado del Proyecto

- ✅ Aplicación Flask funcionando con datos estáticos
- ✅ Imágenes generadas en `static/images/`
- ✅ .gitignore configurado (dataset NO se sube)
- ✅ Archivos de deployment configurados (Procfile, render.yaml)
- ✅ README.md actualizado

---

## 🚀 PASO 1: PREPARAR REPOSITORIO LOCAL

### Opción A: Usar el script automático (RECOMENDADO)

```bash
cd /home/jesus/Documentos/plf/api-kmeans
./deploy_github.sh
```

El script te guiará paso a paso.

### Opción B: Manualmente

```bash
cd /home/jesus/Documentos/plf/api-kmeans

# Verificar que el dataset NO se suba
cat .gitignore  # Debe incluir datasets/

# Verificar imágenes
ls -lh static/images/  # Debe tener 3 archivos .png

# Inicializar Git (si no está inicializado)
git init

# Agregar todos los archivos
git add .

# Verificar qué se va a subir
git status

# Crear commit
git commit -m "Deploy: Sistema de Detección de Fraude con K-means"
```

---

## 🌐 PASO 2: CREAR REPOSITORIO EN GITHUB

1. Ve a https://github.com/new

2. Configura el repositorio:
   - **Repository name:** `fraud-detection-kmeans` (o el nombre que prefieras)
   - **Description:** "Sistema de detección de fraude bancario usando K-means Clustering"
   - **Visibility:** Public o Private (según prefieras)
   - ⚠️ **NO** marques "Add a README file" (ya tienes uno)
   - ⚠️ **NO** marques "Add .gitignore" (ya tienes uno)

3. Click en **"Create repository"**

4. Copia la URL del repositorio (ejemplo: `https://github.com/TU-USUARIO/fraud-detection-kmeans.git`)

---

## 📤 PASO 3: SUBIR CÓDIGO A GITHUB

```bash
# Conectar repositorio local con GitHub
git remote add origin https://github.com/TU-USUARIO/fraud-detection-kmeans.git

# Renombrar rama a main
git branch -M main

# Subir código a GitHub
git push -u origin main
```

### Si te pide autenticación:

**Usuario:** tu_usuario_github
**Password:** Usa un **Personal Access Token** (no tu contraseña)

Para crear un token:
1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate new token
3. Marca: `repo` (todos los permisos)
4. Copia el token y úsalo como contraseña

---

## ☁️ PASO 4: DEPLOY EN RENDER

### Método 1: Deploy Automático (Recomendado)

1. Ve a https://render.com/ y crea una cuenta (puedes usar GitHub)

2. En el Dashboard, click en **"New +"** → **"Web Service"**

3. Click en **"Connect a repository"**
   - Conecta tu cuenta de GitHub
   - Busca tu repositorio: `fraud-detection-kmeans`
   - Click en **"Connect"**

4. Render detectará automáticamente:
   - ✅ `render.yaml` con la configuración
   - ✅ `Procfile` con el comando de inicio
   - ✅ `requirements.txt` con las dependencias

5. Configuración (debe aparecer automáticamente):
   - **Name:** fraud-detection-kmeans
   - **Environment:** Python 3
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `gunicorn app:app`
   - **Plan:** Free

6. Click en **"Create Web Service"**

7. Espera 5-10 minutos mientras Render:
   - ⏳ Clona el repositorio
   - ⏳ Instala dependencias
   - ⏳ Inicia la aplicación
   - ✅ Deploy completado

8. Tu aplicación estará en: `https://fraud-detection-kmeans-XXXX.onrender.com`

### Método 2: Deploy Manual

Si no detecta automáticamente:

1. En Render, selecciona **"New Web Service"**

2. Configura manualmente:
   - **Name:** fraud-detection-kmeans
   - **Runtime:** Python 3
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `gunicorn app:app`
   - **Branch:** main

3. En "Environment Variables" (opcional):
   - No es necesario agregar variables para esta app

4. Click en **"Create Web Service"**

---

## 🔍 PASO 5: VERIFICAR DEPLOYMENT

Una vez que el deploy termine:

1. Abre la URL de tu app: `https://tu-app.onrender.com`

2. Verifica que se muestren:
   - ✅ Contexto del problema
   - ✅ Explicación de K-means
   - ✅ Información del dataset
   - ✅ Tabla de características
   - ✅ 3 imágenes (features_distribution, scatter, kmeans_boundaries)
   - ✅ Análisis de clusters
   - ✅ Métricas de evaluación

3. Si hay problemas, revisa los logs en Render:
   - Dashboard → Tu servicio → Logs

---

## 📊 LO QUE SE SUBE A GITHUB

✅ **SÍ se sube:**
- `app.py` (con datos estáticos)
- `templates/index.html`
- `static/images/*.png` (3 imágenes pre-generadas)
- `requirements.txt`
- `Procfile`
- `render.yaml`
- `runtime.txt`
- `README.md`
- Documentación adicional

❌ **NO se sube:**
- `datasets/creditcard.csv` (150+ MB, excluido en .gitignore)
- `venv/` (entorno virtual)
- `__pycache__/`
- `.env`

---

## 🎉 RESULTADO FINAL

### En GitHub:
- ✅ Repositorio público/privado con tu código
- ✅ README profesional con instrucciones
- ✅ Código fuente completo
- ✅ Historial de commits

### En Render:
- ✅ Aplicación web funcionando 24/7
- ✅ URL pública compartible
- ✅ Auto-deploy cuando hagas push a GitHub
- ✅ Plan gratuito (puede dormirse después de 15 min sin uso)

---

## 🔄 ACTUALIZAR LA APLICACIÓN

Cuando hagas cambios:

```bash
# Hacer cambios en el código
nano app.py  # o el archivo que quieras

# Agregar cambios
git add .

# Commit
git commit -m "Descripción del cambio"

# Push a GitHub
git push origin main
```

Render detectará automáticamente los cambios y hará un nuevo deploy.

---

## ⚠️ NOTAS IMPORTANTES

1. **Plan Gratuito de Render:**
   - La app puede dormirse después de 15 minutos sin actividad
   - El primer acceso después de dormir puede tardar 30-60 segundos
   - Para producción real, considera un plan de pago

2. **Dataset:**
   - El dataset NO está en el repositorio
   - La app funciona con datos estáticos predefinidos
   - Las imágenes están pre-generadas y sí se incluyen

3. **Imágenes:**
   - Tamaño total: ~700KB (aceptable para GitHub)
   - 3 imágenes esenciales para la visualización
   - Si regeneras las imágenes, haz commit y push

4. **Seguridad:**
   - No incluyas contraseñas o tokens en el código
   - Usa variables de entorno para información sensible
   - El .gitignore protege archivos críticos

---

## 🆘 SOLUCIÓN DE PROBLEMAS

### Error: "remote origin already exists"
```bash
git remote remove origin
git remote add origin https://github.com/TU-USUARIO/TU-REPO.git
```

### Error: "authentication failed"
- Usa un Personal Access Token en lugar de tu contraseña
- Verifica que el token tenga permisos de `repo`

### Error en Render: "Build failed"
- Verifica que `requirements.txt` esté completo
- Revisa los logs en Render Dashboard
- Asegúrate que `runtime.txt` tenga `python-3.11.0`

### La app carga pero sin imágenes
- Verifica que las imágenes estén en `static/images/`
- Haz `git status` para confirmar que se subieron
- Revisa que los nombres coincidan en `index.html`

---

## 📞 SOPORTE

Si tienes problemas:
1. Revisa los logs en Render Dashboard
2. Verifica el README.md del repositorio
3. Consulta la documentación de Render: https://render.com/docs

---

**¡Éxito con tu deployment! 🚀**
