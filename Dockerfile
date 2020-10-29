FROM jupyter/scipy-notebook:latest

# Disable auth
RUN echo "c.NotebookApp.token = ''" >> /etc/jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.password = ''" >> /etc/jupyter/jupyter_notebook_config.py

RUN pip install gbdxtools ipykernel
RUN python -m ipykernel install --user --name=python3-notebooks

WORKDIR $HOME/notebooks
