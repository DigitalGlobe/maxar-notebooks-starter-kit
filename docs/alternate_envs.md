# Alternate Development Environments

Depending on a users development workflow, Pipenv and the systems Python may not work. Here are a couple other common options for running notebooks locally in isolated environments.

## Conda

For Conda users, create a new environment and install the dependencies:

```shell
conda create -n notebooks python=3.8
conda activate notebooks
conda install -n notebooks -c conda-forge jupyterlab ipykernel matplotlib shapely
pip install gbdxtools>=0.17.1
```

Once all the dependencies are installed, navigate to the root of your repository. While the conda env is still active, create the kernel and start the server. 

```shell
python -m ipykernel install --user --name=python3-notebooks
jupyter lab .
```

> Note: If you can't open Jupyter in your browser because it is asking for a password, try copying the url from the shell with the token, and open it in your browser. If that doesn't work, you can disable auth by running: `jupyter lab --NotebookApp.token='' --NotebookApp.password=''`. Note that this removes authentication from the running server, and anyone with access to your computer can access the server.

## Docker

For Docker users, there is a dockerfile and a compose file for running the jupyter server in a docker container. Make sure to navigate to the root of your repository so the correct directory is mounted to the container. You `~/.gbdx-config` file is also mounted, so ensure that file exists. 

To start the Jupyter server, run the following:

```shell
docker-compose up --build
```

This will build the image and start a container running the server on port 8888. If you want to change the host port, you can edit the compose file. Also note that this is build on the `jupyter/scipy-notebook` image on Dockerhub. It has some common Python data science libraries pre-installed.

When you are done, you can close the browser and hold <Ctrl-C>. You can then run the following to cleanup:

```shell
docker-compose down
```
