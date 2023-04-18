
.PHONY: deploy
deploy:
	cd examples/pgedge-aws-permissions && \
	terraform init && \
	terraform apply
