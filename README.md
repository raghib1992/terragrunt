# terragrunt


terragrunt init
terragrunt init -reconfigure

terragrunt plan
terragrunt run-all plan

terragrunt apply

terragrunt run-all apply --terragrunt-non-interactive


### Download kubeconfig
aws eks update-kubeconfig --name <custer-name>