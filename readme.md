# PetClinic

## Deploy with defaults

Configure AWS CLI to point to the account you want to deploy into. Then:

```
cd terraform
terraform init
terraform apply
```

Point `petclinic.com` to the ingress load balancer. Open `http://petclinic.com`.
