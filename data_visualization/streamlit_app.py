import streamlit as st
from src.data_loader import read_data_from_s3
import plotly.express as px

st.title("Streams of Data Streamlit Example")

st.header("Data from S3")

s3_df = read_data_from_s3(f"s3://de-sales-data-project-data-lake-146479615822/sales_data/")

st.dataframe(s3_df)