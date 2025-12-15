#!/usr/bin/env python3
# Script para generar las imágenes desde el notebook

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import matplotlib.gridspec as gridspec
from sklearn.cluster import KMeans
import numpy as np

# Cargar datos
df = pd.read_csv("./datasets/creditcard.csv")
df_original = df.copy()

# Eliminar Time y Amount
df = df.drop(['Time', 'Amount'], axis=1)

# =================== IMAGEN 1: Distribución de características ===================
print("Generando imagen 1: Distribución de características...")
features = df_original.drop("Class", axis=1)

plt.figure(figsize=(12, 32))
gs = gridspec.GridSpec(8, 4)
gs.update(hspace=0.8)

for i, f in enumerate(features):
    ax = plt.subplot(gs[i])
    sns.histplot(df_original[f][df_original["Class"] == 1], kde=True, color='orange', label='Fraude', stat='density', alpha=0.6)
    sns.histplot(df_original[f][df_original["Class"] == 0], kde=True, color='blue', label='Normal', stat='density', alpha=0.6)
    ax.set_xlabel('')
    ax.set_title('feature: ' + str(f))
    ax.legend()

plt.tight_layout()
plt.savefig('./static/images/features_distribution.png', dpi=100, bbox_inches='tight')
plt.close()
print("✅ Guardada: features_distribution.png")

# =================== IMAGEN 2: Scatter V10 vs V14 ===================
print("Generando imagen 2: Scatter V10 vs V14...")
plt.figure(figsize=(12, 6))
plt.scatter(df_original["V10"][df_original['Class'] == 0], df_original["V14"][df_original['Class'] == 0], 
            c="g", marker=".", alpha=0.5, label='Normal', s=1)
plt.scatter(df_original["V10"][df_original['Class'] == 1], df_original["V14"][df_original['Class'] == 1], 
            c="r", marker=".", alpha=0.8, label='Fraude', s=5)
plt.xlabel("V10", fontsize=14)
plt.ylabel("V14", fontsize=14)
plt.title("Distribución V10 vs V14", fontsize=16)
plt.legend()
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig('./static/images/scatter_v10_v14.png', dpi=100, bbox_inches='tight')
plt.close()
print("✅ Guardada: scatter_v10_v14.png")

# =================== IMAGEN 3: K-means con límites de decisión ===================
print("Generando imagen 3: K-means con límites de decisión...")

def plot_data(X, y):
    plt.plot(X[:, 0][y == 0], X[:, 1][y == 0], 'k.', markersize=2)
    plt.plot(X[:, 0][y == 1], X[:, 1][y == 1], 'r.', markersize=2)

def plot_centroids(centroids, weights=None, circle_color='w', cross_color='k'):
    if weights is not None:
        centroids = centroids[weights > weights.max()/10]
    plt.scatter(centroids[:, 0], centroids[:, 1], marker='o', s=30, linewidths=8, 
                color=circle_color, zorder=10, alpha=0.9)
    plt.scatter(centroids[:, 0], centroids[:, 1], marker='x', s=50, linewidths=2, 
                color=cross_color, zorder=11)

def plot_decision_boundaries(clusterer, X, y, resolution=1000, show_centroids=True):
    mins = X.min(axis=0) - 0.1
    maxs = X.max(axis=0) + 0.1
    xx, yy = np.meshgrid(np.linspace(mins[0], maxs[0], resolution),
                         np.linspace(mins[1], maxs[1], resolution))
    Z = clusterer.predict(np.c_[xx.ravel(), yy.ravel()])
    Z = Z.reshape(xx.shape)

    plt.contourf(Z, extent=(mins[0], maxs[0], mins[1], maxs[1]), cmap="Pastel2")
    plt.contour(Z, extent=(mins[0], maxs[0], mins[1], maxs[1]), colors='k', linewidths=1)

    plot_data(X, y)
    if show_centroids:
        plot_centroids(clusterer.cluster_centers_)

X = df[['V10', 'V14']].copy()
kmeans = KMeans(n_clusters=5, random_state=42, n_init=10)
clusters = kmeans.fit_predict(X)

plt.figure(figsize=(12, 6))
plot_decision_boundaries(kmeans, X.values, df['Class'].values)
plt.xlabel('V10', fontsize=14)
plt.ylabel('V14', fontsize=14)
plt.title('K-means: Límites de Decisión', fontsize=16)
plt.tight_layout()
plt.savefig('./static/images/kmeans_decision_boundaries.png', dpi=100, bbox_inches='tight')
plt.close()
print("✅ Guardada: kmeans_decision_boundaries.png")

print("\n🎉 ¡Todas las imágenes generadas exitosamente!")
print("Las imágenes están en: ./static/images/")
