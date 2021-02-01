# pyrex-usage-example
Example of using a base image on DockerHub to work in Jupyter with Python or R.
- Uses `main` image from [zachbogart/pyrex](https://github.com/zachbogart/pyrex)
- Base images available on [DockerHub](https://hub.docker.com/r/zachbogart/pyrex)

# Give pyrex a try!

## 01 Build Project Docker Image
- Clone this repo

- Execute this at the root directory:
```
docker build --force-rm . -t pyrex_example:latest
```

### Notes
- Using `latest` as default tag
- Can specify other tags to name local builds differently

## 02 Run Project
- Execute this at the root directory:
```
docker run -p 8888:8888 -v $PWD:/project pyrex_example:latest
```
### Opening Jupyter
1. In output, will see several links. The one starting with `http://127.0.0.1:8888` should work fine
2. You can now execute code, running notebooks in Python or R!

### Notes
- Local host port (left of the colon) is set to `8888`. Can be changed if desired. Docker-level port (right of the colon) must be set to `8888` according to Dockerfile.
- Connects local instance of project as a volume to the docker image. Anything you do while running will update your local files.
- If you have trouble conntecting, you can try navigating to `localhost:8888` in your browser and copying one of the token strings by hand into the top password input. 

## 03 Play!
- You are now running a jupyter notebook inside a docker image! Feel free to run the code or make your own notebooks. All work will be consistent across different users (hooray, docker) and since we defined a volume, your work will affect your local files rather than just being ephemeral. 
- This should help other people to go through your code, allowing them to execute it in the same environemnt you built it. Or it could just allow people to run your scripts without the hassle of installing a bunch of stuff.

Hope you enjoy coding with pyrex

Made with 💖
