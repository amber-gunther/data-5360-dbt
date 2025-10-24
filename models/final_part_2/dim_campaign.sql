{{ config(
    materialized = 'table',
    schema = 'final_part_2'
    )
}}

SELECT
campaignid as campaign_key,
campaignid,
campaignname
FROM {{ source('ecoessentials_landing', 'marketing_emails') }}