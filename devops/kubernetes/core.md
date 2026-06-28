# Kubernetes — Core

## Core Resources

### Pod

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: app
  labels:
    app: web
spec:
  containers:
    - name: app
      image: myapp:1.0
      ports:
        - containerPort: 3000
      resources:
        requests:
          cpu: 100m
          memory: 128Mi
        limits:
          cpu: 500m
          memory: 512Mi
  restartPolicy: OnFailure  # Always | OnFailure | Never
```

### Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web
  strategy:
    type: RollingUpdate         # RollingUpdate | Recreate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
        - name: web
          image: myapp:1.0
          readinessProbe:
            httpGet:
              path: /health
              port: 3000
            initialDelaySeconds: 5
          livenessProbe:
            httpGet:
              path: /health
              port: 3000
            periodSeconds: 10
```

### ReplicaSet, DaemonSet, StatefulSet

```yaml
# DaemonSet — runs one pod per node
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: log-collector
spec:
  selector:
    matchLabels:
      app: logs
  template:
    metadata:
      labels:
        app: logs
    spec:
      containers:
        - name: fluentd
          image: fluentd:v1.16

# StatefulSet — stable identity + persistent storage
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: db
spec:
  serviceName: db
  replicas: 3
  selector:
    matchLabels:
      app: db
  template:
    metadata:
      labels:
        app: db
    spec:
      containers:
        - name: postgres
          image: postgres:16
```

### Job and CronJob

```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: backup
spec:
  schedule: "0 2 * * *"          # Daily at 2am
  concurrencyPolicy: Forbid
  jobTemplate:
    spec:
      template:
        spec:
          containers:
            - name: backup
              image: myapp-backup:1.0
          restartPolicy: OnFailure
```

## Services

```yaml
apiVersion: v1
kind: Service
metadata:
  name: web
spec:
  selector:
    app: web
  ports:
    - port: 80
      targetPort: 3000
  type: ClusterIP   # ClusterIP | NodePort | LoadBalancer | ExternalName
```

| Type | Scope | Description |
|------|-------|-------------|
| ClusterIP | Internal | Default, cluster-internal IP |
| NodePort | External | Exposes on node port (30000-32767) |
| LoadBalancer | External | Cloud provider load balancer |
| ExternalName | External | CNAME alias to external service |

## ConfigMaps and Secrets

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  DATABASE_HOST: db.example.com
  app.conf: |
    log_level=info
    timeout=30
---
apiVersion: v1
kind: Secret
metadata:
  name: app-secrets
type: Opaque
data:
  password: cGFzc3dvcmQ=   # base64 encoded
stringData:
  api-key: plaintext-key    # auto-encoded on creation
```

```yaml
# Using in a Pod
env:
  - name: DB_HOST
    valueFrom:
      configMapKeyRef:
        name: app-config
        key: DATABASE_HOST
  - name: PASSWORD
    valueFrom:
      secretKeyRef:
        name: app-secrets
        key: password
```

## Ingress

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: web
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx
  tls:
    - hosts:
        - app.example.com
      secretName: tls-secret
  rules:
    - host: app.example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: web
                port:
                  number: 80
```

## PersistentVolume and PersistentVolumeClaim

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: data-pvc
spec:
  accessModes:
    - ReadWriteOnce          # RWO | ReadOnlyMany | ReadWriteMany
  storageClassName: standard
  resources:
    requests:
      storage: 10Gi
---
# Used in Pod
volumes:
  - name: data
    persistentVolumeClaim:
      claimName: data-pvc
```

## Namespaces and Labels

```bash
kubectl create namespace staging
kubectl get pods -n staging
kubectl label pod web env=production tier=frontend
kubectl get pods -l env=production,tier=frontend
```

## Horizontal Pod Autoscaler

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: web
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: web
  minReplicas: 2
  maxReplicas: 10
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 70
```

## RBAC

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-reader
  namespace: default
rules:
  - apiGroups: [""]
    resources: ["pods"]
    verbs: ["get", "list", "watch"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: read-pods
  namespace: default
subjects:
  - kind: User
    name: jane
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

## NetworkPolicy

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-web
spec:
  podSelector:
    matchLabels:
      app: web
  policyTypes:
    - Ingress
  ingress:
    - from:
        - podSelector:
            matchLabels:
              app: frontend
      ports:
        - port: 3000
```

## Helm Charts

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-release bitnami/postgresql
helm upgrade my-release bitnami/postgresql --set auth.postgresPassword=secret
helm rollback my-release 1
helm list
helm uninstall my-release
```

## kubectl Commands

```bash
kubectl get pods -o wide -A          # All namespaces
kubectl describe deployment web      # Full details
kubectl logs -f deploy/web -c app    # Container logs
kubectl exec -it pod/web -- sh       # Interactive shell
kubectl apply -f manifest.yaml       # Create/update
kubectl delete -f manifest.yaml      # Delete resources
kubectl rollout status deploy/web    # Rollout progress
kubectl rollout undo deploy/web      # Rollback
kubectl scale deploy/web --replicas=5
kubectl port-forward svc/web 8080:80 # Local port forward
kubectl top pods                     # Resource usage (metrics-server)
kubectl diff -f manifest.yaml        # Preview changes
```

## See Also

- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [kubectl Reference](https://kubernetes.io/docs/reference/kubectl/)
- [Helm Documentation](https://helm.sh/docs/)
- [Kubernetes API Reference](https://kubernetes.io/docs/reference/kubernetes-api/)
