VERSION=0.2.1

docker:
	docker build -t sensu_server:${VERSION} -f sensu.docker .
	docker build -t uchiwa:${VERSION} -f uchiwa.docker .
	docker pull redis

tag:
	docker tag sensu_server:${VERSION} ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/sensu_server:${VERSION}
	docker tag uchiwa:${VERSION} ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/sensu_uchiwa:${VERSION}
	docker tag redis ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/redis

	docker tag sensu_server:${VERSION} ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/sensu_server:latest
	docker tag uchiwa:${VERSION} ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/sensu_uchiwa:latest

push:
	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/sensu_server:${VERSION}
	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/sensu_server:latest

	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/sensu_uchiwa:${VERSION}
	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/sensu_uchiwa:latest

	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/redis

pull:
	docker pull ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/sensu_server
	docker pull ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/sensu_uchiwa
	docker pull ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/redis

login:
	`aws ecr get-login --no-include-email`
