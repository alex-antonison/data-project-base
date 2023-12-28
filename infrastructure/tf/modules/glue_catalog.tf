# stand up databases in glue catalog
resource "aws_glue_catalog_database" "data_lake" {
  name = "data_lake"
}

resource "aws_glue_catalog_database" "data_mart" {
  name = "data_mart"
}