.PHONY: deploy help

INVENTORY=hosts
DEPLOYMENT=deployment.yml

help:
	@grep -E '(^[0-9a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-25s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

deploy: ## deploy stack on the cluster
	ansible-playbook -i $(INVENTORY) $(DEPLOYMENT)

reset: ## Reset all
	ansible-playbook -i $(INVENTORY) $(RESET)
