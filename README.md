# Booking and Sales Analysis of a Telemedicine App 

## Project Overview
I interned at a healthtech startup that provides a telemedicine app for B2B and B2C clients in Brazil and Canada. The app provides the following services:

- Online consultations with specialists across 12 medical fields
- Easy Access to Doctors' prescriptions
- User diagnosis and prescription history management, enabling seamless and secured data sharing across doctors for holistic treatments

In November 2023, the startup launched its app in Canada, initially offering therapy consultations only. In this new market, business executives and the marketing team lacked quantifiable benchmarks for user booking and purchase behaviors, limiting their ability to make data-driven decisions for resource allocation and marketing campaigns.

To address this, I analyzed data from 2,000 users, including their registrations, session bookings, purchased packages, and payments, to uncover key booking and purchase patterns.

---

## Key Areas of Analysis

- **Conversion Funnel** – Measuring user conversion rates at different user journey stages, including booking rate, first purchase rate, and repurchase rate.  
- **Registration to Booking** – Analyzing the booking rate, the average time between registration and first session, and behavioral differences across gender and age groups.  
- **First Session Behavior** – Examining free session completion,cancellation, and no-show rates, and behavioral differences across gender and age groups.
- **Purchase Patterns** – Analizing the purchase rate, purchase timings, Return of Investment, and the most purchased sessions packages. 
- **Repurchase Patterns** – Evaluating repurchase frequency, package upgrade trends, and churn and retention rates across different user segments.  

---

## Key Facts About the Userbase

- The analysis focuses on **users who registered in Canada**.  
- Covers registrations and Therapy Sessions from **November 1, 2023 – August 31, 2024**.  
- **All Canadian users receive one free session**, which can be rescheduled **if canceled at least two hours in advance**.  

---

## Data Sources

### Extracted from MySQL Database:
- **Registration Dataset** – User demographic details and registration date.  
- **Appointments Dataset** – All session records up to August 31, 2024.  
- **Doctors Sessions Dataset** – Doctor Id of all sessions up to August 31, 2024.
- **User Credits Dataset** – Users' session credit's status until August 31,2024

### Extracted from NoSQL Database:
- **Payments Dataset** – Transactional records of user purchases.  

---

## Processed & Derived Datasets

The following datasets were cleaned and transformed in **Jupyter Notebook**. These final datasets were imported to Tableau for analysis:

### 1️⃣ Registration Dataset

**Source:** Registration dataset
**Purpose:** Contains basic user information for demographic analysis and user segmentation.
**Processing:** Checked for null values, duplicates, and invalid entries before exporting to Tableau.
**Final Use:** Used for age and gender analysis and as a base dataset for joining transactions.

### 2️⃣ Appointments Dataset

**Source:** Appoinments dataset
**Purpose:** Stores all user sessions until the analysis cutoff date (August 31, 2024).
**Processing:**
   - Identified and handled null and duplicated values.
   - Reclassified session_status to distinguish between completed, canceled, and no-show sessions.
   - Created a `is_first_session` column to differentiate free and paid sessions.
**Final Use:** Used for analyzing user session behaviors, cancellations, and free trial engagement.

### 2.1 Cancel Rescheduled Dataset 

**Source:**  Appointments Dataset
**Purpose:** Tracks users who canceled their free session and whether they rescheduled.
**Processing:**
   - Created a `is_valid_cancel` column to classify cancellations as valid or invalid based on the cancellation time.
   - Merged session data with payment data to check if users rescheduled before purchasing a paid session.
   - Created `has_reschedule` collumn to indicate whether a user rescheduled their free session.
**Final Use**  Helps measure user engagement with free trial

### 3️⃣ Purchase Dataset 
**Source:** Payments dataset
**Purpose:**  Stores all user payment transactions.
**Processing:** 
- Created `package` column that show the number of sessions purchased by each user
- Created `purchase_position` column that indicates a purchase's position in all purchases of a user. It helps identifies first-time and repeated purchases.
- Created `days_between_purchases` column to measures time intervals between purchases.
**Final Use:** Used to analyze user retention, package preference, and purchase patterns.

### 4️⃣ User Status Dataset

**Source:** Appointments and Payments dataset
**Purpose:** Classifies users into status categories based on their last purchase and credit balance as of the analysis cutoff date (August 31, 2024.)
**Processing:**
- Exploratory analysis on days_between_purchases to establish criterias for user status classification.
- Created `last_purchase_date` column to  track user's last purchase
- Created `has_credits` column to identify if the user has remaining session credits.
- Use the new colums to classify user's status.
**Final Use:** Used to track retention, churn, and identify users for targeted engagement strategies.


The following image illustrates how the datasets are conected in **Tableau** to generate metrics and visualizations.  

### Data Model 
![Tableau Design Overview](images\data-model.png)


---

## File Structure
```
/repository
│── notebooks/
│   ├── data_cleaning_transformation.ipynb 
│── images/
│── sql_queries/
    ├── appointments_data_query
    ├── doctors_sessions_data_query
    ├── registration_data_query
    ├── user_credits_data_query
│── README.md
│── requirements.txt   
```

---

## Key Results

The final insights are delivered via a **multi-page Tableau Dashboard**. 

To provide a **clear overview of the Tableau design**, I created a diagram that maps out the **dashboard pages** and the **business questions each page addresses**:
![Tableau Design Overview](images/miro-board.jpg)


Due to **data confidentiality**, I have compiled a summary of insights and recorded specific dashboard sections in a **Notion Page**.  

🔗**Access the summarized results here:** [Link](https://cooing-parsley-1bb.notion.site/Tableau-Dashboard-Key-Results-191ecbc620b480378371f0f9fcd0f766?pvs=4)  

