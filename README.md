# chart-docker-driver
- https://github.com/moby/buildkit/tree/master/examples/kubernetes/consistenthash
- https://github.com/moby/buildkit/tree/master/examples/kubernetes#statefulset
- https://github.com/moby/buildkit/blob/master/examples/kubernetes/statefulset.privileged.yaml

### Sample Build
```bash
# use a hardcoded pod name corresponding to a member of the statefulset
BUILDKIT_HOST=kube-pod://docker-buildkit-0

# build something
# local gives access to dirs
buildctl \
  --addr ${BUILDKIT_HOST} \
  build --frontend dockerfile.v0 \
  --local context=${HOME}/.kube \
  --local dockerfile=${HOME}/tmp
```
