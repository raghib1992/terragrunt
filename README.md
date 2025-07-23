# terragrunt


terragrunt init
terragrunt init -reconfigure

terragrunt plan
terragrunt run-all plan

terragrunt apply

terragrunt run-all apply --terragrunt-non-interactive


### Download kubeconfig
aws eks update-kubeconfig --name <custer-name>


# Create SSH Key
Generate a new SSH key pair:
```bash 
ssh-keygen -t ed25519 -C "raghib.npti@gmail.com"

```

# Add SSH Key to GitHub
1. Copy the public key to clipboard:
   ```bash
   pbcopy < ~/.ssh/id_ed25519.pub
   ```
2. Go to GitHub settings:  
   - Navigate to **Settings** > **SSH and GPG keys** > **New SSH key**.
   - Paste the public key and give it a title. 
3. Click **Add SSH key**.
# Test SSH Connection
```bash
ssh -T git@github.com
```