# renovate: datasource=github-release-attachments depName=rancher/helm
HELM_VERSION := v3.13.3-rancher1

KUBECTL_VERSION := v1.26.9
KUBECTL_SUM_arm64 ?= $(shell curl -L "https://dl.k8s.io/release/$(KUBECTL_VERSION)/bin/linux/arm64/kubectl.sha256")
KUBECTL_SUM_amd64 ?= $(shell curl -L "https://dl.k8s.io/release/$(KUBECTL_VERSION)/bin/linux/amd64/kubectl.sha256")
KUBECTL_SUM_s390x ?= $(shell curl -L "https://dl.k8s.io/release/$(KUBECTL_VERSION)/bin/linux/s390x/kubectl.sha256")

# renovate: datasource=github-release-attachments depName=derailed/k9s
K9S_VERSION := v0.32.4
# renovate: datasource=github-release-attachments depName=derailed/k9s digestVersion=v0.32.4
K9S_SUM_arm64 := adfbe3de1ffd3f119ff27d76d9a493e08adb2536f9b79d08fa245ddb75a5fe52
# renovate: datasource=github-release-attachments depName=derailed/k9s digestVersion=v0.32.4
K9S_SUM_amd64 := d62611d9be2c35b782a765e98421500196acbf8be844cd3d9e32d4fa7846da05
# renovate: datasource=github-release-attachments depName=derailed/k9s digestVersion=v0.32.4
K9S_SUM_s390x := 29ae8a00a01a9108473dea0fd4d60e472496ec6203060f06629f402ac6211750

# Reduces the code duplication on Makefile by keeping all args into a single variable.
IMAGE_ARGS := --build-arg HELM_VERSION=$(HELM_VERSION) \
			  --build-arg KUBECTL_VERSION=$(KUBECTL_VERSION) --build-arg KUBECTL_SUM_arm64=$(KUBECTL_SUM_arm64) --build-arg KUBECTL_SUM_amd64=$(KUBECTL_SUM_amd64) --build-arg KUBECTL_SUM_s390x=$(KUBECTL_SUM_s390x) \
			  --build-arg K9S_VERSION=$(K9S_VERSION) --build-arg K9S_SUM_arm64=$(K9S_SUM_arm64) --build-arg K9S_SUM_amd64=$(K9S_SUM_amd64) --build-arg K9S_SUM_s390x=$(K9S_SUM_s390x)
