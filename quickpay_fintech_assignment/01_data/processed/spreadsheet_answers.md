# Spreadsheet Cleaning Summary

## Cleaning Performed
- Removed duplicates
- Standardized merchant names
- Standardized date formats
- Standardized status values
- Standardized risk scores
- Standardized gateway regions
- Converted all transaction amounts into USD
- Enriched transactions using merchant master data

## Business Logic

### high_value_flag
- APAC and amount_usd > 5000
- EU and amount_usd > 6000
- US and amount_usd > 7000

### high_risk_flag
- risk_score >= 70
- or status contains CHARGEBACK

## Output Files
- cleaned_transactions.csv
- merchant_risk_summary.csv
