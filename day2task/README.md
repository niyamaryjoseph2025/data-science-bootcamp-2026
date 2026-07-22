# Northwind Database — SQL & Pandas Analysis

**Epochs '26 — Assignment 2** | Tag: `#evn-ds-epochs26-day02`

## Database Overview

This project uses the classic **Northwind** sample database (SQLite version:
[jpwhite3/northwind-SQLite3](https://github.com/jpwhite3/northwind-SQLite3)),
which models a small trading company that imports/exports specialty foods.

Key tables used:

| Table | Purpose |
|---|---|
| `Orders` | One row per customer order (date, customer, employee, shipping info) |
| `Order Details` | Line items per order (product, quantity, unit price, discount) |
| `Products` | Product catalog (name, category, supplier, price) |
| `Categories` | Product category names |
| `Customers` | Customer company info |

Dataset scope: **830 orders** from **91 customers**, spanning **July 1996 – May 1998**.

## Business Questions Answered

1. What are the **top 10 selling products**?
2. Who are the **top 10 customers by revenue**?
3. What do **monthly sales trends** look like?
4. Which **product categories perform best**?
5. What is each customer's **purchase frequency**?

All queries live in [`queries.sql`](./queries.sql); the executed SQL + Pandas
analysis with charts lives in [`analysis.ipynb`](./analysis.ipynb).

## Sample Results

**Top 3 products by units sold:** Camembert Pierrot (1,577 units), Raclette
Courdavault (1,496 units), Gorgonzola Telino (1,397 units).

**Top 3 customers by revenue:** QUICK-Stop (~$110K), Ernst Handel (~$105K),
Save-a-lot Markets (~$104K).

**Top category by revenue:** Beverages (~$268K), followed by Dairy Products
(~$235K).

## Key Insights

1. **Volume leaders and revenue leaders diverge.** The best-selling product by
   quantity (Camembert Pierrot) is not the top revenue earner — Raclette
   Courdavault earns more (~$71K) from slightly fewer units, driven by a
   higher unit price.

2. **Customer revenue is concentrated in a small group.** The top 10
   customers make up a disproportionate share of total revenue, with the top
   3 alone contributing over $100K each — a key-account concentration risk.

3. **Overall sales trend upward** from ~$27K/month in mid-1996 to over
   $120K/month by April 1998, indicating healthy business growth over the
   observed period (the final month, May 1998, is partial and shouldn't be
   read as a decline).

4. **Beverages and Dairy Products drive the business**, together contributing
   roughly 45% of category revenue — inventory and marketing focus should
   weight toward these.

5. **Frequency and revenue don't always align.** Some top-revenue customers
   also order frequently (showing loyalty), while it's worth further
   investigating whether others are large-but-infrequent bulk buyers, since
   that changes how they should be managed.

## How to Reproduce

1. Open `analysis.ipynb` in Google Colab or Jupyter.
2. Upload `northwind2000.sqlite` alongside the notebook (or place it in the
   same directory in Colab).
3. Run all cells — the notebook connects via `sqlite3`, runs each query with
   `pandas.read_sql_query`, and renders charts with `matplotlib`.

## Repository Contents

- `queries.sql` — the 5 SQL analysis queries
- `analysis.ipynb` — SQL execution + Pandas exploratory analysis (with charts)
- `README.md` — this file
