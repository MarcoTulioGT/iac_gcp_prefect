# 🚀 Infraestructura en GCP con Terraform + GitHub Actions

Este proyecto define y despliega infraestructura en Google Cloud Platform (GCP) usando Terraform. La automatización del despliegue se realiza mediante GitHub Actions.

---

## 📁 Estructura del Proyecto

```text
├── terraform/
│   ├── main.tf              # Recursos e infraestructura
│   ├── variables.tf         # Variables definidas
│   ├── terraform.tfvars     # Valores de variables (generado en GitHub Actions)
├── .github/
│   └── workflows/
│       ├── deploy.yml       # Workflow para terraform apply
│       └── destroy.yml      # Workflow para terraform destroy (opcional)
└── README.md
```
---

## 🧩 Prerrequisitos

- Cuenta en [Google Cloud](https://console.cloud.google.com/)
- Habilitar:
  - Compute Engine API
  - Cloud Storage API
- Crear un bucket de GCS si usas backend remoto (`terraform.tfstate`)
- Crear un Service Account con permisos necesarios:
  - roles/editor o específicos para los recursos
- Crear una clave JSON para la Service Account

---

## 🔐 Configuración de GitHub

1. **Secrets**
   Ve a `Settings > Secrets and variables > Actions > Secrets` y agrega:

   | Nombre              | Valor                                      |
   |---------------------|--------------------------------------------|
   | `GCP_CREDENTIALS`   | Contenido del JSON de la Service Account   |

2. **Variables**
   Ve a `Settings > Secrets and variables > Actions > Variables` y agrega:

   | Nombre         | Valor                   |
   |----------------|-------------------------|
   | `GCP_PROJECT`  | ID del proyecto de GCP  |
   | `GCP_REGION`   | Región (e.g. `us-central1`) |
   | `GCP_ZONE`     | Zona (e.g. `us-central1-a`) |

---

## 🛠️ Uso local (opcional)

1. Autenticarse con Google Cloud:

```bash
gcloud auth application-default login
export GOOGLE_APPLICATION_CREDENTIALS=/ruta/credenciales.json
```

2. Inicializar Terraform:

```bash
cd terraform
terraform init
```

3. Aplicar cambios:
```bash
terraform apply -var="project=YOUR_PROJECT" -var="region=us-central1" -var="zone=us-central1-a" -auto-approve
```

4. Destruir infraestructura (opcional):
```bash
terraform destroy -auto-approve
```
---

## 🤖 CI/CD con GitHub Actions

**Desplegar (apply)**

Se ejecuta automáticamente en push a main dentro de la carpeta terraform/ o manualmente desde GitHub.

bash
Copy
Edit
.github/workflows/deploy.yml

**Eliminar recursos (destroy)**
Puedes crear un workflow llamado destroy.yml o usar el mismo con un selector manual para destruir.

📌 Notas
El terraform.tfvars se genera dinámicamente desde variables de GitHub.

El backend puede configurarse para guardar el estado en GCS.

Revisa que el Service Account tenga permisos suficientes (ej: Compute Admin, Storage Admin, etc.).

## ✨ Contacto
Proyecto creado por [Marco Catalan].


¿Quieres que también te genere el `terraform/main.tf` y `variables.tf` como parte de la documentación?
