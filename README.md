# Terraform + Ansible + PostgreSQL on GCP

Este proyecto automatiza la creación de una VM en GCP, instala PostgreSQL y la configura usando Ansible.

## 🧰 Tecnologías utilizadas
- Terraform
- Ansible
- Google Cloud Platform (GCP)
- GitHub Actions (CI/CD)

## 🚀 Instrucciones de uso

### 1. Clonar el repositorio
```bash
git clone https://github.com/MarcoTulioGT/gcp-prefect.git
```
---

## 📁 Estructura del Proyecto

```text
terraform/
├── modules/                           # Módulos reutilizables de infraestructura
│   └── postgresql/                    # Lógica de creación de PostgreSQL en GCP (VM o Cloud SQL)
│       ├── main.tf                    # Recursos del módulo
│       ├── variables.tf               # Variables requeridas por el módulo
│       └── outputs.tf                 # Valores exportados
│
├── envs/                              # Configuraciones por entorno (dev, prod, etc.)
│   ├── dev/
│   │   ├── main.tf                    # Llama al módulo postgresql con variables específicas
│   │   ├── backend.tf                 # Backend remoto (ej. GCS) para almacenar estado
│   │   ├── variables.tf               # Variables declaradas en este entorno
│   │   └── terraform.tfvars           # Valores de variables inyectados dinámicamente
│   └── prod/
│       ├── main.tf
│       ├── backend.tf
│       ├── variables.tf
│       └── terraform.tfvars
│
└── README.md   
└──.github/
   └── workflows/
      ├── deploy.yml                     # Workflow de GitHub Actions para aplicar infraestructura
      └── destroy.yml                    # (Opcional) Workflow para destruir infraestructura
                       # Documentación del proyecto
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


```bash
   .github/workflows/deploy.yml
   ```

**Eliminar recursos (destroy)**
Puedes crear un workflow llamado destroy.yml o usar el mismo con un selector manual para destruir.

📌 Notas

 - El terraform.tfvars se genera dinámicamente desde variables de GitHub.

 - El backend puede configurarse para guardar el estado en GCS.

 - Revisa que el Service Account tenga permisos suficientes (ej: Compute Admin, Storage Admin, etc.).

## ✨ Contacto
Proyecto creado por [Marco Catalan].
