-- Finance Data & Analytics Dashboard
-- Purpose: Builds monthly G/L account-level turnover, net movement and document-activity metrics
-- for the G/L Account Analysis page.
-- Note: BigQuery project and dataset identifiers have been anonymised.
-- Replace placeholders before execution.

CREATE OR REPLACE VIEW
  `your-gcp-project.your_dataset.monthly_gl_summary` AS

SELECT
  posting_date,
  DATE_TRUNC(posting_date, MONTH) AS posting_month,
  company_code,
  fiscal_year,
  fiscal_period,
  document_type,
  document_currency,
  gl_account,

  COUNT(*) AS line_item_count,

  COUNT(DISTINCT CONCAT(
    mandt, '|',
    company_code, '|',
    document_number, '|',
    fiscal_year
  )) AS document_count,

  SUM(
    CASE
      WHEN debit_credit_indicator = 'S'
      THEN amount_local_currency
      ELSE 0
    END
  ) AS debit_turnover_local_currency,

  SUM(
    CASE
      WHEN debit_credit_indicator = 'H'
      THEN amount_local_currency
      ELSE 0
    END
  ) AS credit_turnover_local_currency,

  SUM(signed_amount_local_currency) AS net_gl_movement_local_currency,

  COUNTIF(amount_local_currency IS NULL) AS null_amount_exception_count,

  COUNT(DISTINCT gl_account) AS gl_account_count

FROM
  `your-gcp-project.your_dataset.gl_line_items_enriched`

GROUP BY
  posting_date,
  posting_month,
  company_code,
  fiscal_year,
  fiscal_period,
  document_type,
  document_currency,
  gl_account;
