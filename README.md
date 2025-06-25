# 🎬 Silver Screen: Movie Revenue & Rental Cost Analysis

## 📊 Project Overview

The **Silver Screen** project presents a complete data pipeline and analytical model built using **dbt Cloud** and **Snowflake**. As a BI Analyst for a leading entertainment company, I was tasked with evaluating the financial performance of three newly acquired theaters in New Jersey. The core objective was to analyze the relationship between movie rental costs and revenue generated from ticket sales across different locations.

## 🔍 Business Context

Although Silver Screen operates only three theaters, leadership required a detailed performance analysis at the movie-location-month level. This involved consolidating data from various sources to deliver insights into operational efficiency and profitability.

## 🧾 Data Sources

The data originated from five distinct sources, each with its own format and challenges:

- `movie_catalogue`: Metadata for movies rented in 2024.
- `invoices`: Monthly rental costs per movie per location.
- `nj_001`: Raw transaction logs for location #1.
- `nj_002`: Daily aggregated ticket sales from location #2.
- `nj_003`: Item-level sales from location #3 (included snacks, drinks, and tickets).

These sources were ingested and transformed to produce a unified analytical model.

## ⚙️ Engineering Highlights

- Cleaned and standardized movie metadata, including handling missing `genre` values by replacing them with `'Unknown'`.
- Parsed, filtered, and aggregated data from three locations with varying formats:
  - Extracted and aggregated timestamps in `nj_001`.
  - Transformed daily sales into monthly aggregates in `nj_002`.
  - Filtered non-ticket transactions and extracted embedded movie IDs in `nj_003`.
- Standardized naming across datasets to enable reliable joins.
- Integrated rental cost data using keys on `movie_id`, `month`, and `location`.

## 🧩 Final Model

A centralized fact table was created with the following structure:

| Column         | Description                                   |
|----------------|-----------------------------------------------|
| `movie_id`     | Unique identifier for each movie              |
| `movie_title`  | Title of the movie                            |
| `genre`        | Genre (cleaned and standardized)              |
| `studio`       | Studio that released the movie                |
| `month`        | Year and month of ticket sale and rental      |
| `location`     | Theater location (NJ_001, NJ_002, NJ_003)     |
| `rental_cost`  | Monthly rental cost for the movie             |
| `tickets_sold` | Number of tickets sold                        |
| `revenue`      | Total ticket revenue                          |

This table enables comprehensive analysis of movie performance across all dimensions.

## ✅ Testing and Documentation

- Source definitions and models documented using `dbt .yml` files.
- Included standard dbt tests:
  - `not_null` checks on critical fields.
  - Referential integrity between movies and invoices.
- A custom singular test validated that `revenue` is zero if `tickets_sold` is zero.
- All models pass `dbt build` with no warnings or errors.

## 🔁 Automation

A scheduled **dbt Cloud job** was configured to execute the pipeline end-to-end. Successful runs were validated with snapshot outputs and model timing.

## 📈 Results

The final dataset supports:
- Monthly profitability reports by movie and location.
- Studio-level genre performance comparisons.
- Optimization of rental contracts and programming schedules.

## 🛠️ Tech Stack

- **dbt Cloud** for transformation and modeling
- **Snowflake** as the data warehouse
- **SQL + Jinja** for model logic
- **GitHub** for version control and collaboration

## 🎥 Presentation

The project was presented live, demonstrating:
- Business context and goals
- DAG and dbt folder structure
- Key transformation strategies
- Model tests and documentation
- Execution of a successful `dbt build`

A recording of the presentation is available as part of the submission package.

---

📂 **All source files** (SQL models, `.yml`, lineage screenshots, and presentation) are included in the project repository and Google Drive folder for review.
