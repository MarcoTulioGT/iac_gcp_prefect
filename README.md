# Automatización de PostgreSQL en GCP con Terraform y Ansible

[![Terraform](https://img.shields.io/badge/Terraform-v1.6.6-623CE4?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![GCP](https://img.shields.io/badge/GCP-VM-FBBC05?logo=google-cloud&logoColor=black)](https://cloud.google.com/)
[![Ansible](https://img.shields.io/badge/Ansible-Automation-EE0000?logo=ansible&logoColor=white)](https://www.ansible.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-336791?logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![GitHub Actions](https://img.shields.io/github/actions/workflow/status/MarcoTulioGT/iac_gcp_postgresql/deploy.yml?label=deploy&logo=github)](https://github.com/MarcoTulioGT/iac_gcp_postgresql/actions/workflows/deploy.yml)


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
- Crear un bucket de GCS para backend remoto (`debe ser igual al configurado en env/dev/backend.tf`)  
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
### ¿Qué hace el workflow `deploy.yml`?
```md
1. Genera una clave SSH temporal.
2. Aplica infraestructura con Terraform.
3. Obtiene la IP pública de la VM creada.
4. Genera el archivo `inventory.ini` para Ansible.
5. Usa Ansible para instalar y configurar PostgreSQL.
```

## 🔗 Verificación de conexión con DBeaver

Una vez desplegada la infraestructura y configurado PostgreSQL, puedes conectarte fácilmente desde [DBeaver](https://dbeaver.io/) u otro cliente PostgreSQL siguiendo estos pasos:

### 🧭 Pasos para conectarte

1. Abre **DBeaver** y ve a `Database > New Database Connection`.
2. Selecciona el motor **PostgreSQL**.
3. Completa los campos con los siguientes valores:

   | Campo    | Valor                                                       |
   |----------|-------------------------------------------------------------|
   | Host     | IP pública de la VM (ver salida de Terraform o consola GCP) |
   | Port     | `5432`                                                      |
   | Database | `appdb`                                                     |
   | User     | `dbuser`                                                    |
   | Password | `supersecret`                                               |

4. Haz clic en **Test Connection**.
5. Si la prueba es exitosa, haz clic en **Finish**.

### 🛡️ Nota de seguridad

Si la conexión falla, verifica lo siguiente:

- El puerto `5432` está habilitado en el firewall de GCP.
- Los archivos `pg_hba.conf` y `postgresql.conf` fueron correctamente configurados por Ansible.
- Tu IP local tiene acceso a la VM o está incluida en las reglas de firewall.


## **Eliminar recursos (destroy)**
Usa el workflow (`Terraform Destroy PostgreSQL GCP`) y dispatch para seleccionar el entorno dev.

```bash
   .github/workflows/destroy.yml
   ```

📌 Notas

 - El terraform.tfvars se genera dinámicamente desde variables de GitHub.

 - El backend está configurado para guardar el estado en GCS.

 - Revisa que el Service Account tenga permisos suficientes.
   
 - 🔐 La clave SSH generada se usa solo en tiempo de ejecución, no se guarda como secreto persistente.


## ✨ Contacto

Proyecto creado por [Marco Catalán].

📫 ¿Dudas o sugerencias? ¡Contáctame por GitHub o abre un Issue!
