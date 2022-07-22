# Create a docker image to run spanet using Kubeflow

Run the following to create a new docker image (change ```CUSTOM``` accordingly):

```
sudo docker login gitlab-registry.cern.ch
sudo docker build . -f Dockerfile -t gitlab-registry.cern.ch/jbossios/docker-images/CUSTOM
sudo docker push gitlab-registry.cern.ch/jbossios/docker-images/CUSTOM
```

Repository with docker images: https://gitlab.cern.ch/jbossios/docker-images

History:
- ```gitlab-registry.cern.ch/jbossios/docker-images/spanet-13072022-1655```: first try of image with uproot (wrong user)
- ```gitlab-registry.cern.ch/jbossios/docker-images/spanet-14072022```: second try of image with uproot (fixed username but missing vim)
- ```gitlab-registry.cern.ch/jbossios/docker-images/spanet-14072022-1350```: now w/ vim but w/o awkward
- ```gitlab-registry.cern.ch/jbossios/docker-images/spanet-14072022-1517```: now w/ awkward
- ```gitlab-registry.cern.ch/jbossios/docker-images/spanet-22072022-1602```: now w/ ROOT
