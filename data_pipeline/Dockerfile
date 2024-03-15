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
COPY requirements.txt  ${FUNCTION_DIR}/

RUN pip install -r requirements.txt