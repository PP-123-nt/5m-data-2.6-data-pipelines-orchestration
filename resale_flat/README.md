Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


<br>

### 📌📌 Example Folder
*   remove 2 default views: `my_first_dbt_model` and `my_second_dbt_model`
*   remove `my_first_dbt_model` and `my_second_dbt_model` default content in schema.yml file

<br>

### 🧭 Datasets and New Tables

`floor_area_sqm` and `resale_price` are stored as `STRING` in `public_resale_flat_prices_from_jan_2017` created by Meltano
<br>

<img width="434" height="488" alt="image" src="https://github.com/user-attachments/assets/2fd58a88-4914-43f6-8536-cb39a6deef75" />

<br>

> **The two models we will build:**
> - `prices.sql` — cleans the raw table: casts numeric columns from STRING to NUMERIC and adds a calculated `price_per_sqm` column
> - `prices_by_town_type_model.sql` — aggregates the cleaned data by town, flat type and flat model to produce average prices per segment, useful for dashboards and analysis

Create the following files inside the `resale_flat/models/` folder:

> 1. Create a `source.yml` which points to the `resale` schema and `public_resale_flat_prices_from_jan_2017` table.
> 2. Create a `prices.sql` model (materialized table) which selects all columns from the source table, cast the `floor_area_sqm` to numeric, then add a new column `price_per_sqm` which is the `resale_price` divided by `floor_area_sqm`.
> 3. Create a `prices_by_town_type_model.sql` model (materialized table) which selects the `town`, `flat_type` and `flat_model` columns from `prices`, group by them and calculate the average of `floor_area_sqm`, `resale_price` and `price_per_sqm`. Finally, sort by `town`, `flat_type` and `flat_model`.


<img width="793" height="439" alt="image" src="https://github.com/user-attachments/assets/4d345e41-f821-4ef2-b3c9-24a613485787" />

<br>
<img width="867" height="523" alt="image" src="https://github.com/user-attachments/assets/50f21276-ae9c-4df4-9579-c7168fdcf20d" />

<br>
<img width="601" height="1009" alt="image" src="https://github.com/user-attachments/assets/c56b138e-21ed-4a28-898e-a52d1065d4ff" />
