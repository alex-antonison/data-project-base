FROM amazon/aws-lambda-python:3.11
ARG FUNCTION_DIR="/var/task"

# Create function directory
RUN mkdir -p ${FUNCTION_DIR}
WORKDIR ${FUNCTION_DIR}

# Copy handler function and package.json
COPY functions/ ${FUNCTION_DIR}/functions/
COPY helpers/ ${FUNCTION_DIR}/helpers/
COPY data-processing-config/ ${FUNCTION_DIR}/data-processing-config/

RUN pip install poetry

# Install python dependencies for function
COPY poetry.lock pyproject.toml  ${FUNCTION_DIR}/

RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi --without dev