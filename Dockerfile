FROM python:3.10 as python-base

ENV POETRY_VERSION=1.8.1
ENV POETRY_HOME=/opt/poetry
ENV POETRY_VENV=/opt/poetry-venv
ENV POETRY_CACHE_DIR=/opt/.cache

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

FROM python-base as poetry-base

RUN python3 -m venv $POETRY_VENV \
	&& $POETRY_VENV/bin/pip install -U pip setuptools \
	&& $POETRY_VENV/bin/pip install poetry==${POETRY_VERSION}

FROM python-base as example-app

COPY --from=poetry-base ${POETRY_VENV} ${POETRY_VENV}

ENV PATH="${PATH}:${POETRY_VENV}/bin"

WORKDIR /docker_streamlit

COPY . /docker_streamlit/
COPY poetry.lock pyproject.toml ./

RUN poetry check

RUN poetry install --no-interaction --no-cache
EXPOSE $PORT

CMD poetry run streamlit run docker_streamlit/main.py --server.port=$PORT --server.address=0.0.0.0