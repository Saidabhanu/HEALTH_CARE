# 🏥 Healthcare Patient & Appointment Analytics

## 📌 Project Overview

This project focuses on analyzing healthcare patient and appointment data to identify useful insights related to **patients, medical conditions, admissions, test results, billing amounts, length of stay, and demographics**.

The project includes **Data Cleaning, Exploratory Data Analysis (EDA), SQL Analysis, and an interactive Power BI Dashboard**.

The goal is to transform raw healthcare data into meaningful insights that can support better understanding of patient trends and hospital operations.

---

## 🎯 Objectives

* Clean and preprocess the healthcare dataset.
* Perform Exploratory Data Analysis using Python.
* Analyze patient and hospital data using SQL.
* Identify trends in medical conditions and admissions.
* Analyze billing amounts and length of hospital stay.
* Understand patient demographics.
* Create an interactive Power BI dashboard.
* Present healthcare insights using visualizations and KPIs.

---

## 🗂️ Dataset

The original dataset contained approximately **50,000 patient records**.

### Important columns

* Patient information
* Age
* Gender
* Blood Type
* Medical Condition
* Date of Admission
* Discharge Date
* Admission Type
* Doctor
* Hospital
* Insurance Provider
* Billing Amount
* Room Number
* Test Results
* Medication

During data cleaning, unnecessary columns and invalid records were removed to prepare the dataset for analysis.

---

# 🔹 1. Data Cleaning & EDA

Python was used for data cleaning and Exploratory Data Analysis.

### Tools Used

* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* Jupyter Notebook

### Data Cleaning Steps

* Checked dataset shape and data types.
* Checked missing values.
* Removed unnecessary columns.
* Converted date columns into appropriate date formats.
* Handled missing discharge dates.
* Calculated Length of Stay.
* Identified negative billing amounts.
* Removed invalid billing records.
* Checked duplicate records.
* Verified the cleaned dataset before analysis.

### Important Cleaning Results

* Original dataset: approximately **49,992 records**
* After removing unnecessary columns and handling missing discharge dates: **6,931 records**
* After removing invalid negative billing amounts: **6,918 records**
* Final cleaned dataset was used for SQL and Power BI analysis.

### EDA Performed

The following areas were analyzed:

* Patient demographics
* Gender distribution
* Age distribution
* Medical conditions
* Admission types
* Test results
* Billing amounts
* Length of hospital stay
* Patient distribution by medical condition
* Relationship between healthcare-related variables

---

# 🔹 2. SQL Analysis

MySQL was used to perform structured analysis on the cleaned healthcare dataset.

### Tools Used

* MySQL
* MySQL Workbench

### Database

```sql
healthcare_analysis_db
```

### Table

```sql
healthcare_cleaned
```

### SQL Analysis Performed

* Total number of patients
* Patient distribution by gender
* Patient distribution by medical condition
* Patient distribution by admission type
* Test result analysis
* Average billing amount
* Maximum and minimum billing amount
* Average length of stay
* Length of stay analysis
* Medical condition-wise analysis
* Admission type-wise analysis
* Aggregation using `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`
* Grouping using `GROUP BY`
* Filtering using `WHERE`
* Sorting using `ORDER BY`
* Conditional analysis using `CASE`
* Date-based analysis

### Example SQL Query

```sql
SELECT 
    Medical_Condition,
    COUNT(*) AS Total_Patients
FROM healthcare_cleaned
GROUP BY Medical_Condition
ORDER BY Total_Patients DESC;
```

This query helps identify the number of patients for each medical condition.

---

# 🔹 3. Power BI Dashboard

An interactive **Healthcare Analytics Dashboard** was created using Power BI.

### Tools Used

* Power BI
* Power Query
* DAX

### Dashboard Includes

#### 📊 KPI Cards

* Total Patients
* Average Billing Amount
* Average Length of Stay
* Total Medical Conditions

#### 📈 Visualizations

* Patients by Medical Condition
* Patients by Admission Type
* Patients by Gender
* Patients by Test Results
* Billing Analysis
* Length of Stay Analysis
* Patient demographic analysis

#### 🔎 Interactive Features

* Slicers
* Filters
* Drill-through
* Interactive charts
* KPI cards

The dashboard allows users to interact with the data and explore different healthcare trends.

---

# 📊 Key Insights

Some important findings from the analysis include:

* The dataset contains patients across multiple medical conditions.
* The major medical conditions include **Arthritis, Asthma, Cancer, Diabetes, Hypertension, and Obesity**.
* Admission types include **Elective, Urgent, and Emergency**.
* Test results are categorized into **Normal, Abnormal, and Inconclusive**.
* Average patient length of stay was approximately **15.5 days**.
* Invalid negative billing amounts were identified and removed during data cleaning.
* The cleaned dataset was used consistently for SQL analysis and Power BI visualization.

---

# 🛠️ Technologies Used

| Category        | Tools               |
| --------------- | ------------------- |
| Programming     | Python              |
| Data Analysis   | Pandas, NumPy       |
| Visualization   | Matplotlib, Seaborn |
| Database        | MySQL               |
| BI & Dashboard  | Power BI            |
| Query Tool      | MySQL Workbench     |
| Development     | Jupyter Notebook    |
| Version Control | Git & GitHub        |

---

# 📁 Project Structure

```text
health_care_analysis/
│
├── README.md
│
├── data/
│   └── healthcare_cleaned.csv
│
├── EDA/
│   └── healthcare_EDA.ipynb
│
├── SQL/
│   └── healthcare_analysis.sql
│
├── PowerBI/
│   └── healthcare_dashboard.pbix
│
└── screenshots/
    └── dashboard.png
```

---

# 🚀 Project Workflow

```text
Raw Healthcare Dataset
        ↓
Data Cleaning
        ↓
Exploratory Data Analysis
        ↓
Cleaned Dataset
        ↓
MySQL Database
        ↓
SQL Analysis
        ↓
Power BI
        ↓
Interactive Healthcare Dashboard
        ↓
Healthcare Insights
```

---

# 💡 Skills Demonstrated

This project demonstrates practical knowledge of:

* Data Cleaning
* Exploratory Data Analysis
* Python for Data Analysis
* Pandas & NumPy
* SQL
* MySQL
* Data Visualization
* Power BI
* Power Query
* DAX
* KPI Creation
* Dashboard Development
* Data Interpretation
* Business/Healthcare Analytics

---

# 👩‍💻 Author

**Shaik Saida Banu**

B.Tech – Computer Science Engineering (Artificial Intelligence)

Aspiring Data Analyst | Python | SQL | Power BI | Data Analytics
