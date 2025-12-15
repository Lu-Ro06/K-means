# Sistema de Detección de Fraude Bancario - K-means

Aplicación web Flask para visualizar el análisis de detección de fraude en transacciones bancarias utilizando clustering K-means.

## 🚀 Características

- Visualización de dataset de transacciones bancarias
- Análisis de características mediante gráficos de distribución
- Clustering K-means con dataset reducido (7 características principales)
- Métricas de evaluación del modelo
- Interfaz web moderna y responsiva

## 📊 Tecnologías

- **Backend:** Flask
- **Machine Learning:** scikit-learn, K-means
- **Visualización:** Matplotlib, Seaborn
- **Datos:** Pandas, NumPy

## 🛠️ Instalación Local

1. Clonar el repositorio:
```bash
git clone <tu-repositorio>
cd api-kmeans
```

2. Crear entorno virtual:
```bash
python -m venv venv
source venv/bin/activate  # En Windows: venv\Scripts\activate
```

3. Instalar dependencias:
```bash
pip install -r requirements.txt
```

4. Ejecutar la aplicación:
```bash
python app.py
```

5. Abrir en navegador: `http://localhost:5000`

## 🌐 Deployment en Render

1. Crear cuenta en [Render](https://render.com)
2. Conectar repositorio de GitHub
3. Crear nuevo Web Service
4. Configurar:
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `gunicorn app:app`
   - **Environment:** Python 3

## 📁 Estructura del Proyecto

```
api-kmeans/
├── app.py                  # Aplicación Flask principal
├── requirements.txt        # Dependencias Python
├── Procfile               # Configuración Render/Heroku
├── runtime.txt            # Versión de Python
├── templates/
│   └── index.html         # Template HTML
├── datasets/
│   └── creditcard.csv     # Dataset de transacciones
└── README.md
```

## 📈 Resultados del Modelo

El modelo K-means identifica 5 clusters:
- **Cluster 3:** Mayor concentración de fraude (86%)
- **Clusters 0, 1:** Transacciones mayormente legítimas
- **Cluster 2:** Nivel moderado de fraude

## 📝 Dataset

Dataset de transacciones con tarjetas de crédito que incluye:
- 284,807 transacciones
- 31 características (Time, Amount, V1-V28, Class)
- Características V1-V28 transformadas con PCA
- Variable objetivo: Class (0=Normal, 1=Fraude)

## 🔒 Nota de Privacidad

Las características V1-V28 son el resultado de una transformación PCA para proteger información sensible de los usuarios.

## 👨‍💻 Autor

Desarrollado para análisis de detección de fraude bancario mediante aprendizaje no supervisado.
