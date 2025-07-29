# Automatización de PostgreSQL en GCP con Terraform y Ansible

Este proyecto automatiza la provisión de una instancia PostgreSQL en GCP usando Terraform (infraestructura como código) y Ansible (automatización de configuración).

## 🧰 Tecnologías utilizadas
- Terraform (Infraestructura como Código)
- Ansible (DevOps Automation Platform)
- Google Cloud Platform (GCP)
- GitHub Actions (CI/CD)

## 🚀 Instrucciones de uso

### 1. Clonar el repositorio
```bash
git clone https://github.com/MarcoTulioGT/iac_gcp_postgresql.git
```
---

## 📁 Estructura del Proyecto

```text
terraform/
├── modules/                           # Módulos reutilizables de infraestructura
│   └── postgresql/                    # Lógica para crear una VM con PostgreSQL en GCP
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
└── README.md                          # Documentación del proyecto
└──.github/
   └── workflows/
      ├── deploy.yml                   # Workflow de GitHub Actions para aplicar infraestructura
      └── destroy.yml                  # Workflow para destruir infraestructura
                       
```
---

## 🧩 Prerrequisitos

- Cuenta en [Google Cloud](https://console.cloud.google.com/)
### Habilitar APIs necesarias

```bash
gcloud services enable compute.googleapis.com
gcloud services enable storage.googleapis.com
```
- Crear un bucket de GCS si para backend remoto (`debe ser igual al configurado en env/dev/backend.tf`)  
- Crear un Service Account con permisos necesarios:
  - para Storage, compute y viewer específicos para los recursos
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


## 🤖 CI/CD Ejecutar desde GitHub Actions

**Desplegar (apply)**

Usa el workflow (`Terraform + Ansible Deploy PostgreSQL GCP`) y dispatch para seleccionar el entorno dev.

```bash
   .github/workflows/deploy.yml
   ```

**Eliminar recursos (destroy)**
Usa el workflow (`Terraform Destroy PostgreSQL GCP`) y dispatch para seleccionar el entorno dev.

```bash
   .github/workflows/destroy.yml
   ```

📌 Notas

 - El terraform.tfvars se genera dinámicamente desde variables de GitHub.

 - El backend está configurado para guardar el estado en GCS.

 - Revisa que el Service Account tenga permisos suficientes.

## ✨ Contacto
Proyecto creado por [Marco Catalán].
