{{ config(
    materialized = 'table',
    schema = 'final_part_2'
    )
}}

SELECT
emaileventid as eventid, 
emaileventid,
eventtimestamp,
eventtype
FROM {{ source('ecoessentials_landing', 'marketing_emails') }}