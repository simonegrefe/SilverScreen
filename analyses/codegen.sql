--schema erstellen

version: 2

{{ codegen.generate_model_yaml(
    model_names=['stg_invoices', 'stg_movie_catalogue', 'stg_nj_001', 'stg_nj_002', 'stg_nj_003']
) }}

{{ codegen.generate_model_yaml(
    model_names=['int_movies', 'int_nj_monthly_rev']
) }}

{{ codegen.generate_model_yaml(
    model_names=['mart_monthly_performance']
) }}

--generic tests

# packages.yml
packages:
  - package: dbt-labs/dbt_utils
    version: ">=1.1.1"
