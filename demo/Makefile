# Makefile

# Default target if no target is specified.
all: login ssh port-forward

# Target for SSH connection
ssh:
	gcloud compute ssh --zone "asia-southeast1-b" "gdsc-mar-2024-001" --project "gdsc-mar-2024" --ssh-key-file=~/.ssh/id_ed25519

# Target for port forwarding
port-forward:
	gcloud compute ssh --zone "asia-southeast1-b" "gdsc-mar-2024-001" --project "gdsc-mar-2024" --ssh-key-file=~/.ssh/id_ed25519 -- -NL 8080:localhost:8080

# Target for authentication
login:
	gcloud auth application-default login

.PHONY: ssh port-forward login
