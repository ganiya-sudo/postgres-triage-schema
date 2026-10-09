# Relational Database Schema & Triage Diagnostics (PostgreSQL Engine)

## 📋 Project Objective & Overview
This repository contains a localized relational database implementation built natively within a **PostgreSQL** engine environment and queried using the **pgAdmin 4** workspace GUI client. The objective of this project is to simulate real-world **Tier 2 Technical Support Engineering triage workflows**—specifically focusing on relational data tracking, cross-table architecture parsing, multi-condition query filtering, and identifying specific syntax variations distinct from alternate database systems (like MySQL).

## 🛠️ Data Infrastructure & Architectural Layout
The database space constructs an isolated operational testing framework containing two distinct relational schema tables connected via matching primary and foreign key mapping fields:
*   **`customer_rentals`**: Tracks real-time end-user transaction loops, including specific unique identifier indexes, rental rates, chronological day tracking variations, and active user lifecycle statuses.
*   **`rental_locations`**: Maps specific physical center geographical tags directly to corresponding processing IDs to enable cross-platform data stitching.

## 🕵️‍♀️ Tier 2 Support Triage Scenarios Implemented

### 🔍 Scenario A: High-Priority Queue Triage (Multi-Condition Query Filters)
*   **Operational Intent**: Simulating an internal ticket escalation where database line friction is occurring due to premium-rate user accounts entering an overdue state.
*   **Technical Execution**: Implemented an explicit data-hunting script utilizing numerical calculations linked together via boolean conditional arguments (`AND`) to instantly isolate high-value revenue anomalies:
    ```sql
    SELECT * FROM customer_rentals
    WHERE rental_rate > 2.00 AND status = 'Overdue';
    ```

### 🔗 Scenario B: Cross-Table Data Stitching (Relational INNER JOIN Logic)
*   **Operational Intent**: Resolving an application data mismatch context where user records display tracking indexes but fail to display storefront geographical markers.
*   **Technical Execution**: Leveraged an optimized `INNER JOIN` statement utilizing short table aliases (`AS`) to stitch columns from separate independent spreadsheet blocks into a singular unified real-time dashboard layout:
    ```sql
    SELECT cr.customer_name, cr.movie_title, loc.store_city
    FROM customer_rentals AS cr
    INNER JOIN rental_locations AS loc ON cr.rental_id = loc.rental_id;
    ```

### 🥊 Scenario C: Database Flavor Verification (`RETURNING` Clause Clause Variation)
*   **Operational Intent**: Optimizing API payload generation and query script latency by leveraging database engine optimization features missing from alternative engines (like MySQL).
*   **Technical Execution**: Successfully executed a native Postgres data insertion script incorporating the **`RETURNING`** operator arguments. This forces the system engine to immediately echo the newly injected payload schema directly back to the visual interface tool within the same execution millisecond, rendering a separate diagnostic `SELECT` command redundant.
```sql
INSERT INTO customer_rentals (rental_id, customer_name, movie_title, rental_rate, status, days_overdue) 
VALUES (106, 'Supabase Recruiter', 'The Impossible Support Engineer', 4.99, 'Active', 0)
RETURNING customer_name, movie_title, status;
```

---
*Developed as part of my career upskilling journey to become an impossible-to-ignore Technical Support Engineer. Follow my full building-in-public journey on TikTok at **@talktechwithganiya**! 🚀*
