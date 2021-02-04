# pyrex-usage-example
Example of using a base docker container on DockerHub to work in Jupyter with Python or R.
- Uses `vanilla` pyrex container from [zachbogart/pyrex](https://github.com/zachbogart/pyrex)
- Base images available on [DockerHub](https://hub.docker.com/r/zachbogart/pyrex)

# Give pyrex a try!
- This setup uses a base docker container that has Python and R wrapped in with Jupyter. Work in jupyter notebooks with your favorite language!
- **Note**: Docker builds will use ~1-2 GB disk space

## 01 Build Project Docker Image
1. First, clone this repo. `cd` inside to the project's root directory.

2. Execute this at the root directory:
```
docker build --force-rm . -t pyrex_example:latest
```
- It will go get the base container from DockerHub and build it for you (will take a few minutes).
- Using `<PROJECT_NAME>:latest` as an example image naming convention.

## 02 Run Project
1. Execute this at the root directory:
```
docker run -p 8899:8888 -v $PWD:/project pyrex_example:latest
```
- This command will run this project's docker image, which uses a command to start a jupyter notebook.

## 03 Accessing Jupyter Environment 
1. After executing the above command, there will be some links in the output, which will include a long token string (`token=<LONG_STRING>`). Copy the token string.
2. Navigate to `http://localhost:8899` in your browser. You should see a prompt at the top for a "password or token". Paste the token string you copied above.
2. You should now be inside a jupyter environment. You can now execute code, running notebooks in Python or R! As an example, there are some scripts working with the [palmerpenguins](https://github.com/allisonhorst/palmerpenguins) dataset.

### Notes
- Local host port (left of the colon) is set to `8899`. Can be changed if desired. Docker-level port (right of the colon) must be set to `8888` according to Dockerfile.
- Connects local instance of project as a volume to the docker image (`-v $PWD:/project`). Anything you do while in jupyter will update your local files.

## Play!
- You are now running a jupyter notebook inside a docker image! Feel free to run the code or make your own notebooks. All work will be reproducible across different users (hooray, docker) and since we defined a volume, your work will affect your local files rather than just being ephemeral. 
- This should help other people to go through your code, allowing them to execute it in the same environment you built it. Or it could just allow people to run your scripts without the hassle of installing a bunch of stuff.

### Extensions are your friend
- There are a bunch of nbextensions that the community has created and they are super useful. They'll make you feel super awesome. Check them out in the `Nbextensions` tab when running jupyter. Here are some good ones:
    - `Table of Contents (2)`: automatically creates ToC tools
    - `ScrollDown`: long outputs are automatically scrolled down as they execute
    - `Variable Inspector`: Get a table of variables created in the notebook
    - `Hinterland`: autocomplete as you type without hitting TAB
    - `spellchecker`: highlights misspelled words as you type a markdown cell
    - `Initialization cells`: Mark cells that can be run all at once with the push of a button or on startup
- You can manually enable these extensions every time you `docker run ...` or [enable them through commands](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/install.html#enabling-disabling-extensions) in the project Dockerfile once you have a set you prefer (see `vanilla_swirl` Dockerfile for an example).
    - *Note: the nbextension tab is present because it is installed in pyrex container.*

***

Hope you enjoy coding with [pyrex](https://github.com/zachbogart/pyrex)

Made with 💖
