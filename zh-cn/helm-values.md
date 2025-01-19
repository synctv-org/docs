# Helm Values

| Parameter | Description | Default Value |
|-----------|-------------|---------------|
| `synctv.image.repository` | Docker image repository for Synctv | `synctvorg/synctv` |
| `synctv.image.tag` | Docker image tag for Synctv | `""` |
| `synctv.image.pullPolicy` | Pull policy for Synctv image | `IfNotPresent` |
| `synctv.envConfigName` | Name of the ConfigMap containing environment variables | `synctv-env` |
| `synctv.storage.size` | Size of the persistent volume claim for Synctv | `1Gi` |
| `synctv.storage.storageClass` | Storage class for the persistent volume claim for Synctv | `""` |
| `postgresql.enabled` | Enable or disable PostgreSQL | `true` |
| `postgresql.image.repository` | Docker image repository for PostgreSQL | `pgvector/pgvector` |
| `postgresql.image.tag` | Docker image tag for PostgreSQL | `pg16` |
| `postgresql.image.pullPolicy` | Pull policy for PostgreSQL image | `IfNotPresent` |
| `postgresql.storage.size` | Size of the persistent volume claim for PostgreSQL | `1Gi` |
| `postgresql.storage.storageClass` | Storage class for the persistent volume claim for PostgreSQL | `""` |
| `ingress.enabled` | Enable or disable Ingress | `true` |
| `ingress.className` | Ingress class name | `nginx` |
| `ingress.annotations` | Annotations for Ingress | `{}` |
