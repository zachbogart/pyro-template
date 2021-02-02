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
- Using `<PROJECT_NAME>:latest` as an example image naming convention

## 02 Run Project
- Execute this at the root directory:
```
docker run -p 8888:8888 -v $PWD:/project pyrex_example:latest
```
### Opening Jupyter
1. After executing the command, there will be some links in the output. Paste the one starting with an IP address in your browser (might have to remove punctuation or paste in token string, see note below).
2. You can now execute code, running notebooks in Python or R!

### Notes
- Local host port (left of the colon) is set to `8888`. Can be changed if desired. Docker-level port (right of the colon) must be set to `8888` according to Dockerfile.
- Connects local instance of project as a volume to the docker image. Anything you do while running will update your local files.
- If you have trouble connecting, you can navigate to `localhost:8888` in your browser and copy one of the token strings by hand into the top password input. 

## 03 Play!
- You are now running a jupyter notebook inside a docker image! Feel free to run the code or make your own notebooks. All work will be consistent across different users (hooray, docker) and since we defined a volume, your work will affect your local files rather than just being ephemeral. 
- This should help other people to go through your code, allowing them to execute it in the same environment you built it. Or it could just allow people to run your scripts without the hassle of installing a bunch of stuff.

## Extensions are your friend
- Using some nbextensions the community have created are super useful. Check them out in the `Nbextensions` tab when running jupyter. Here are some good ones:
    - `Table of Contents (2)`: automatically creates ToC tools
    - `ScrollDown`: long outputs are automatically scrolled down as they execute
    - `Variable Inspector`: Get a table of variables created in the notebook
    - `Hinterland`: autocomplete as you type without hitting TAB
    - `spellchecker`: highlights misspelled words as you type a markdown cell
    - `Initialization cells`: Mark cells that can be run all at once with the push of a button or on startup
    - `Rubberband`: graphically select multiple cells with Shift+Click
- You can manually enable these extensions when opening notebook or [enable them through commands](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/install.html#enabling-disabling-extensions) in the project Dockerfile once you have a set you prefer.

Hope you enjoy coding with pyrex

Made with 💖
