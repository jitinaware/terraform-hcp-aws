# HCP Terraform Module Example

## Prerequisites
1. Sign up for/sign in to [HashiCorp Cloud Platform](https://portal.cloud.hashicorp.com/)
1. Create a [Service Principal](https://cloud.hashicorp.com/docs/hcp/admin/access-control/service-principals#create-a-service-principal)
1. Generate a [Service Principal Key](https://cloud.hashicorp.com/docs/hcp/admin/access-control/service-principals#generate-a-service-principal-key)

    ```Keep the client_id and client_secret in a safe place for the next step```

## Usage

1. Set client_id and secret_id values in variables.auto.tfvars file included in this repo
1. Change any settings in ```main.tf``` as desired
    >Defaults will create 1 HVN, 1 Consul Cluster, and 1 Vault Cluster
3. Run Terraform Init, Plan, and Apply
4. Wait for resources to finish deployment (this can take 30min+ depending on configuration)