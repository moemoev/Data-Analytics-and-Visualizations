# 📊 Sales Analysis Dashboard – Northwind Traders

**End-to-End Data Analytics Project (SQL + Power BI)**

---

## 🧾 Project Overview

This project is an end-to-end data analysis solution for **Northwind Traders**, combining:

- 🗄️ PostgreSQL (via DBeaver) for data preparation  
- 📊 Power BI Desktop for modeling and visualization  

The goal is to build an interactive dashboard analyzing:

- Sales performance  
- Product trends  
- Employee performance  
- Customer and supplier insights  

---

## 🎯 Project Goals

✔ SQL-based data preparation  
✔ Star schema data modeling  
✔ DAX calculations and measures  
✔ Interactive Power BI dashboard  

---

## 🛠️ Tools Used

- PostgreSQL (Database)
- DBeaver (SQL development)
- Power BI Desktop (Visualization)

---

## 🧩 SQL Data Preparation

### 🔍 Tables Explored

- orders  
- order_details  
- products  
- categories  
- customers  
- employees  
- shippers  
- suppliers  

---

### 🧱 Created Views

#### 📦 v_Product_Enriched
Combines product, category, and supplier data:

- Product ID, Product Name  
- Category Name  
- Supplier Company Name (as `Supplier`)  
- Unit Price  

---

#### 💰 v_Order_Sales
Fact table combining orders and order details:

---

#### 🌍 v_Customer_Geo
Filtered customer geography data for geographic analysis:

- Active customers only  
- City  
- Country  

---

## 🧮 Data Modeling (Power BI)

- Star Schema design implemented  
- Fact table: `v_Order_Sales`  
- Dimension tables:
  - Customers
  - Products
  - Employees
  - Shippers
  - Date table (DAX generated)

### 🔄 Power Query Transformations

- Correct data types (Date, Currency, etc.)
- Renamed technical columns (e.g., `shipped_date` → `Shipping Date`)

---

## 📐 DAX Measures

Create a dedicated table: `_Measures`

### 📊 Core Metrics

- Total Revenue  
- Total Orders  
- Average Order Value (AOV)  
- Total Quantity Sold  

---

### ⏱️ Time Intelligence

- Revenue YTD  
- Revenue Previous Year  
- YoY Growth %  

---

### 💼 Business Logic

- % Discounted Revenue  
- Top 3 Products by Sales (TOPN / RANKX)

---

## 📈 Dashboard Pages

---

### 🟦 Page 1: Executive Overview

- KPI Cards:
  - Total Revenue
  - YoY Growth %
  - Total Orders
  - AOV
- Monthly Sales Trend (Current vs Previous Year)
- Sales by Country (Map)
- Sales by Shipper (Donut Chart)

---

### 🟩 Page 2: Products & Employees

- Top 10 Products by Revenue
- Decomposition Tree:
  - Category → Product → Customer
- Sales by Employee
- Filters:
  - Year
  - Category
  - Employee

---

### 🟥 Page 3: Drill-through Analysis

- Order-level detail view
- Customer + product breakdown
- Interactive drill-through navigation

---
