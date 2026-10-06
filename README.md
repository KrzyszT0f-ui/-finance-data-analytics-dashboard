# Finance Data & Analytics Dashboard

Interactive Finance Data & Analytics Dashboard built with BigQuery and Looker Studio.

## Live dashboard

[Open the interactive Looker Studio dashboard](https://datastudio.google.com/s/otKag_ThdUQ)

## Project overview

This project demonstrates an end-to-end Finance Data & Analytics reporting workflow: transforming financial data in BigQuery and presenting it through an interactive Looker Studio dashboard.
The report supports monthly KPI monitoring and detailed G/L activity analysis through interactive filters.

## Dashboard pages

### Finance Overview

- Monthly Finance KPI monitoring
- Company Code and Document Type filters
- Date-range filtering
- Trend analysis and management reporting

### G/L Account Analysis

- Monthly net G/L movement analysis
- Debit and credit turnover
- Document and line-item volumes
- Company Code, G/L Account and date-range filters
- Analysis of high-volume accounts and movement patterns

## Data model

| BigQuery view | Purpose |
|---|---|
| `monthly_finance_kpis` | Aggregated Finance KPI reporting by month and Finance dimensions |
| `monthly_gl_summary` | Monthly G/L aggregation for turnover, net movement and document-activity analysis |

Key fields used in the G/L summary include:

- `company_code`
- `gl_account`
- `posting_month`
- `debit_turnover_local_currency`
- `credit_turnover_local_currency`
- `net_gl_movement_local_currency`
- `document_count`
- `line_item_count`
- `null_amount_exception_count`

## Tools and skills demonstrated

- Google BigQuery
- SQL and data aggregation
- Looker Studio dashboard development
- Finance KPI design
- G/L account analysis
- Data-quality checks
- Interactive reporting and filtering
