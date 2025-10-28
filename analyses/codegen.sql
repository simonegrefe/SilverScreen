version: 2

{{ codegen.generate_model_yaml(
    model_names=['stg_invoices', 'stg_movie_catalogue', 'stg_nj_001', 'stg_nj_002', 'stg_nj_003']
) }}

{{ codegen.generate_model_yaml(
    model_names=['stg_invoices']
) }}