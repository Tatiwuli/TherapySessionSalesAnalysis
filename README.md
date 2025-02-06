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

The following datasets were cleaned and transformed in **Jupyter Notebook** . These final datasets were imported to Tableau for analysis:

- **Registration Dataset** 
    Changes: Added an **age column** for demographic analysis.  
- **Appointments Dataset** 
    Changes: Corrected `session_status` values and added `is_first_session` flag.  
- **Cancel Reschedule Dataset** (*Derived from Appointments Dataset*) 
    Changes:  Filtered all the canceled *free* sessions (sessions with `is_first_session` = 1) and identified their respective *rescheduled* sessions.
- **Purchase Dataset** (*Derived from Payments Dataset*)
    Changes: Added relevant purchase information ( first purchase identification, purchased package, and days between purchases) to the Payments dataset.
- **User Status Dataset** (*Derived from Appointments, Payments, and User Credits Dataset*)
    Changes: Calculated the users' last session and last purchase information and created a  `user_status` column, classifying users' status up to August 31,2024.

The following image illustrates how the datasets are conected in **Tableau** to generate metrics and visualizations.  
### Data Model 
![Tableau Design Overview](images\data-model.png)


---

## File Structure

### Data Collection
- **`sql_queries/`** – Contains SQL scripts used for extracting raw data.  

### Data Cleaning & Processing
- **`notebooks/`** – Jupyter Notebook containing **data cleanings and transformations**.  


---

## Key Results

The final insights are delivered via a **multi-page Tableau Dashboard**. 

To provide a **clear overview of the Tableau design**, I created a diagram that maps out the **dashboard pages** and the **business questions each page addresses**:
![Tableau Design Overview](images/miro-board.jpg)


Due to **data confidentiality**, I have compiled a summary of insights and recorded specific dashboard sections in a **Notion Page**.  
🔗**Access the summarized results here:** (https://cooing-parsley-1bb.notion.site/Tableau-Dashboard-Key-Results-191ecbc620b480378371f0f9fcd0f766?pvs=4)  

