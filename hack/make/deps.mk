# renovate: datasource=github-release-attachments depName=rancher/helm
HELM_VERSION := v3.17.0-rancher1

KUBECTL_VERSION := v1.31.7
KUBECTL_SUM_arm64 ?= $(shell curl -L "https://dl.k8s.io/release/$(KUBECTL_VERSION)/bin/linux/arm64/kubectl.sha256")
KUBECTL_SUM_amd64 ?= $(shell curl -L "https://dl.k8s.io/release/$(KUBECTL_VERSION)/bin/linux/amd64/kubectl.sha256")
KUBECTL_SUM_s390x ?= $(shell curl -L "https://dl.k8s.io/release/$(KUBECTL_VERSION)/bin/linux/s390x/kubectl.sha256")

# renovate-local: kustomize-amd64
KUSTOMIZE_VERSION := v5.6.0
# renovate-local: kustomize-arm64=v5.6.0
KUSTOMIZE_SUM_arm64 := ad8ab62d4f6d59a8afda0eec4ba2e5cd2f86bf1afeea4b78d06daac945eb0660
# renovate-local: kustomize-amd64=v5.6.0
KUSTOMIZE_SUM_amd64 := 54e4031ddc4e7fc59e408da29e7c646e8e57b8088c51b84b3df0864f47b5148f
# renovate-local: kustomize-s390x=v5.6.0
KUSTOMIZE_SUM_s390x := e633bddd040a1d1acedac655044c2d2bcbba048481662ff6035ea1205ee9a869

# renovate: datasource=github-release-attachments depName=derailed/k9s
K9S_VERSION := v0.50.0
# renovate: datasource=github-release-attachments depName=derailed/k9s digestVersion=v0.50.0
K9S_SUM_arm64 := 2a068382b89d3c8ca49c3b0593b50601ba0d0c057bee2433d71d3aa983e69325
# renovate: datasource=github-release-attachments depName=derailed/k9s digestVersion=v0.50.0
K9S_SUM_amd64 := 63eb225a3da358245d37e7f79904d62c1d5361e4faa9275c43fb3cdbb053dde9
# renovate: datasource=github-release-attachments depName=derailed/k9s digestVersion=v0.50.6
K9S_SUM_s390x := 40160d1b6dc03197b958e57230f2f2a60ee3b68980d4e10e1b39fa57f063af0d

# Reduces the code duplication on Makefile by keeping all args into a single variable.
IMAGE_ARGS := --build-arg HELM_VERSION=$(HELM_VERSION) \
			  --build-arg KUBECTL_VERSION=$(KUBECTL_VERSION) --build-arg KUBECTL_SUM_arm64=$(KUBECTL_SUM_arm64) --build-arg KUBECTL_SUM_amd64=$(KUBECTL_SUM_amd64) --build-arg KUBECTL_SUM_s390x=$(KUBECTL_SUM_s390x) \
			  --build-arg KUSTOMIZE_VERSION=$(KUSTOMIZE_VERSION) --build-arg KUSTOMIZE_SUM_arm64=$(KUSTOMIZE_SUM_arm64) --build-arg KUSTOMIZE_SUM_amd64=$(KUSTOMIZE_SUM_amd64) --build-arg KUSTOMIZE_SUM_s390x=$(KUSTOMIZE_SUM_s390x) \
			  --build-arg K9S_VERSION=$(K9S_VERSION) --build-arg K9S_SUM_arm64=$(K9S_SUM_arm64) --build-arg K9S_SUM_amd64=$(K9S_SUM_amd64) --build-arg K9S_SUM_s390x=$(K9S_SUM_s390x)
