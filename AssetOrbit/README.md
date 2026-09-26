# Syntengro Vision Blueprint: Syntengro Vision AssetOrbit™

## 1. Conceptual Extraction (The Clean Architecture Specification)
* **Core Domain Concept:** Role-gated IT asset configuration management database (CMDB), hardware lifecycle auditing, and cross-functional ticket triage.
* **Abstracted Data Model (Generic Schema):**
  * `AssetTag` (Single Line Text - Primary Key, e.g., AT-10042)
  * `DeviceModel` (Choice / Text, e.g., Enterprise Laptop 14" Pro)
  * `DeviceSerialNumber` (Single Line Text)
  * `AssignedUserEmail` (User / Person / Text)
  * `OperationalStatus` (Choice: In-Stock, Deployed, In Repair, Retired, E-Waste)
  * `ComplianceBoundary` (Choice / Boolean: Controlled Unclassified Information (CUI), Standard Commercial)
  * `DeploymentDate` (DateTime)
  * `WarrantyExpirationDate` (DateTime)
  * `AuditTimestamp` (DateTime)
  * `ServiceTicketRef` (Lookup / Text Linking to Incident Registry)
* **Design Pattern:**
  * **Modular UI Routing:** Decoupled responsive UI with modular routing (`locTab` and `varStatusFilter`).
  * **In-Memory Caching:** Local caching via Collections (`ClearCollect`) to eliminate SharePoint throttling and remove delegation bottlenecks.
  * **Audit Trail Engine:** Multi-condition search, categorical slicers, and transactional batch patching.
  * **Event-Driven Integration Hook:** Intake Form Webhook $\rightarrow$ Auto-provisioning Ticket $\rightarrow$ Adaptive Card notification $\rightarrow$ Operator Dashboard.

## 2. Syntengro Vision Blueprint Asset Spec
* **Asset Name:** Syntengro Vision AssetOrbit™ (Enterprise Hardware Lifecycle & Compliance Management Platform)
* **Target Audience:** Regulated enterprise environments (Defense Industrial Base, Healthcare/HIPAA facilities, Financial datacenters, Legal enclaves).
* **Key Differentiator:** Solves the exact operational pain point of disconnected intake emails, unmonitored hardware float, and manual spreadsheet auditing by delivering an integrated Power Platform solution aligned with strict hardware provenance controls.

## 3. Deliverables for Your Personal Environment & GitHub (Udemy Lab Integration)
* **Schema & Seed Script:** A PowerShell (`PnP.PowerShell` or CLI for Microsoft 365) or JSON script to provision clean SharePoint Lists (`AssetOrbit_Inventory` and `AssetOrbit_SupportTickets`) with generic mock data (e.g., Jane Smith, Contoso Global, Tag AT-009, Serial SN-994821).
* **Clean Canvas App Build:** Built from scratch using modern fluent containers, responsive flex-layouts, custom SVG status indicators, and clean-room variable naming.
* **Architecture & Threat Model Documentation:**
  * Mermaid.js diagrams illustrating the ingestion pipeline (User Request $\rightarrow$ Automated Ticketing $\rightarrow$ In-App Status Mutation $\rightarrow$ Compliance Log).
  * NIST SP 800-171 / CMMC Level 2 alignment breakdown covering:
    * **Configuration Management (`CM.L2-3.4.1`):** Baseline configuration baseline inventory.
    * **Physical Protection (`PE.L2-3.10.1`):** Limiting physical access and maintaining asset custody.
    * **Audit & Accountability (`AU.L2-3.3.1`):** Unambiguous administrative event logging for all lifecycle shifts.