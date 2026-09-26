<#
.SYNOPSIS
    Deploys generic enterprise schema for Syntengro Vision ServiceOps Sentinel.
.DESCRIPTION
    Clean-room implementation for personal M365 sandbox/developer tenant.
#>

Import-Module PnP.PowerShell -ErrorAction Stop

$SiteUrl = "https://yourtenant.sharepoint.com/sites/ServiceOps-Dev"
Connect-PnPOnline -Url $SiteUrl -Interactive

# 1. Primary Service Desk Registry
$TicketsList = "ServiceOps_Tickets"
New-PnPList -Title $TicketsList -Template GenericList -ErrorAction SilentlyContinue

Add-PnPField -List $TicketsList -DisplayName "Description" -InternalName "Description" -Type Note -AddToDefaultView
Add-PnPField -List $TicketsList -DisplayName "Ticket Status" -InternalName "TicketStatus" -Type Choice -Choices "New","In Progress","Resolved","Closed" -AddToDefaultView
Add-PnPField -List $TicketsList -DisplayName "Urgency" -InternalName "Urgency" -Type Choice -Choices "Low","Medium","High","Critical" -AddToDefaultView
Add-PnPField -List $TicketsList -DisplayName "Category" -InternalName "Category" -Type Choice -Choices "Hardware","Software","Access Control","Security" -AddToDefaultView
Add-PnPField -List $TicketsList -DisplayName "Target Asset ID" -InternalName "TargetAssetID" -Type Text -AddToDefaultView
Add-PnPField -List $TicketsList -DisplayName "Resolution Notes" -InternalName "ResolutionNotes" -Type Note -AddToDefaultView

# 2. Immutable Compliance Audit Ledger
$AuditList = "ServiceOps_ComplianceLogs"
New-PnPList -Title $AuditList -Template GenericList -ErrorAction SilentlyContinue

Add-PnPField -List $AuditList -DisplayName "Original Ticket ID" -InternalName "OriginalTicketID" -Type Number -AddToDefaultView
Add-PnPField -List $AuditList -DisplayName "Log Action" -InternalName "LogAction" -Type Text -AddToDefaultView
Add-PnPField -List $AuditList -DisplayName "Ticket Status Snapshot" -InternalName "TicketStatusSnapshot" -Type Text -AddToDefaultView
Add-PnPField -List $AuditList -DisplayName "Snapshot Notes" -InternalName "SnapshotNotes" -Type Note -AddToDefaultView
Add-PnPField -List $AuditList -DisplayName "Audit Timestamp" -InternalName "AuditTimestamp" -Type DateTime -AddToDefaultView

# Seed Generic Mock Data
Add-PnPListItem -List $TicketsList -Values @{
    "Title" = "Workstation Hardware Diagnostics - Mock Unit";
    "Description" = "Periodic thermal paste refresh and RAM integrity test.";
    "TicketStatus" = "New";
    "Urgency" = "Low";
    "Category" = "Hardware";
    "TargetAssetID" = "AST-90210";
} | Out-Null

Write-Host "ServiceOps Sentinel clean schema and seed baseline deployed successfully." -ForegroundColor Green