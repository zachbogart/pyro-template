FROM zachbogart/pyrex:vanilla

# define project directory and move everything over
ENV PROJECT_DIR /project
WORKDIR ${PROJECT_DIR}
COPY . ${PROJECT_DIR}/

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
# from https://jupyter-notebook.readthedocs.io/en/stable/public_server.html#docker-cmd
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

# start running jupyter notebook
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]