# Demand-Trend-Analysis-and-Transaction-Conversion-Rate-for-Providing-Better-Customer-Satisfaction

## Overview:

RLL.com is one of the largest business units in the RLL ecosystem (RLL.com, R-Connect, R-Agent) which operates as a Marketplace Platform where this platform connects users (buyers and sellers) for B2B business models in Indonesia. 3 main aspects that become important pillars in the RLL.com business process consist of Users, Items, and Transactions.  In meeting user needs, RLL categorizes the products provided based on the industry. 

When a buyer transacts at RLL.com, the buyer will be given a retail price or wholesale price depending on the purchased quantity. Buyers will get a cheaper price if they buy goods in large quantities or wholesale. RLL will receive revenue from the take rate (percentage commission) generated from a transaction according to the category of product that the seller is selling. 

RLL wants to develop its business by adjusting the target market by knowing the patterns in transactional data that are usually captured from year to year. For this adjustment, RLL must also pay attention to how user satisfaction in using its platform so that it is necessary to monitor transactions, one of which is by calculating the conversion rate of each process that users go through in transactions. 

## Objective:

1. Create a Data Product Canvas by filling in the important points obtained from the Project Description or Overview of RLL's PRD study case, including:
   - Objective Problems
   - Solution
   - Key Metrics
   - Methodology
   - User Segments
   - Data Source & Tools
   - Challenges
   - Expected Outcome
   - Business Benefit
2. Create a possible Business Flow using BPMN Diagram. E.g. Customer Journey at RLL.
3. Use Google Collaboratory to solve the objective problems that have created in previous tasks (business modeling). On this task, required to use python packages for Data Understanding and Data Preparation (Cleansing & Transformation). Point that needs to be met:
   - Data Description
   - Handling Missing Value
   - Handling Outliers
   - Data Transformation
   - Exploratory Data Analysis
4. Querying SQL to get these requested insights.
   - Corporate and Performance Monitoring
       - Stakeholders want to know the Top 5 Categories with the highest Revenue from all the data provided but it must be ensured that the data is non-refundable, so they can find out which categories are the most profitable in that period.
       - Stakeholders want to know the Top 5 Categories with the highest total transactions from all the data provided so that they can find out what categories are dominant buyers want in that period.
       - Stakeholders want to know the development trend of RLL.com's YoY GMV in Q1 2018, Q1 2019, and Q1 2020 for 4 categories that they want to prioritize: Agriculture & Food, Horeca, Machinery & Industrial Parts, Computer & Communication.
   - Product Manager
       - Stakeholders want to know the Success Order Rate for each order placed from the order stage placed by the buyer to the settlement stage processed by RLL internally (if the settlement_datetime timestamp value is NULL, then the student can use the timestamp on received_datetime).
   - Business Development Manager
       - Stakeholder wants to know the number of buyers based on Bucket Size, he divides the total buyers based on GMV and Total Transactions recorded in Q1 2018, Q1 2019, Q1 2020 with several groups to see what proportion of our buyers.
       - Stakeholders want to collaborate with fintech companies to facilitate users in transactions. Students are asked to do a comparison analysis of payments made via Bank Transfer, TOP, or e-Wallet. 
5. Interact with the database that RLL products have through data visualization and tell what insights have been obtained using Google Data Studio.
