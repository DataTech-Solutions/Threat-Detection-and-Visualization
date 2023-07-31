**Threat Detection (Vulnerabilities) and Viusalization Project**

The system is designed to detect vulnerabilities in different assets within the organization, remediate those vulnerabilities, and perform other related tasks. Here's a summary of the main criteria and components mentioned:
1. **Detecting Vulnerabilities and Remediation:** Vulnerabilities are detected from different assets in the organization using API configurations in Azure API Management, Postman, and Azure Data Factory Linked Services. These vulnerabilities are then remediated on a weekly basis.

2. **Maintaining and Updating ServiceNow Assets' Repository:** To ensure that the ServiceNow assets repository remains up to date, IPs from data sources are joined with ServiceNow Assets IPs. This process helps identify missing asset information in ServiceNow, and corrective actions can be taken accordingly.

3. **Weekly Auto-generation of ServiceNow Tickets:** ServiceNow tickets are automatically generated on a weekly basis whenever vulnerabilities are detected in the assets. This automated ticketing process streamlines the remediation efforts and helps the cyber team efficiently address the identified vulnerabilities.

4. **Data Storage in Azure Delta Lake:** Data from various sources, including the detected vulnerabilities, is stored in Azure Delta Lake's raw and staging zones as Parquet files. This data is cleansed and transformed, making it ready for further analysis and processing. Additionally, storing data in Azure Delta Lake provides backups and recovery options in case of data loss.

5. **Future Predictions on Vulnerability Trends:** The architecture leverages AzureML for future predictions on vulnerability trends. It also involves extracting information from PDF files to gather data for analysis.

   Regarding the upgrade to existing Azure SQL Database from SSMS to Serverless SQL Pool and Dedicated SQL Pool:

6. **Data Transformation using Serverless SQL Pool:** Serverless SQL Pool is used for data cleansing and transformation due to its cost-effectiveness. It provides a scalable option for managing data before it's inserted into the final tables.

7. **Final Data Insertion using Dedicated SQL Pool**: Dedicated SQL Pool is used for final data insertion into tables, including fact, dimension, and other tables. It provides the necessary performance and resources for handling higher data transformation work.

8.	**Scalability and Performance Considerations**: The architecture's design appears to consider scalability and performance factors to meet the organization's needs effectively.

**IMPORTANT :** SQL code shared has been written on Azure SQL Database in SSMS as the architecture before didnt have serverless and dedicated sql pool. Later the architecture got changed to meet several criteria (mentioned above). To upgrade the existing SQL coding to use Serverless SQL Pool and Dedicated SQL Pool, you will need to modify the SQL queries and stored procedures accordingly. You'll need to take into account the differences in syntax, capabilities, and performance characteristics between Serverless and Dedicated SQL Pools.Since the code is currently written for Azure SQL Database, you'll have to adapt it to be compatible with the specific features and functionalities offered by Serverless and Dedicated SQL Pools. Additionally, the cost implications and resource allocation between the two pool types should be taken into consideration to optimize the solution for data cleansing, transformation, and final data insertion.

![Threat Detection Architecture GIF](https://github.com/DataTech-Solutions/Threat-Detection-and-Visualization/assets/140796709/a2e40746-7389-4f29-a778-63b1fdd168cd)


