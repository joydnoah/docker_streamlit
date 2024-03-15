# HEROKU STREAMLIT DOCKER
***

This repo is an example on how to deploy a streamlit application through heroku using docker.

This is just to learn and doesnt represent the best way to deploy python application, heroku already handle python applications by its own buildpack and you should go that way if you only want to deploy a working application.

But if you want to test how to deploy a docker container as a practice for more complex deployment pipelines use this as a base.

Also for this to work you need to change the heroku stack to container, you can do it through the heroku CLI using the following command:
```
heroku logs --tail --app <APP NAME>
```

To run the application locally you can use the following command
```
# docker build
docker build - streamlit-example

# docker run
docker run -p 8080:8080 -e PORT=8080 streamlit-example
```

You can also run the application locally without the need of docker, it uses poetry as a package and dependencies manager, to run the application use this commands:
```
poetry install
poetry run streamlit run docker_streamlit/main.py
```