# Cleber Gasparoto
## Curso de Terraform com AWS em Português

Link da playlist no Youtube [aqui](https://www.youtube.com/playlist?list=PLWQmZVQayUUIgSmOj3GPH2BJcn0hOzIaP)

### Primeiros scripts

* [Documentação](https://terraform.io) do Terraform
* [Providers](https://registry.terraform.io) do Terraform


```bash
terraform -h
terraform init
terraform plan
terraform apply
AWS_ACCESS_KEY_ID=<key> AWS_SECRET_ACCESS_KEY=<secret> terraform apply
terraform destroy

terraform validate
terraform fmt

terraform plan -out="tfplan.out"
terraform apply "tfplan.out"
```

### Variáveis

* Removendo o argumento default, a variável se torna obrigatória. Em ambientes de CI isso se torna interessante.
* Se a mesma variável for passada mais de uma vez, o último valor passado é o que vai ser aplicado
* Arquivos terraform.tfvars ou terraform.tfvars.json são lidos automaticamente
* Arquivos .auto.tfvars ou .auto.tfvars.json também são lidos automaticamente pelo terraform

```bash
terraform apply -auto-approve
TF_VAR_aws_profile=paschualetto terraform plan
terraform plan -var="aws_profile=paschualetto"
terraform plan -var="aws_profile=paschualetto" -var="instance_type=t3.medium"
terraform apply -var-file="prod.tfvars"
terraform destroy -var-file="prod.tfvars" -auto-approve

terraform show
terraform show -json
terraform console

terraform import aws_s3_bucket.bucket <bucket_name>
terraform fmt -recursive

terraform init -backend=true -backend-config="backend.hcl"

terraform output
terraform output <output_name>
```