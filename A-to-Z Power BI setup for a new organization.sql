A-to-Z Power BI setup for a new organization
1. Architecture — decide the target model first
Before creating anything, define:

Microsoft Entra ID
       │
       ├── Power BI / Fabric Tenant
       │
       ├── Security Groups
       │
       ├── Users / Admins
       │
       └── Service Principals
                │
                ▼
        Fabric / Power BI
                │
       ┌────────┼────────┐
       ▼        ▼        ▼
   Workspaces  Capacity  Gateways
       │                    │
       ▼                    ▼
 Semantic Models       SQL / SAP BW /
       │                Files / SSAS /
       ▼                On-prem Sources
    Reports
       │
       ▼
     Apps
       │
       ▼
    Business Users

You want this architecture agreed before users start creating random workspaces and reports.

2. Microsoft Entra ID
Power BI/Fabric operates within the organization's Microsoft Entra tenant. 
M
Microsoft Learn

Set up groups rather than managing everything user-by-user.

Recommended groups:

PBI-Platform-Admins
PBI-Capacity-Admins
PBI-Gateway-Admins
PBI-Developers
PBI-Workspace-Admins
PBI-Report-Consumers
PBI-Security-Admins
PBI-Deployment-Admins
PBI-External-Users

For each group define:

Owner

Members

Purpose

Approval process

Review frequency

Who can add/remove members

Also consider service principals for automation/deployment scenarios.

3. Power BI / Fabric tenant
Set up the Fabric tenant and establish the tenant's region/data location appropriately.

Then configure the Fabric admin portal.

Tenant settings are particularly important because they control which Power BI/Fabric capabilities are available and to whom. Microsoft recommends reviewing, deciding, documenting, managing, and auditing tenant settings rather than simply enabling everything. 
M
Microsoft Learn

Create a tenant-settings register:

Setting	Status	Allowed group	Owner	Review
Export data	Defined	Security group	Admin	Quarterly
Publish to web	Defined	Restricted	Admin	Quarterly
External sharing	Defined	Restricted	Security	Quarterly
Service principals	Defined	Deployment group	Admin	Quarterly
Custom visuals	Defined	Approved group	Admin	Quarterly

Don't blindly enable every feature.

4. Licensing
Decide what users actually need.

Typical model:

Administrators       → Pro / appropriate Fabric licensing
Developers            → Pro / appropriate Fabric licensing
Power BI consumers    → Free where capacity/licensing permits
Advanced users        → PPU where required
Enterprise workloads  → Fabric capacity

Microsoft currently describes Fabric/Power BI licensing in terms of per-user licenses and capacity. 
M
Microsoft Learn

For a new company, also decide whether users are allowed to:

Start trials

Self-purchase licenses

Request licenses

Create Fabric trials

Create their own workspaces

Self-service purchasing should be aligned with the company's procurement, security, compliance, and cost-control policies. 
M
Microsoft Learn

5. Azure subscription
If you're using Fabric capacity, establish:

Azure Tenant
   │
   └── Azure Subscription
          │
          └── Resource Group
                 │
                 └── Fabric Capacity

Define:

Tenant settings are particularly important because they control which Power BI/Fabric capabilities are available and to whom. Microsoft recommends reviewing, deciding, documenting, managing, and auditing tenant settings rather than simply enabling everything. 
M
Microsoft Learn

Create a tenant-settings register:

Setting	Status	Allowed group	Owner	Review
Export data	Defined	Security group	Admin	Quarterly
Publish to web	Defined	Restricted	Admin	Quarterly
External sharing	Defined	Restricted	Security	Quarterly
Service principals	Defined	Deployment group	Admin	Quarterly
Custom visuals	Defined	Approved group	Admin	Quarterly

4. Licensing
Typical model:

Administrators       → Pro / appropriate Fabric licensing
Developers            → Pro / appropriate Fabric licensing
Power BI consumers    → Free where capacity/licensing permits
Advanced users        → PPU where required
Enterprise workloads  → Fabric capacity

For a new company, also decide whether users are allowed to:

Self-service purchasing should be aligned with the company's procurement, security, compliance, and cost-control policies.

5. Azure subscription
Subscription owner

Subscription contributors

Billing owner

Resource group owner

Tags

Cost center

Environment

Business owner

Technical owner

Fabric F SKUs can be purchased through an Azure subscription or CSP. 
M
Microsoft Learn

6. Fabric capacity
This is the part we were discussing earlier.

Before creating capacity:

Check exemption
Determine whether an exemption is required.

If an existing exemption/reservation exists:

Is it active?
     │
   Yes → continue
     │
    No
     ↓
Validate new reservation
     ↓
Confirm Fabric deployment
     ↓
Create/renew reservation

Reservation
Confirm:

Subscription

Subscription owner

Reservation

Term

Capacity requirement

Cost center

Approval

Expiration

Resource group
Check whether an existing resource group can be used.

If new:

Create RG

Apply mandatory tags

Confirm ownership

Confirm region

Capacity
Then create/configure:

Fabric capacity SKU

Region

Capacity name

Administrators

Access

Workspaces assigned to capacity

After deployment, monitor utilization and scale according to workload. Microsoft provides Fabric capacity monitoring and capacity planning guidance. 
M
Microsoft Learn

7. Power BI/Fabric administrator model
Don't give everyone Fabric Administrator.

Define responsibilities such as:

Tenant Admin
    ↓
Capacity Admin
    ↓
Workspace Admin
    ↓
Gateway Admin
    ↓
Developer
    ↓
Consumer

Fabric supports delegated administration across scopes such as tenant, capacity, and workspace. 
M
Microsoft Learn

Create an ownership matrix:

Area	Primary owner	Backup
Tenant		
Capacity		
Gateway		
Security		
Workspace		
Data source		
Deployment		
Support		

8. Workspaces
Don't let every developer create arbitrary workspaces.

Define a naming standard.

For example:

PBI-DEV-Finance
PBI-TEST-Finance
PBI-PROD-Finance

PBI-DEV-Sales
PBI-TEST-Sales
PBI-PROD-Sales

Or organize around business domains:

Finance
Sales
HR
Operations
Supply Chain
Marketing
IT

Define:

Workspace owner

Admin

Members

Contributors

Viewers

Capacity

Domain

Sensitivity

Business owner

9. Workspace roles
Understand the difference between:

Admin

Member

Contributor

Viewer

Check whether an existing resource group can be used.

If new:

Capacity
Then create/configure:

Fabric capacity SKU

Region

Capacity name

Administrators

Access

Workspaces assigned to capacity

After deployment, monitor utilization and scale according to workload. Microsoft provides Fabric capacity monitoring and capacity planning guidance.

7. Power BI/Fabric administrator model
Define responsibilities such as:

Use groups instead of individual users wherever practical.

Example:

Finance Workspace

Admin:
PBI-Finance-Admins

Member:
PBI-Finance-Developers

Viewer:
PBI-Finance-Consumers

This makes employee joiner/mover/leaver management much easier.

10. Development / Test / Production
For enterprise Power BI, establish environments:

DEV
 ↓
TEST/UAT
 ↓
PROD

Don't have developers directly overwrite production content.

Use appropriate lifecycle/deployment tooling such as deployment pipelines and/or Git-based workflows depending on your development model.

Microsoft specifically recommends planning lifecycle management, repositories, and deployment processes as part of the implementation. 
M
Microsoft Learn

11. Git integration
For development teams, establish source control where appropriate.

For example:

GitHub / Azure DevOps
          │
          ▼
       DEV
          │
          ▼
        TEST
          │
          ▼
        PROD

Define:

Area	Primary owner	Backup
Tenant		
Capacity		
Gateway		
Security		
Workspace		
Data source		
Deployment		
Support		

8. Workspaces
Or organize around business domains:

Finance
Sales
HR
Operations
Supply Chain
Marketing
IT

Define:

Workspace owner

Admin

Members

Contributors

Viewers

Capacity

Domain

Sensitivity

Business owner

9. Workspace roles
Admin

Member

Contributor

Viewer

Use groups instead of individual users wherever practical.

Repository

Branching strategy

Pull requests

Code review

Deployment approvals

Service connections

Secrets

Release process

This becomes especially useful for Power BI/Fabric development involving notebooks, pipelines, semantic models, and other source-controlled artifacts.

12. Data gateways — very important
This is one of the biggest areas in an enterprise Power BI implementation.

A gateway is needed when the Power BI/Fabric service needs to reach data that isn't directly accessible from the cloud. The standard on-premises gateway is locally installed Windows software and uses outbound communication rather than requiring inbound ports into the network. 
M
Microsoft Learn
+1

Gateway types
Current Microsoft documentation identifies:

12. Data gateways — very important
This is one of the biggest areas in an enterprise Power BI implementation.

A gateway is needed when the Power BI/Fabric service needs to reach data that isn't directly accessible from the cloud. The standard on-premises gateway is locally installed Windows software and uses outbound communication rather than requiring inbound ports into the network.

Gateway types
Current Microsoft documentation identifies:

On-premises data gateway — standard mode

On-premises data gateway — personal mode

Virtual network (VNet) data gateway 
M
Microsoft Learn

For an organization, standard mode is generally the enterprise model when centrally managing shared connections.

13. Gateway architecture
Don't install one gateway on someone's laptop.

For production:

             Power BI / Fabric
                    │
                    ▼
             Gateway Cluster
             ┌──────────────┐
             │ Gateway 01   │
             │ Gateway 02   │
             └──────────────┘
                    │
       ┌────────────┼────────────┐
       ▼            ▼            ▼
    SQL Server    SAP BW       SSAS

Gateway clusters provide high availability and load balancing. Microsoft currently allows up to 10 gateway members in a cluster, with failover when the primary gateway isn't available. 
M
Microsoft Learn

For critical production environments:

Gateway Server 1
       +
Gateway Server 2

rather than:

One physical server
        ↓
        💥
   Entire reporting stops

14. Gateway server design
For each gateway server document:

Server name

Windows version

CPU

RAM

Disk

Network

Region/location

Data sources

Gateway version

Service account requirements

Gateway administrators

Recovery key owner

Maintenance window

Keep gateway members on compatible/current versions; Microsoft notes that different versions within a cluster can cause unexpected behavior. 
M
Microsoft Learn

15. Gateway security
Define:

Gateway administrators
PBI-Gateway-Admins

Connection/data-source owners
Define who can:

Create connections

Edit connections

Delete connections

Manage credentials

Share connections

Data-source credentials
Examples:

SQL → Service account
SAP BW → SAP technical/user account
Oracle → DB account
File share → Windows account

Never put passwords directly into PBIX files, Git repositories, PowerShell scripts, or documentation.

16. Gateway network configuration
Work with the network/security team.

Validate:

Power BI Service
       ↓
Internet / Microsoft services
       ↓
Gateway
       ↓
Firewall/network
       ↓
Data source

Check:

Gateway clusters provide high availability and load balancing. Microsoft currently allows up to 10 gateway members in a cluster, with failover when the primary gateway isn't available.

Gateway Server 1
       +
Gateway Server 2

rather than:

One physical server
        ↓
        💥
   Entire reporting stops

14. Gateway server design
For each gateway server document:

Server name

Windows version

CPU

RAM

Disk

Network

Region/location

Data sources

Gateway version

Service account requirements

Gateway administrators

Recovery key owner

Maintenance window

Keep gateway members on compatible/current versions; Microsoft notes that different versions within a cluster can cause unexpected behavior.

15. Gateway security
Define:

Gateway administrators
PBI-Gateway-Admins

Connection/data-source owners
Define who can:

DNS

Proxy

Firewall

TLS

Outbound connectivity

Ports

Data source reachability

Server authentication

Database authentication

Microsoft's gateway architecture documentation describes the secure communication model and authentication flow. 
M
Microsoft Learn

17. Data sources
Create a central data-source inventory.

Example:

Source	Type	Location	Gateway	Authentication
SAP BW	SAP	On-prem	Gateway-01	SAP
SQL	SQL Server	On-prem	Gateway-01	Service account
Oracle	Oracle	On-prem	Gateway-01	DB
Azure SQL	Cloud	Azure	None/VNet	Entra
SharePoint	Cloud	M365	None	Entra

18. SAP BW
Since you were asking about SAP BW earlier, include it explicitly.

Architecture:

SAP BW
   │
   ▼
On-prem Gateway
   │
   ▼
Power BI Service
   │
   ▼
Semantic Model
   │
   ▼
Reports

For SAP BW, validate:

SAP BW version

SAP .NET Connector requirements

SAP authentication

SAP user authorization

Gateway connectivity

BW query/provider access

Import vs DirectQuery/live connectivity as applicable

Performance

Refresh requirements

19. Semantic model architecture
Avoid having every report directly connect to raw databases.

Prefer:

Data sources
     ↓
Data ingestion/transformation
     ↓
Semantic model
     ↓
Multiple reports

For example:

Sales Semantic Model
       │
 ┌─────┼─────┐
 ▼     ▼     ▼
Sales  Finance Management
Report Report   Report

This gives you reusable business logic.

20. Dataset → Semantic model
The terminology has evolved, so you'll see semantic model used instead of dataset in current Power BI/Fabric documentation.

Define:

Naming standards

Owners

Refresh schedule

Storage mode

Relationships

Measures

Calculation groups where applicable

Incremental refresh

Aggregations

Parameters

Endorsement

Sensitivity labels

21. Data modeling standards
Establish enterprise standards such as:

FactSales
DimCustomer
DimProduct
DimDate
DimRegion

Prefer a well-designed dimensional/star schema where appropriate.

Standardize:

Date table

Currency

Fiscal calendar

Time zones

Naming

Measures

KPI definitions

Null handling

Data types

22. Power Query / transformation standards
Define where transformations should happen.

For example:

Source
 ↓
ETL/Data Engineering
 ↓
Warehouse/Lakehouse
 ↓
Semantic Model
 ↓
Report

Don't put huge amounts of transformation logic inside individual reports when it belongs in a shared data layer.

23. Refresh architecture
Define:

17. Data sources
Create a central data-source inventory.

Example:

Refresh frequency

Refresh windows

Gateway

Credentials

Dependencies

Failure notifications

Retry strategy

Incremental refresh

Refresh ownership

Example:

SAP BW
  ↓
Gateway
  ↓
Semantic Model
  ↓
Refresh 06:00
  ↓
Reports

24. DirectQuery vs Import vs other connectivity
Create an architecture decision for each workload.

Import
Source → Power BI → in-memory model

DirectQuery
Report → Power BI → Source

Live connection
Report → Existing semantic model / Analysis Services

Choose based on:

Data volume

Latency

Source performance

Refresh requirements

Security

Concurrency

Capacity

Gateway load

25. Row-Level Security
For sensitive data, implement RLS.

Example:

User
 ↓
Entra ID
 ↓
Security mapping
 ↓
Region
 ↓
Data

Example:

Mahesh → India
John   → USA
Sarah  → UK

Then a user only sees the rows they are authorized to see.

26. Object-Level Security
For highly sensitive semantic models, consider OLS where appropriate.

This can control access to specific model objects such as tables/columns.

27. Data sensitivity
Define sensitivity classification.

For example:

Public
Internal
Confidential
Highly Confidential
Restricted

Use Microsoft information protection/sensitivity labels where appropriate. Fabric enterprise documentation includes information protection and sensitivity-label capabilities. 
M
Microsoft Learn

28. External sharing
Decide whether users can share Power BI content outside the organization.

Define:

Guest access

B2B

External sharing

Export permissions

Download permissions

Publish to web

Embedding

Sharing outside approved groups

This should be a security decision, not something individual developers decide.

29. Publish to Web
Treat this as a high-risk feature.

Don't allow unrestricted use.

A public Power BI "Publish to web" report can expose information to anyone with access to the published page.

For a new organization, establish a documented approval process.

30. Workspace governance
Create a workspace request process.

Example:

User requests workspace
       ↓
Business owner approval
       ↓
IT/Data governance approval
       ↓
Workspace created
       ↓
Capacity assigned
       ↓
Security groups assigned

Record:

Workspace name

Business owner

Technical owner

Domain

Capacity

Security classification

Data sources

Support group

31. Domains
For a larger organization, organize workspaces into business domains.

For example:

Finance
Sales
HR
Operations
Supply Chain
Marketing

This helps ownership and governance scale.

32. Apps
Don't necessarily give users workspace access.

Instead:

Workspace
    ↓
Power BI App
    ↓
Business users

Developers work in the workspace.

Consumers use the published app.

33. Report standards
Define a company-wide report standard:

Company logo

Colors

Fonts

Page size

Navigation

KPI cards

Titles

Filters

Tooltips

Accessibility

Mobile layout

Date conventions

Currency formatting

Create a reusable Power BI template.

34. Power BI Desktop
Standardize the developer environment.

Define:

Approved Power BI Desktop version

Update policy

Installation method

Required drivers

SAP components

Gateway compatibility

Custom visuals

External tools

Development machines

Don't let 20 developers use 20 different versions indefinitely.

35. Custom visuals
Decide whether users can import custom visuals.

Security team should determine:

Approved visuals
       +
Restricted visuals
       +
Blocked visuals

Keep an approved catalog.

36. Deployment
A production deployment should look something like:

Developer
   ↓
Git / Source Control
   ↓
DEV
   ↓
Code review
   ↓
TEST
   ↓
UAT
   ↓
Approval
   ↓
PROD

Define who can deploy to production.

37. CI/CD
For mature organizations, automate deployment.

Potential components:

GitHub / Azure DevOps
        ↓
Pipeline
        ↓
Power BI / Fabric APIs
        ↓
DEV
        ↓
TEST
        ↓
PROD

Use service principals/managed identities where supported rather than personal accounts for automation.

38. Monitoring
You need monitoring at multiple levels.

Tenant
Usage

Sharing

Workspaces

Reports

Users

Exports

Capacity
CPU

Memory

CU utilization

Throttling

Queries

Refreshes

Gateway
CPU

Memory

Availability

Query duration

Refresh failures

Semantic models
Refresh failures

Duration

Size

Query performance

Reports
Usage

Load time

Errors

Consumers

39. Capacity monitoring
For Fabric capacity, establish regular monitoring and scaling.

Example:

Capacity utilization
       ↓
Normal → Continue
       ↓
High → Investigate
       ↓
Sustained high → Optimize / scale

Microsoft provides the Fabric Capacity Metrics app and capacity-management guidance for monitoring workload consumption. 
M
Microsoft Learn

40. Gateway monitoring
Monitor:

Gateway 01 → Healthy
Gateway 02 → Healthy

If:

Gateway 01 → Failed

traffic should be able to move to another cluster member in an HA design. 
M
Microsoft Learn

Also monitor:

Workspace
    ↓
Power BI App
    ↓
Business users

Developers work in the workspace.

Consumers use the published app.

33. Report standards
Define a company-wide report standard:

Company logo

Colors

Fonts

Page size

Navigation

KPI cards

Titles

Filters

Tooltips

Accessibility

Mobile layout

Date conventions

Currency formatting

34. Power BI Desktop
Standardize the developer environment.

Define:

Approved Power BI Desktop version

Update policy

Installation method

Required drivers

SAP components

Gateway compatibility

Custom visuals

External tools

Development machines

35. Custom visuals
Decide whether users can import custom visuals.

Security team should determine:

Approved visuals
       +
Restricted visuals
       +
Blocked visuals

Keep an approved catalog.

36. Deployment
Developer
   ↓
Git / Source Control
   ↓
DEV
   ↓
Code review
   ↓
TEST
   ↓
UAT
   ↓
Approval
   ↓
PROD

Define who can deploy to production.

37. CI/CD
For mature organizations, automate deployment.

Potential components:

GitHub / Azure DevOps
        ↓
Pipeline
        ↓
Power BI / Fabric APIs
        ↓
DEV
        ↓
TEST
        ↓
PROD

Use service principals/managed identities where supported rather than personal accounts for automation.

38. Monitoring
You need monitoring at multiple levels.

Tenant
Usage

Sharing

Workspaces

Reports

Users

Exports

Capacity
CPU

Memory

CU utilization

Throttling

Queries

Refreshes

Gateway
CPU

Memory

Availability

Query duration

Refresh failures

Semantic models
Refresh failures

Duration

Size

Query performance

Reports
Usage

Load time

Errors

Consumers

39. Capacity monitoring
For Fabric capacity, establish regular monitoring and scaling.

Example:

Capacity utilization
       ↓
Normal → Continue
       ↓
High → Investigate
       ↓
Sustained high → Optimize / scale

Microsoft provides the Fabric Capacity Metrics app and capacity-management guidance for monitoring workload consumption.

40. Gateway monitoring
Monitor:

Gateway 01 → Healthy
Gateway 02 → Healthy

Gateway 01 → Failed

Version

CPU

Memory

Network

Connections

Refresh failures

Data source failures

Server health

41. Audit
Establish auditing for:

Report access

Sharing

Workspace changes

Permission changes

Export activity

Admin activity

Gateway changes

Capacity changes

Data-source changes

Keep appropriate retention according to organizational/compliance requirements.

42. Support model
Create:

L1 → Helpdesk
L2 → Power BI Support
L3 → BI Engineering
L4 → Microsoft / vendor

Define escalation procedures.

Example:

Report not loading
       ↓
L1 checks known issues
       ↓
L2 checks workspace/model
       ↓
L3 checks gateway/source
       ↓
Microsoft if platform issue

43. Incident management
Prepare runbooks for:

Gateway down

SAP BW unavailable

SQL unavailable

Refresh failure

Capacity throttling

Workspace unavailable

User access issue

RLS issue

Authentication failure

Deployment failure

44. Disaster recovery
Document:

Gateway recovery

Capacity recovery

Workspace recovery

Source system recovery

Semantic model recovery

Report recovery

Git/source-control recovery

Credentials recovery

Recovery keys

Gateway recovery keys are important; Microsoft specifically documents them as part of gateway installation and disaster recovery. 
M
Microsoft Learn

45. Backup
Define what gets backed up and where.

Potentially:

PBIP / source-controlled artifacts
        ↓
Git repository

Configuration
        ↓
Documentation / automation

Data
        ↓
Data platform backup

Gateway configuration
        ↓
Documented recovery procedure

Don't treat a PBIX file as the entire organization's backup strategy.

46. Cost management
Track:

Power BI licenses

Fabric capacity

Azure resources

Gateway infrastructure

Storage

Data platform

Support

Training

Use:

Cost center
Business unit
Capacity
Workspace

where practical.

47. Naming convention
Create one before the first production deployment.

Example:

Capacity:
FAB-PROD-CAP-01

Resource Group:
RG-FAB-PROD-EAST

Workspace:
PBI-PROD-FINANCE

Gateway:
GW-PROD-01

Gateway Cluster:
GWCL-PROD-CORP

Semantic Model:
SM-FINANCE-SALES

Report:
RPT-FINANCE-MONTHLY-SALES

48. Tagging
For Azure/Fabric resources:

Environment = Production
Application = PowerBI
Owner = BI-Team
BusinessUnit = Finance
CostCenter = XXXXX
Criticality = High
DataClassification = Confidential

Your exact mandatory tags should come from the organization's Azure governance standard.

49. Documentation
Create a central Power BI/Fabric documentation site.

At minimum:

01 Architecture
02 Tenant
03 Licensing
04 Entra Groups
05 Capacities
06 Workspaces
07 Gateways
08 Data Sources
09 Security
10 RLS
11 Deployment
12 CI/CD
13 Monitoring
14 Disaster Recovery
15 Support
16 Naming Standards
17 Development Standards
18 Onboarding
19 Offboarding
20 Troubleshooting

50. User onboarding
Create a standard process:

New employee
    ↓
Entra account
    ↓
License
    ↓
Security group
    ↓
Workspace/App access
    ↓
Training
    ↓
Power BI access

Don't manually grant 15 permissions every time.

51. User offboarding
When someone leaves:

Disable account
       ↓
Remove security groups
       ↓
Remove workspace access
       ↓
Remove gateway access
       ↓
Transfer ownership
       ↓
Review service connections

Make sure reports/semantic models aren't owned only by the departing employee.

52. Data governance
Define:

43. Incident management
Prepare runbooks for:

Gateway down

SAP BW unavailable

SQL unavailable

Refresh failure

Capacity throttling

Workspace unavailable

User access issue

RLS issue

Authentication failure

Deployment failure

44. Disaster recovery
Document:

Gateway recovery

Capacity recovery

Workspace recovery

Source system recovery

Semantic model recovery

Report recovery

Git/source-control recovery

Credentials recovery

Recovery keys

Gateway recovery keys are important; Microsoft specifically documents them as part of gateway installation and disaster recovery.

45. Backup
Define what gets backed up and where.

Data owners

Data stewards

Business definitions

KPI definitions

Data quality

Classification

Retention

Lineage

Approved data sources

For example:

"Revenue" must have one agreed enterprise definition.

Otherwise Finance and Sales may build different "Revenue" measures.

53. Certified / endorsed content
Establish a process for trusted content.

For example:

Development
   ↓
Validated
   ↓
Endorsed
   ↓
Certified

Users should know which semantic models/reports are official.

54. Self-service BI
Don't try to eliminate self-service.

Instead:

Enterprise BI
     +
Managed self-service BI
     +
Sandbox

Give users controlled areas where they can experiment without contaminating production.

55. Sandbox
Create something like:

PBI-SANDBOX

with:

Limited permissions

Limited capacity

Data restrictions

No production credentials

Automatic cleanup if appropriate

56. Training
Train different groups differently.

Consumers
Open reports

Filters

Drill-through

Export

Subscriptions

Developers
Power Query

DAX

Data modeling

Performance

Security

Deployment

Admins
Tenant

Capacity

Gateway

Security

Monitoring

Troubleshooting

57. Center of Excellence
For a larger organization, establish a Power BI/Fabric Center of Excellence (CoE).

Typical responsibilities:

Governance
Architecture
Standards
Training
Support
Security
Monitoring
Adoption
Cost optimization

58. Enterprise support documentation
Create standard troubleshooting guides:

"Refresh failed"
"Gateway offline"
"User cannot see report"
"RLS incorrect"
"Dataset/semantic model refresh slow"
"Capacity overloaded"
"Cannot connect to SAP BW"
"Cannot connect to SQL"
"Power BI Desktop login issue"
"Workspace access issue"

59. Performance management
For every production solution monitor:

Source performance
      ↓
Power Query
      ↓
Gateway
      ↓
Semantic model
      ↓
DAX
      ↓
Report visual

Don't automatically blame Power BI when a report is slow.

60. Production readiness checklist
Before a report goes into production:

☐ Business owner identified
☐ Technical owner identified
☐ Data sources approved
☐ Security reviewed
☐ RLS tested
☐ Semantic model validated
☐ Refresh tested
☐ Gateway tested
☐ Performance tested
☐ UAT completed
☐ Report reviewed
☐ Sensitivity label applied
☐ Workspace configured
☐ Capacity assigned
☐ Deployment completed
☐ Monitoring configured
☐ Support owner identified
☐ Documentation completed
☐ DR/recovery requirements documented

The complete enterprise picture
For the organization you're describing, I would ultimately aim for this:

                    ┌──────────────────────┐
                    │   Microsoft Entra ID  │
                    └──────────┬───────────┘
                               │
                    Users / Groups / SPNs
                               │
                               ▼
                    ┌──────────────────────┐
                    │ Fabric / Power BI     │
                    │ Tenant Administration │
                    └──────────┬───────────┘
                               │
              ┌────────────────┼────────────────┐
              │                │                │
              ▼                ▼                ▼
         Governance       Security         Licensing
              │                │                │
              └────────────────┼────────────────┘
                               ▼
                    ┌──────────────────────┐
                    │ Fabric Capacity      │
                    └──────────┬───────────┘
                               │
                 ┌─────────────┼─────────────┐
                 ▼             ▼             ▼
              DEV           TEST            PROD
                 │             │             │
                 └─────────────┼─────────────┘
                               │
                               ▼
                         Workspaces
                               │
                               ▼
                       Semantic Models
                               │
                               ▼
                            Reports
                               │
                               ▼
                             Apps
                               │
                               ▼
                           Users


     On-Premises / Private Data
              │
       ┌──────┼────────┐
       ▼      ▼        ▼
     SAP BW  SQL      SSAS
       │      │        │
       └──────┼────────┘
              ▼
       Gateway Cluster
        ┌───────────┐
        │ GW-01     │
        │ GW-02     │
        └─────┬─────┘
              │
              ▼
       Power BI / Fabric

This is essentially the A-to-Z checklist I'd use to build Power BI/Fabric for a new enterprise. Microsoft's own implementation-planning framework similarly treats this as a platform implementation covering tenant setup, administration, workspaces, lifecycle, security, gateways, monitoring, and adoption—not merely report development. 
M
Microsoft Learn
+1

The order I would actually execute it
Phase 1 — Foundation

Entra ID

Azure subscription

Licensing

Tenant

Admin roles

Tenant settings

Security groups

Phase 2 — Platform
8. Fabric capacity
9. Resource groups/tags
10. Workspaces
11. Domains
12. Naming standards
13. Power BI Desktop standards

Phase 3 — Data connectivity
14. Gateway servers
15. Gateway cluster
16. Gateway security
17. SQL connections
18. SAP BW connections
19. Other data sources
20. Credentials
21. Refresh

Phase 4 — Development
22. DEV/TEST/PROD
23. Git
24. Semantic models
25. Reports
26. RLS/OLS
27. Deployment pipelines/CI-CD

Phase 5 — Governance
28. Sensitivity
29. Certification
30. Workspace governance
31. External sharing
32. Export controls
33. Audit
34. Data governance

Phase 6 — Operations
35. Capacity monitoring
36. Gateway monitoring
37. Refresh monitoring
38. Cost monitoring
39. Incident management
40. DR
41. Backup
42. Support

Phase 7 — Adoption
43. User onboarding
44. Training
45. Self-service BI
46. CoE
47. Usage/adoption tracking
48. Continuous improvement
