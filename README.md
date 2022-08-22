# Zimagi setup on GCP instance

This Terraform module can be run to manage a test/demo Zimagi instance in the GCP environment.

<br/>

## Execution steps

<br/>

 1. Create a GCP project to house the Zimagi test instance
 2. Add GCP project name as Terraform variable

 ```bash
$> echo 'gcp_project = "{project name}"' > terraform.tfvars
 ```
  3. Add any other variable overrides you like _(see variables.tf)_
  4. Login to GCP environment

```bash
$> gcloud auth application-default login
```
 5. Initialize Terraform

```bash
$> terraform init
$> terraform plan -out terraform.tfplan
```
 6. Provision Terraform plan

```bash
$> terraform apply terraform.tfplan
```
 7. When complete it outputs SSH and service URLs

 ```bash
 $> ssh {SSH URL}
 ```
  8. On startup a startup script is writing logs to a **zimagi_setup.log** file

```bash
$> tail -f zimagi_setup.log # Tail log until you see the Zimagi environment display and "Zimagi startup complete".  It may take a few minutes for this file to exist at login as root dependencies are installed first.
$> source ~/.bashrc # If you logged in before completion of startup script you will need to re-source your .bashrc file to load the reactor and other Zimagi related executables.
```
 9. View Zimagi environment information

```bash
$> zimagi env get
```

<br/>

## Configuring Zimagi

<br/>

All environment variable configuration overrides for the Zimagi platform should be put at the bottom of the **~/zimagi/data/app.env.sh** environment configuration file.

This file is read by all services and the CLI in the Zimagi platform.
