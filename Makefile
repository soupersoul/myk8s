minikube-env:
	@eval $(minikube docker-env)

dashboard-proxy:
	@kubectl proxy --address='192.168.0.114' --accept-hosts='^.*'

deploy:
	@make $(DEPLOY_OBJ)

rocketmq:
	@make rocketmq-console

rocketmq-console:
	@kubectl apply -f rocketmq/console-ng.yaml -n rocketmq
	@kubectl port-forward --address 0.0.0.0 service/rocketmq-console-ng 30082:8080 -n rocketmq &
	@echo rocketmq console已部署，服务端口30082







