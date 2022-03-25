STACK = gotestaws
.PHONY: build deploy validate destroy

deploy: build
	SAM_CLI_TLEMETRY=0 sam deploy --resolve-s3 --stack-name $(STACK) \
		 --no-confirm-changeset --no-fail-on-empty-changeset --capabilities CAPABILITY_IAM --disable-rollback

build:
	sam build

validate:
	aws cloudformation validate-template --template-body file://template.yml

destroy:
	aws cloudformation delete-stack --stack-name $(STACK)