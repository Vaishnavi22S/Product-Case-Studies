# Ecommerce Delivery Analytics — Refund & Revenue Loss Audit

A SQL-based operational analysis of 1,00,000 delivery orders across three quick-commerce platforms — Blinkit, JioMart, and Swiggy Instamart — to identify the root causes of refund-related revenue loss and surface actionable recommendations for ops and product teams.

---

## Business Problem

Quick-commerce platforms bleed revenue through refunds every day. The question is — is it a delivery problem or a warehouse problem? This project investigates where ₹2.71 crore in refund-related revenue loss is coming from, which complaint types drive it, which product categories are most at risk, and whether a small number of fixes can recover the majority of losses.

---

## Dataset

| Field | Detail |
|---|---|
| Total Orders | 1,00,000 |
| Platforms | Blinkit, JioMart, Swiggy Instamart |
| Product Categories | Grocery, Personal Care, Beverages, Dairy, Fruits & Vegetables, Snacks |
| Key Columns | Order ID, Customer ID, Platform, Product Category, Order Value, Service Rating, Delivery Time, Delivery Delay, Refund Requested, Customer Feedback |

> **Note:** Dataset is synthetic. A feedback distribution check confirmed all 13 labels each account for 7.5–7.8% of total orders — statistically impossible in real data. Combined with a 45.8% refund rate (industry benchmark: 3–8%), findings should be treated as directional. The analytical approach and SQL logic are valid for real-world application.

---

## Tools

- **PostgreSQL** — data modeling, view creation, all analysis queries

---

## Approach

### Step 1 — Complaint Bucketing
The raw dataset had 13 fixed feedback labels. I grouped them into 4 complaint buckets to enable business-level analysis:

| Bucket | Feedback Labels |
|---|---|
| Fulfillment Errors | "Items missing from order.", "Wrong item delivered." |
| Delivery Issues | "Very late delivery, not happy.", "Delivery person was rude." |
| Quality Issues | "Not fresh, disappointed.", "Packaging could be better." |
| General Dissatisfaction | "Horrible experience, never ordering again." |
| Positive Experience | All positive feedback labels |

### Step 2 — SQL Analysis
Built a reusable PostgreSQL view (`vw_complaint_buckets`) with the bucketing logic, then ran 7 targeted queries covering revenue loss by bucket, platform, and category, Pareto analysis, refund abuser detection, delivery delay cross-tab, and a data quality check.

---

## File Structure

```
├── ecommerce_delivery_analytics.csv   # Raw dataset
├── views/
│   └── vw_complaint_buckets.sql       # Reusable bucketing view
├── queries/
│   ├── 01_revenue_by_bucket
│   ├── 02_revenue_by_platform
│   ├── 03_revenue_by_category
│   ├── 04_pareto_analysis
│   ├── 05_refund_abuser_detection
│   ├── 06_delivery_delay_cross_tab
│   └── 07_feedback_distribution_check
└── README.md
```

---

## Key Findings

1. **Fulfillment Errors are the #1 financial leak** — ₹92.2L lost, 100% refund rate. Every wrong or missing item becomes a guaranteed refund.
2. **Delivery Issues are #2** — ₹89.8L lost, also 100% refund rate. No goodwill recovery once a delivery goes wrong.
3. **Fixing just two buckets recovers 67.1% of all revenue loss** — textbook Pareto result. Add General Dissatisfaction and the figure jumps to 83.6%.
4. **The problem is platform-agnostic** — Blinkit, JioMart, and Swiggy Instamart show near-identical loss figures, ruling out a vendor-specific issue.
5. **Personal Care is the highest-risk category** — ₹78.9L lost, leading in both Fulfillment Errors and Delivery Issues.
6. **Quality Issues are under-reported** — 15,284 complaints but only a 49.6% refund rate, suggesting real dissatisfaction is higher than refund data shows.
7. **46.5% of orders are positive** — the product baseline is healthy. This is a fixable ops problem, not a broken experience.
8. **Delivery speed is not the primary driver** — 86% of refunds occurred on orders with no recorded delivery delay, pointing to warehouse packing errors as the root cause, not rider performance.

---

## Recommendations

**1. Warehouse packing accuracy program**
Fulfillment Errors account for ₹92.2L in losses at a 100% refund rate. A barcode scan verification step at packing — prioritizing Personal Care and Grocery — would directly reduce this. Even a 20% reduction saves ~₹18L.

**2. Rider accountability and delivery SLA system**
Delivery Issues cost ₹89.8L with zero recovery. Real-time delivery tracking with automated SLA breach alerts and rider performance scoring would reduce both late deliveries and conduct complaints.

**3. Flag high-refund customers before auto-approving claims**
The refund abuser query identifies repeat customers whose individual refund rate exceeds the platform average (45.8%). A manual review step for customers above 80% refund rate reduces policy exploitation without impacting genuine complainants.

---

## Limitations

- **Synthetic data** — findings are directional, not prescriptive. See data note above.
- **No time dimension** — dataset has time-of-day only, no dates. Trend and seasonality analysis was not possible.
- **Fixed feedback labels** — pre-set categories, not free-text. Real NLP sentiment analysis would surface more nuanced patterns.
- **No cost data** — revenue lost reflects order values only. True margin impact would require cost-of-goods and logistics data, meaning actual financial damage is likely higher.
