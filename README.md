# Web3 Market Dynamics & SQL Analytics Portfolio

Welcome to my database programming portfolio! This repository contains the raw SQL queries and logic I developed to analyze on-chain data using [Dune Analytics](https://dune.com/). 

**🔗 [View The Live Interactive Dashboard Here](https://dune.com/deni82/defi-market-liquidity-and-protocol-analytics?utm_source=share&utm_medium=copy&utm_campaign=dashboard)**

## Primary Focus
The goal of these projects is to demonstrate intensive SQL capabilities, including **Time-Series Aggregation**, **Relational Joins (Fact to Dimension)**, and **Double-Entry Ledger Logic using CTEs**, applied to large-scale blockchain datasets.

---

## Project Structure & SQL Breakdown

### 1. Uniswap V3: 30-Day USD Volume
* **Folder:** [`/01_uniswap_volume`](./01_uniswap_volume/query.sql)
* **Objective:** Track daily macro trading trends and liquidity shifts on the largest Decentralized Exchange.
* **SQL Concepts Highlighted:**
  * Time-series aggregation using `DATE_TRUNC`.
  * Efficient filtering mechanisms to limit compute load over large datasets (30-day interval limit).
  * Handling null values to ensure accurate financial aggregations.

### 2. Aave V3: Bluechip Borrowing Trends
* **Folder:** [`/02_aave_borrows`](./02_aave_borrows/query.sql)
* **Objective:** Analyze lending protocol risk appetite by tracking the daily borrowing volume of major stablecoins and bluechip assets.
* **SQL Concepts Highlighted:**
  * Relational Database Logic: `JOIN` operations between raw event logs (Fact table) and ERC20 contract references (Dimension table).
  * Data Type Conversion: Utilizing `CAST` and mathematical operations `POWER()` to convert raw blockchain integers into human-readable decimals.

### 3. PEPE: Top 50 Token Holders
* **Folder:** [`/03_memecoin_holders`](./03_memecoin_holders/query.sql)
* **Objective:** Reconstruct current wallet balances from scratch to analyze token distribution and holder concentration.
* **SQL Concepts Highlighted:**
  * Advanced structuring using **CTEs (`WITH` clauses)**.
  * Combining datasets vertically using `UNION ALL`.
  * Applying double-entry bookkeeping logic (Inflows minus Outflows) to calculate standing balances dynamically.

---

## Tech Stack & Tools
* **Database Engine:** Trino SQL (Dune V2 Engine)
* **Concepts:** CTEs, Joins, Aggregation, Data Cleaning, Decimal Conversion.
* **Visualization:** Dune Analytics built-in charting (Bar charts, Stacked charts, Leaderboards).

---
*Created by [Deny Arya Setiawan](www.linkedin.com/in/deny-arya-setiawan-224831246) - Aspiring Database Programmer*
