# E-Commerce Customer Churn Analysis: Understanding Why Users Leave

## 📋 Project Overview
Acting as a Product Analyst, I utilized **SQL** and **Power BI** to analyze a behavioral dataset of 50,000 shoppers and diagnose the root causes behind a critical **28.9% customer churn rate**. By mapping customer touchpoints, I isolated key operational friction points and translated these insights into targeted, product-led interventions to safeguard recurring revenue

---

## 🚀 The Approach
1. **Data Synthesis (SQL):** Aggregated and cleaned 50,000 user profiles from backend transactional, support, and session tables
2. **Behavioral Modeling (Power BI):** Developed an interactive dashboard to isolate retention trends, ensuring macro company KPIs remained anchored while behavioral breakdowns cross-filtered dynamically
3. **Product Ideation & Experimentation:** Categorized users into friction risk tiers, formulated feature hypotheses to address drop-offs, and designed a controlled A/B testing framework

---

## 🔍 What the Data Told Us
Customer churn is not random; it is heavily concentrated around two major journey roadblocks:
* **Support Volume Breaking Point:** Churning users show an aggressive spike in customer service engagement, averaging **6.4 to 6.9 calls per user** before leaving. This signals a major early-lifecycle onboarding or system usability issue.
* **Checkout Conversion Leak:** High-intent buyers actively add items to their carts but encounter significant friction at the final payment stage, leading to high cart abandonment rates that directly drive churn.

---

## 💡 What Can Be Improved (Product Recommendations)

### 1. Proactive 14-Day Guided Onboarding Flow
* **The Fix:** Introduce an interactive walkthrough for new users during their first two weeks.
* **The Goal:** Resolve setup confusion in real-time to lower support call volume and prevent early drop-offs.

### 2. Intent-Based Checkout Optimization
* **The Fix:** Deploy automated micro-interventions, such as a simplified one-click checkout or conditional live-chat assistance if a user stalls on the payment page for over 45 seconds.
* **The Goal:** Recapture high-intent revenue right at the point of transactional abandonment.

---

## 📊 Success Metrics
To validate these improvements safely, they will be deployed via randomized A/B tests and measured against:
* **North Star Metric:** Reduce the overall churn rate from 28.9% to a target of 24.5%.
* **Guardrail Metric:** Monitor Average Order Value (AOV) to ensure checkout simplifications do not negatively compress cart spend.
