# pyrex-usage-example
Example of using a base image on DockerHub to work in Jupyter with Python or R.

## 01 Build Project Docker Image
Execute at root of project directory:
```
docker build --force-rm . -t pyrex_example:latest
```

### Notes
- Using `latest` as default tag
- Can specify other tags for different local builds

## 02 Run Project
Execute at root of project directory:
```
docker run -p 8888:8888 -v $PWD:/project pyrex_example:latest
```
### Opening Jupyter
1. In output, will see several links. The one starting with `http://127.0.0.1:8888` should work fine
2. You can now execute code, running notebooks in Python or R!

### Notes
- Local host port (left of the colon) is set to `8888`. Can be changed if desired. Docker-level port (right of the colon) must be set to `8888` according to Dockerfile.
- Connects local instance of project as a volume to the docker image. Anything you do while running will update your local files.
- If you have trouble conntecting, you can try navigating to `localhost:8888` in your browser and copying one of the token strings by hnad into the top password input. In the future, need to better understand how set a password automatically.
