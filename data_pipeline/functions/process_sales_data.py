import os

import awswrangler as wr
from helpers.datacleaning import (
    drop_na,
    rename_avg_price_to_price,
    remove_trailing_zeros_from_df,
    update_online_spend_with_quantity,
    total_spend,
)
from pathlib import Path


def process_sales_function(event, context):
    df = wr.s3.read_csv(
        "s3://de-sales-data-project-raw-data-146479615822/Online_Shopping_Dataset.csv"
    )

    source_file_name = Path(
        "s3://de-sales-data-project-raw-data-146479615822/Online_Shopping_Dataset.csv"
    ).name
    source_file_stem = Path(
        "s3://de-sales-data-project-raw-data-146479615822/Online_Shopping_Dataset.csv"
    ).stem

    Path()
    df = drop_na(df)
    df = rename_avg_price_to_price(df)
    df = df.drop(columns=["Unnamed: 0", "Date"])
    df = remove_trailing_zeros_from_df(df)
    df = update_online_spend_with_quantity(df)
    df = total_spend(df)

    # this will be used as your partition
    df["source_file_name"] = source_file_name

    table_name = "sales_data"
    s3_object_path = f"s3://de-sales-data-project-data-lake-146479615822/{table_name}/{source_file_stem}.parquet"

    wr.s3.to_parquet(
        df=df,
        path=s3_object_path,
        dataset=True,
        mode="insert_overwrite",
        database="data_lake",
        table=table_name,
    )
    return {"status": "success", "message": "hello world"}
