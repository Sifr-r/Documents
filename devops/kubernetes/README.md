# Kubernetes

Kubernetes (K8s) is an open-source container orchestration platform for automating deployment, scaling, and management of containerized applications. Current stable release: 1.29+.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Resources, services, ingress, storage, RBAC, networking, Helm, kubectl |

## Quick Reference

### Pod

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: web
  labels:
    app: web
spec:
  containers:
    - name: web
      image: nginx:1.25
      ports:
        - containerPort: 80
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
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
        - name: web
          image: myapp:1.0
          ports:
            - containerPort: 3000
```

### Service

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
  type: ClusterIP
```

### kubectl Commands

```bash
kubectl get pods -o wide          # List pods
kubectl describe pod web          # Pod details
kubectl logs -f web               # Follow logs
kubectl exec -it web -- sh        # Shell into pod
kubectl apply -f deployment.yaml  # Apply manifest
kubectl rollout status deploy/web # Check rollout
kubectl delete pod web            # Delete resource
```
