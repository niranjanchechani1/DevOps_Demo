terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "SNOWFLAKECICD"

    workspaces {
      name = "gh-actions-demo2"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db1" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_schema1" {
  database = snowflake_database.demo_db1.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}
