# Useful documentation for using the genesys with docker

## GITHUB ACTIONS DOCKER REFERENCE

<https://docs.docker.com/build/ci/github-actions/examples/>

## Run GITHUB actions locally

<https://github.com/nektos/act>

## Docker commands

### run the image bash

```
docker run -it joaojanini/genesys-simulator:latest bash
```

### mount volume with new models, copy models to the container folder and run the image bash
    ```
    docker run -it -v student_models:/student_models joaojanini/genesys-simulator:latest /bin/bash scripts/copy_student_model_to_models.sh
    ```
 cp -r /student_models/* /Genesys-Simulator/source/applications/terminal/examples/smarts