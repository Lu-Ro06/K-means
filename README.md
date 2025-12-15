# 🛡️ Sistema de Detección de Fraude Bancario - K-means Clustering

Aplicación web Flask para visualizar el análisis de detección de transacciones bancarias fraudulentas mediante K-means Clustering y Random Forest.

## 📊 Descripción del Proyecto

Este proyecto implementa un sistema de detección de fraude utilizando técnicas de Machine Learning no supervisado (K-means) sobre un dataset de 284,807 transacciones de tarjetas de crédito. El modelo identifica patrones y agrupa transacciones en 5 clusters, logrando concentrar el 86.04% de fraudes en un cluster específico.

### 🎯 Características Principales

- ✅ Análisis de 284,807 transacciones (492 fraudes detectados)
- ✅ Reducción de dimensionalidad: 30 → 7 características usando Random Forest
- ✅ 5 clusters identificados con alta pureza (99.91%)
- ✅ Visualizaciones interactivas de distribución y clusters
- ✅ Métricas de evaluación: Purity, Silhouette, Calinski-Harabasz
- ✅ Interfaz web moderna con tema de seguridad

### 🔍 Tecnologías Utilizadas

- **Backend:** Flask 3.0
- **ML:** scikit-learn (K-means, Random Forest, PCA)
- **Visualización:** matplotlib, seaborn
- **Deployment:** Render, Gunicorn
- **Python:** 3.11

## 🚀 Instalación Local

### Prerrequisitos

- Python 3.11+
- pip

### Pasos de Instalación

```bash
# 1. Clonar el repositorio
git clone <tu-repositorio>
cd api-kmeans

# 2. Crear entorno virtual
python3 -m venv venv
source venv/bin/activate  # En Windows: venv\Scripts\activate

# 3. Instalar dependencias
pip install -r requirements.txt

# 4. Ejecutar la aplicación
python3 app.py
```

La aplicación estará disponible en `http://localhost:5001`

## 📁 Estructura del Proyecto

```
api-kmeans/
├── app.py                    # Aplicación Flask principal (datos estáticos)
├── generate_images.py        # Script para generar visualizaciones
├── requirements.txt          # Dependencias Python
├── runtime.txt              # Versión de Python para Render
├── Procfile                 # Configuración para Render
├── render.yaml              # Configuración de deployment
├── templates/
│   └── index.html           # Plantilla HTML principal
├── static/
│   └── images/              # Imágenes de visualizaciones (incluidas en repo)
│       ├── features_distribution.png
│       ├── scatter_v10_v14.png
│       └── kmeans_decision_boundaries.png
└── datasets/                # NO incluido en repo (agregar manualmente)
    └── creditcard.csv       # Dataset original (descargar aparte)
```

## 🌐 Deployment en Render

### Opción 1: Deployment Automático

1. Haz fork o clona este repositorio en tu cuenta de GitHub
2. Ve a [Render](https://render.com/) y crea una cuenta
3. Click en "New +" → "Web Service"
4. Conecta tu repositorio de GitHub
5. Render detectará automáticamente la configuración de `render.yaml`
6. Click en "Create Web Service"

### Opción 2: Deployment Manual

1. En Render, selecciona "New Web Service"
2. Configura:
   - **Name:** api-kmeans-fraud-detection
   - **Environment:** Python 3
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `gunicorn app:app`
3. Click en "Create Web Service"

La aplicación estará disponible en: `https://tu-servicio.onrender.com`

## 📊 Resultados del Modelo

### Clusters Identificados

| Cluster | Total Muestras | Muestras Fraudulentas | Porcentaje Fraude |
|---------|---------------|----------------------|-------------------|
| 0       | 109,253       | 19                   | 0.02%             |
| 1       | 124,538       | 17                   | 0.01%             |
| 2       | 30,408        | 161                  | 0.53%             |
| **3**   | **308**       | **265**              | **86.04%** ⚠️     |
| 4       | 20,300        | 30                   | 0.15%             |

### Métricas de Evaluación

- **Purity Score:** 0.9991 (99.91% de pureza)
- **Silhouette Score:** 0.1816 (separación aceptable)
- **Calinski-Harabasz:** 38,466 (excelente definición de clusters)

### Características Seleccionadas

Las 7 características más importantes identificadas por Random Forest:

`V17, V14, V16, V12, V10, V11, V18`

## 📝 Dataset

**⚠️ IMPORTANTE:** El dataset NO está incluido en este repositorio debido a su tamaño (150+ MB).

### Para obtener el dataset:

1. Descarga desde [Kaggle - Credit Card Fraud Detection](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud)
2. Coloca `creditcard.csv` en la carpeta `datasets/`
3. (Opcional) Ejecuta `python3 generate_images.py` para regenerar las imágenes

**Información del Dataset:**
- 284,807 transacciones
- 492 fraudes (0.172%)
- 30 características (V1-V28 son componentes PCA)
- Features adicionales: Time, Amount, Class

## 🎨 Características de la Aplicación

La aplicación web incluye:

- 🎯 **Contexto del Problema** - Explicación del desafío de detección de fraudes
- 🧠 **Explicación de K-means** - Cómo funciona el algoritmo, ventajas y desventajas
- 📊 **Información del Dataset** - Estadísticas y distribución de clases
- 📋 **Tabla de Características** - Muestra de las 7 características principales
- 📈 **Visualizaciones** - Distribución, scatter plots y límites de decisión
- 🎯 **Análisis de Clusters** - Detalle de cada cluster identificado
- 📊 **Métricas de Evaluación** - Interpretación de Purity, Silhouette y Calinski-Harabasz
- 💡 **Conclusiones** - Aplicaciones prácticas y próximos pasos

## 🔧 Desarrollo

### Ejecutar en Modo Desarrollo

```bash
python3 app.py
# La app se ejecuta en http://localhost:5001
```

### Regenerar Imágenes

Si tienes el dataset y quieres regenerar las visualizaciones:

```bash
python3 generate_images.py
```

### Arquitectura de Datos

La aplicación usa **datos estáticos** predefinidos en `app.py`. No requiere procesamiento ML en tiempo real, lo que la hace:
- ⚡ Rápida y eficiente
- 💰 Económica en recursos
- 🚀 Fácil de deployar
- 📊 Las imágenes están pre-generadas en `static/images/`

## 📚 Documentación Adicional

- `DEPLOYMENT.md` - Guía detallada de deployment
- `QUICKSTART.txt` - Inicio rápido
- `GUIA_PRESENTACION.txt` - Guía para presentaciones
- `RESUMEN_PROYECTO.md` - Resumen ejecutivo

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

## 👥 Autor

Desarrollado como proyecto de análisis de Machine Learning para detección de fraudes bancarios.

## 🙏 Agradecimientos

- Dataset: [Kaggle - Credit Card Fraud Detection](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud)
- Investigación: Worldline y Machine Learning Group (ULB)

---

**⚠️ Nota:** Este proyecto es solo para fines educativos y de demostración. No debe usarse en producción sin las debidas consideraciones de seguridad y validación.
