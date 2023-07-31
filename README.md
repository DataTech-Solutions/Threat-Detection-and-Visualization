**Threat (Vulnerabilities) Detection and Remediation Visualization Project**

![Threat Detection Architecture GIF](https://github.com/DataTech-Solutions/Threat-Detection-and-Visualization/assets/140796709/e0583c03-0c7d-42c8-9609-b831aa65f0bc)



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

**Tenable.sc Data Sources Explanation:**    
TENABLE.SC: On-premises vulnerability management platform.   
TENABLE.IO: Cloud-based vulnerability management platform.   
SIEM: Security information and event management for centralized log analysis.   
SCCM: Configuration management and software deployment for Windows systems.   
DEFENDER: Microsoft's endpoint protection and antivirus solution.   
SERVICE NOW: IT service management and ticketing system for streamlining workflows.   
ACTIVE DIRECTORY: Directory service for user authentication and centralized management in Windows environments.   

**TENABLE.SC Data fields Explanation** (as this is the most important data source acting as PARENT and the other data sources IPs are linked to Tenable.sc)

[IP]: IP address of the asset being assessed.   
[PORT]: Port number associated with the vulnerability.   
Protocol: The communication protocol used for the vulnerability.   
Plugin: Unique identifier for the vulnerability plugin.   
DNSName: Domain Name System (DNS) name of the asset.   
NetBIOSName: NetBIOS name of the asset.   
HostName: Hostname of the asset.   
RepositoryID: Identifier for the vulnerability repository.   
MACAddress: Media Access Control (MAC) address of the asset.   
severity: Severity level of the vulnerability.   
SeverityID: Identifier for the vulnerability severity level.   
SeverityName: Name of the vulnerability severity level.   
SeverityDescription: Description of the vulnerability severity level.   
MitigatedFlag: Indicates if the vulnerability has been mitigated.   
RiskAccepted: Indicates if the risk associated with the vulnerability has been accepted.   
RiskRecasted: Indicates if the risk assessment has been recast.   
PluginName: Name of the vulnerability plugin.   
Exploit: Indicates if there is a known exploit for the vulnerability.   
ExploitEase: Indicates the ease of exploitation for the vulnerability.         
ExploitFrameworks: Lists frameworks associated with the vulnerability exploit.   
Synopsis: Summary description of the vulnerability.   
SeeAlso: Additional references or related information for the vulnerability.   
RiskFactor: Indicates the risk factor of the vulnerability.   
StigSeverity: Severity level according to Security Technical Implementation Guide (STIG) standards.   
VulnerabilityPriorityRating: Priority rating assigned to the vulnerability.   
vprContext: Context information for the Vulnerability Priority Rating (VPR).   
CVSSV2BaseScore: Base score for the Common Vulnerability Scoring System (CVSS) version 2.   
CVSSV2TemporalScore: Temporal score for CVSS version 2.   
CVSSV2Vector: Vector string for CVSS version 2.   
CVSSV3BaseScore: Base score for CVSS version 3.   
CVSSV3Vector: Vector string for CVSS version 3.   
CPE: Common Platform Enumeration identifier for the vulnerability.   
BID: Bugtraq ID associated with the vulnerability.   
CheckType: Type of vulnerability check performed.   
[Version]: Version number for the vulnerability.   
PluginOutput: Output generated by the vulnerability plugin.   
OperatingSystem: Operating system information of the asset.   
RiskRecastedRuleComment: Comment for the recasted risk rule.   
RiskAcceptedRuleComment: Comment for the accepted risk rule.   
FamilyID: Identifier for the vulnerability family.   
FamilyName: Name of the vulnerability family.   
FamilyType: Type of the vulnerability family.   
RepositoryName: Name of the vulnerability repository.   
RepositoryDescription: Description of the vulnerability repository.   
pluginInfo: Information about the vulnerability plugin.   
CVEID: Common Vulnerabilities and Exposures (CVE) identifier for the vulnerability.   
[Description]: Detailed description of the vulnerability.   
Solution: Recommended solution for addressing the vulnerability.   
PluginPublicationDate: Date when the vulnerability plugin was published.   
FirstDiscoveredDATE: Date when the vulnerability was first discovered.   
LastObservedDATE: Date when the vulnerability was last observed.   
VulnPublicationDate: Date when the vulnerability was published.   
PatchPublicationDate: Date when the patch for the vulnerability was published.   
PluginModificationDate: Date when the vulnerability plugin was last modified.   
GroupCompany: Company or group associated with the vulnerability assessment.   
RecordType: Type of the vulnerability record.   
DMZindicator: Indicates if the asset is in a Demilitarized Zone (DMZ).   
[ComplianceGroup]: Grouping information related to compliance.   
[ISOIndicator]: Indicates if the asset is related to ISO standards.   
[NESAIndicator]: Indicates if the asset is related to National Electronic Security Authority (NESA) standards.   
[class]: Classification of the vulnerability.   
[Category]: Category information for the vulnerability.   
[Technology]: Technology associated with the vulnerability.   

**ServiceNow Fields:**
[u_business_criticality_display_value]: Business criticality level of the configuration item.   
[u_application_details_display_value]: Details of the associated application (if applicable).   
[ip_address_display_value]: Display value of the IP address associated with the configuration item.   
[mac_address_display_value]: Display value of the MAC address associated with the configuration item.   
[dns_domain_display_value]: Display value of the DNS domain associated with the configuration item.   
[name_display_value]: Display value of the name of the configuration item.   
[serial_number_display_value]: Display value of the serial number of the configuration item.   
[asset_display_value]: Display value of the asset tag or label assigned to the configuration item.   
[u_server_type_display_value]: Display value of the server type of the configuration item.   
[u_classification_display_value]: Display value of the classification category of the configuration item.   
[u_device_type_display_value]: Display value of the device type of the configuration item.   
[category_display_value]: Display value of the category of the configuration item.   
[subcategory_display_value]: Display value of the subcategory of the configuration item.   
[owned_by_display_value]: Display value of the person or team responsible for the configuration item.   
[company_display_value]: Display value of the company associated with the configuration item.   
[u_opco_display_value]: Display value of the operating company of the configuration item.   
[support_group_display_value]: Display value of the IT support group responsible for the configuration item.   
[u_building_display_value]: Display value of the building location of the configuration item.   
[u_floor_display_value]: Display value of the floor location of the configuration item.   
[u_room_display_value]: Display value of the room location of the configuration item.   
[u_subscriber_company_display_value]: Display value of the subscriber company associated with the configuration item.   
[u_business_service_display_value]: Display value of the business service supported by the configuration item.   
[u_operational_status_display_value]: Display value of the operational status of the configuration item.   
[department_display_value]: Display value of the department or business unit owning or using the configuration item.   





