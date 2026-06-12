English
---
# E-Commerce Olist Analysis

## Background & Overview

Olist is a Brazilian e-commerce company that connects marketplaces with thousands of sellers. This project analyzes the Olist e-commerce dataset using **SQL (PostgreSQL)** and **Power BI** to answer key business questions and evaluate important e-commerce metrics, including **Gross Merchandise Value (GMV)**, **Average Order Value (AOV)**, **Customer Lifetime Value (LTV)**, and **Cancellation Rate (CR)**.

### Tools & Technologies

- SQL (PostgreSQL)
- Power BI

📄 Click [here](/Scripts/) to view the SQL scripts.

📊 Click [here](/dashboard.pbix) to view the Power BI dashboard.

### Business Questions

1. What is the monthly Gross Merchandise Value (GMV) by seller and product category?
2. What is the Average Order Value (AOV) based on payment method, order status, and customer location?
3. Which customer segments generate the highest Customer Lifetime Value (LTV) based on order and payment history?
4. What is the Cancellation Rate (CR) by seller, product category, and order period?

### Key Findings

1. Home Comfort became the category with the highest GMV and showed strong growth from 2017 to 2018 ([See details](#1-high-customer-interest-in-home-comfort-products)).

2. In most cities with the highest AOV, credit card transactions had a higher average order value ([See details](#2-customers-prefer-credit-cards-for-transactions)).

3. Customers using credit cards had the highest LTV compared to other payment methods ([See details](#3-customers-using-credit-cards-have-higher-lifetime-value)).

4. The Cancellation Rate was relatively low and stable throughout the analysis period ([See details](#4-product-category-growth-and-stable-cancellation-rates)).

## Data Structure Overview

![ERD](/image/ERD.png)

**Source:**  
[E-commerce Dataset by Olist (SQLite)](https://www.kaggle.com/datasets/terencicp/e-commerce-dataset-by-olist-as-an-sqlite-database)

## Dashboard Overview

The dashboard highlights key e-commerce performance metrics. The ratio between **Customer Lifetime Value** and **Average Order Value** is approximately **6.1**, indicating that customers make repeat purchases over time. Additionally, the **average Cancellation Rate** remains relatively low, suggesting efficient operational processes, positive customer experiences, and limited revenue loss caused by order cancellations.

![dashboard](/image/dashboard.png)

## Insights Deep Dive

### 1. High Customer Interest in Home Comfort Products

![Gross Merchandise Value](/image/gmv.png)

The **Home Comfort** category contributed significantly to total sales value. Between **2017** and **2018**, the category generated a combined GMV of approximately **22M**, increasing from **7M** in 2017 to **15M** in 2018. This trend indicates growing customer demand for Home Comfort products.

### 2. Customers Prefer Credit Cards for High-Value Transactions

![Average Order Value](/image/aov.png)

In **4 out of the 5 cities** with the highest Average Order Value, customers primarily used **credit cards** as their preferred payment method. This suggests that customers tend to use credit cards for higher-value purchases. Voucher payments also contributed significantly to AOV in several cities.

### 3. Customers Using Credit Cards Have Higher Lifetime Value

![Lifetime Value](/image/ltv.png)

Customers who use **credit cards** generate the highest Customer Lifetime Value, demonstrating stronger long-term engagement and spending behavior. The second-highest segment consists of customers using **boleto**, a widely adopted payment method in Brazil.

### 4. Product Category Growth and Stable Cancellation Rates

![Cancellation Rate](/image/cr.png)

Product purchases increased steadily throughout the year, from approximately **1.5K orders (January–March)** to **1.7K orders (April–June)**, reaching a peak of **1.9K orders (July–August)**. Meanwhile, the Cancellation Rate remained stable, with only a slight increase in September and October, likely due to incomplete records.

## Recommendations

1. Focus on the **Home Comfort** category by increasing promotions, improving product visibility, and attracting more sellers within this segment.
2. Introduce **cashback offers**, **installment plans**, or **loyalty programs** for credit card users to improve customer retention and maximize customer value.
3. Replicate successful strategies from the top-performing cities in regions with lower AOV by implementing targeted promotions and analyzing local customer behavior and product preferences.

Indonesia
---
# E-Commerce Olist Analysis

## Background & Overview
Olist adalah perusahaan asal Brazil yang bergerak dalam bidang e-commerce, atau lebih detailnya bisnis mereka menyediakan sarana bagi pihak e-commerce tertentu dan berbagai seller. Disini Saya akan menganalisis sebuah dataset yang berasal dari perusahaan ini, project ini mencakup penerapan bahasa pemrograman **SQL** dan tool **Power BI** guna menganalisis 4 pertanyaan bisnis yang masing-masing berisi metrik pada bidang e-commerce/retail, diantaranya yaitu *Gross Merchandise Value* (GMV), *Average Order Value* (AOV), *Lifetime Value* (LTV), dan *Cancellation Rate* (CR)

### Tools & Technologies
- SQL (PostgreSQL)
- Power BI

📄 Klik [disini](/Scripts/) untuk melihat Script SQL  

📊  Klik [disini](/dashboard.pbix) untuk melihat Dashboard Power BI 
<br>
### Business Questions:
1. Berapa total Gross Merchandise Value (GMV) per bulan berdasarkan seller dan kategori produk?
2. Berapa Average Order Value (AOV) berdasarkan metode pembayaran, status order, dan lokasi customer?
3. Segmen customer mana yang memiliki Lifetime Value (LTV) tertinggi berdasarkan histori order dan pembayaran?
4. Berapa Cancellation Rate berdasarkan seller, kategori produk, dan periode order?


## Data Structure Overview
![ERD](/image/ERD.png)
Source: [E-commerce dataset by Olist (SQLite)](https://www.kaggle.com/datasets/terencicp/e-commerce-dataset-by-olist-as-an-sqlite-database?utm_source=chatgpt.com)

## Dashboard Overview
Dari kpi yang terlihat bahwa nilai dari **Customer Lifetime Value** per **Average Order Value**, itu menghasilkan **6.1**, ini menandakan semua customer memiliki rata-rata **repetisi pembelian kembali itu ada**, dan terlihat pada **average of cancellation rate** itu cukup rendah menjelaskan bahwa **proses operasional sangat baik**, **customer puas dengan produk**, **serta terhindarkan dari revenue yang hilang**

![dashboard](/image/dashboard.png)
## Key Findings
1. Home Comfort menjadi kategori dengan GMV tertinggi dan menunjukkan pertumbuhan yang kuat dari 2017 ke 2018 ([Lihat detail](#1-high-customer-interest-in-home-comfort-products)).

2. Pada sebagian besar kota dengan AOV tertinggi, transaksi credit card memiliki nilai order rata-rata lebih tinggi ([Lihat detail](#2-customers-prefer-credit-cards-for-transactions))

3. Customer pengguna credit card memiliki LTV tertinggi dibanding metode pembayaran lainnya ([Lihat detail](#3-customers-using-credit-cards-have-higher-lifetime-value))

4. Cancellation Rate relatif rendah dan stabil sepanjang periode analisis ([Lihat detail](#4-product-category-growth-and-stable-cancellation-rates))

## Insights Deep Dive
### 1. High Customer **Interest in Home Comfort Products**
![Gross Marchandise](/image/gmv.png)
Kategori product **Home Comfort** berkontribusi pada nilai kotor transaksi penjualan yang tinggi pada tahun terbaru, pada tahun **2017** hingga **2018** kontribusi product Home Comfort mencapai total **22M**, grafik pada tahun 2017 berkontribusi mencapai 7M dan **terus naik** mencapai 15M pada tahun 2018

### 2. Customers Prefer Credit Cards for Transactions
![Average Order Value](/image/aov.png)
Dari 4 dari 5 kota dengan penyumbang Average Order Value tertinggi memilih credit card sebagai metode pembayaran mereka, ini menunjukkan **customer lebih memakai credit card jika berkaitan dengan transaksi bernilai besar** meskipun begitu penggunaan voucher juga menyumbang cukup tinggi.

### 3. Customers Using Credit Cards Have Higher Lifetime Value
![Lifetime Value](/image/ltv.png)
Segmentasi customer yang memakai **credit card memiliki  peran yang sangat tinggi selama masa hubungan dengan bisnis**, diikuti oleh metode pembayaran boleto, sebagai metode pembayaran yang cukup banyak dipakai di brazil.

### 4. Product Category Growth and Stable Cancellation Rates
![Cancellation Rate](/image/cr.png)
Pembelian jumlah produk berdasarkan kategori naik cukup baik, dari **1.5K (January-March), 1.7K (April-June), dan dipuncaknya 1.9K (July-August)**, juga **cancellation rate sangat stabil** dan sedikit naik di bulan September dan October karena ada data yang tidak tercatat.

## Recommendations
1. Berfokus pada kategori product Home Comfort, dengan cara meningkatkan promosi, visibilitas dan seller yang terkait product dengan kategori ini.
2. Memberikan cashback atau cicilan khusus untuk para pengguna credit card, atau juga mungking melakukan program loyalty untuk mempertahankan mereka 
3. Replikasi strategi kota yang tidak masuk dalam top 5 kota AOV tertinggi, terapkan strategi pemasaran di kota-kota tersebut, lakukan promosi, analisis produk dan perilaku customernya.
