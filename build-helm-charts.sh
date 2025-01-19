CHART_PATH="$PWD/synctv/helm"
(cd helm-charts/packages && helm package $CHART_PATH)
(cd helm-charts && helm repo index . --merge index.yaml)
