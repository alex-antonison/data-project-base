import os

import awswrangler as wr
from aws_lambda_powertools import Logger

logger = Logger(level=os.environ["LOG_THRESHOLD"])


def process_data_file(event, context):
    wr.s3.list_buckets()
    return {"status": "success", "message": "hello world"}
