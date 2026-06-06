# E-Commerce Olist Analysis

## Background & Overview
Olist adalah perusahaan asal Brazil yang bergerak dalam bidang e-commerce, atau lebih detailnya bisnis mereka menyediakan sarana bagi pihak e-commerce tertentu dan berbagai seller. Disini Saya akan menganalisis sebuah dataset yang berasal dari perusahaan ini, project ini mencakup penerapan bahasa pemrograman **SQL** dan tool **Power BI** guna menganalisis 4 pertanyaan bisnis yang masing-masing berisi metrik pada bidang e-commerce/retail, diantaranya yaitu *Gross Merchandise Value* (GMV), *Average Order Value* (AOV), *Lifetime Value* (LTV), dan *Cancellation Rate* (CR)

### Tools & Technologies
- SQL (PostgreSQL)
- Power BI
<br> <br>

Klik disini untuk melihat Script SQL ([lihat](/Scripts/)) 
<br>
<br>
Klik disini untuk melihat Dashboard Power BI ([lihat](/dashboard.pbix))

### Business Questions:
1. Berapa total Gross Merchandise Value (GMV) per bulan berdasarkan seller dan kategori produk?
2. Berapa Average Order Value (AOV) berdasarkan metode pembayaran, status order, dan lokasi customer?
3. Segmen customer mana yang memiliki Lifetime Value (LTV) tertinggi berdasarkan histori order dan pembayaran?
4. Berapa Cancellation Rate berdasarkan seller, kategori produk, dan periode order?


## Data Structure Overview
![ERD](/image/ERD.png)
Source: [E-commerce dataset by Olist (SQLite)](https://www.kaggle.com/datasets/terencicp/e-commerce-dataset-by-olist-as-an-sqlite-database?utm_source=chatgpt.com)

## Key Findings
1. Home Comfort menjadi kategori dengan GMV tertinggi dan menunjukkan pertumbuhan yang kuat dari 2017 ke 2018.
   - [Lihat detail](#1-high-customer-interest-in-home-comfort-products)

2. Pada sebagian besar kota dengan AOV tertinggi, transaksi credit card memiliki nilai order rata-rata lebih tinggi.
   - [Lihat detail](#2-customers-prefer-credit-cards-for-transactions)

3. Customer pengguna credit card memiliki LTV tertinggi dibanding metode pembayaran lainnya.
   - [Lihat detail](#3-customers-using-credit-cards-have-higher-lifetime-value)

4. Cancellation Rate relatif rendah dan stabil sepanjang periode analisis.
   - [Lihat detail](#4-product-category-growth-and-stable-cancellation-rates)

## Insights
Dari kpi yang terlihat bahwa nilai dari **Customer Lifetime Value** per **Average Order Value**, itu menghasilkan **6.1**, ini menandakan semua customer memiliki rata-rata **repetisi pembelian kembali itu ada**, dan terlihat pada **average of cancellation rate** itu cukup rendah menjelaskan bahwa **proses operasional sangat baik**, **customer puas dengan produk**, **serta terhindarkan dari revenue yang hilang**
<br> <br>
![dashboard](/image/dashboard.png)
## Insights Deep Dive
1. High Customer **Interest in Home Comfort Products**
![Gross Marchandise](/image/gmv.png)
Kategori product **Home Comfort** berkontribusi pada nilai kotor transaksi penjualan yang tinggi pada tahun terbaru, pada tahun **2017** hingga **2018** kontribusi product Home Comfort mencapai total **22M**, grafik pada tahun 2017 berkontribusi mencapai 7M dan **terus naik** mencapai 15M pada tahun 2018
2. Customers Prefer Credit Cards for Transactions
![Average Order Value](/image/aov.png)
Dari 4 dari 5 kota dengan penyumbang Average Order Value tertinggi memilih credit card sebagai metode pembayaran mereka, ini menunjukkan **customer lebih memakai credit card jika berkaitan dengan transaksi bernilai besar** meskipun begitu penggunaan voucher juga menyumbang cukup tinggi.
3. Customers Using Credit Cards Have Higher Lifetime Value
![Lifetime Value](/image/ltv.png)
Segmentasi customer yang memakai **credit card memiliki  peran yang sangat tinggi selama masa hubungan dengan bisnis**, diikuti oleh metode pembayaran boleto, sebagai metode pembayaran yang cukup banyak dipakai di brazil.
4. Product Category Growth and Stable Cancellation Rates
![Cancellation Rate](/image/cr.png)
Pembelian jumlah produk berdasarkan kategori naik cukup baik, dari **1.5K (January-March), 1.7K (April-June), dan dipuncaknya 1.9K (July-August)**, juga **cancellation rate sangat stabil** dan sedikit naik di bulan September dan October karena ada data yang tidak tercatat.
## Recommendations
1. Berfokus pada kategori product Home Comfort, dengan cara meningkatkan promosi, visibilitas dan seller yang terkait product dengan kategori ini.
2. Memberikan cashback atau cicilan khusus untuk para pengguna credit card, atau juga mungking melakukan program loyalty untuk mempertahankan mereka 
3. Replikasi strategi kota yang tidak masuk dalam top 5 kota AOV tertinggi, terapkan strategi pemasaran di kota-kota tersebut, lakukan promosi, analisis produk dan perilaku customernya.