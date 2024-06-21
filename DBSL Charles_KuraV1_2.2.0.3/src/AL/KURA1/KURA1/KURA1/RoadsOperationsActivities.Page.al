// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// Page 9071 "Roads Operations Activities"
// {
//     Caption = 'Roads Operations Activities';
//     PageType = CardPart;
//     RefreshOnActivate = true;
//     SourceTable = "SAS Parameters";

//     layout
//     {
//         area(content)
//         {
//             cuegroup("Intelligent Cloud")
//             {
//                 Caption = 'Intelligent Cloud';
//                 Visible = ShowIntelligentCloud;

//                 actions
//                 {
//                     action("Learn More")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Learn More';
//                         Image = TileInfo;
//                         RunPageMode = View;
//                         ToolTip = ' Learn more about the Intelligent Cloud and how it can help your business.';

//                         trigger OnAction()
//                         var
//                             IntelligentCloudManagement: Codeunit "Intelligent Cloud Management";
//                         begin
//                             Hyperlink(IntelligentCloudManagement.GetIntelligentCloudLearnMoreUrl);
//                         end;
//                     }
//                     action("Intelligent Cloud Insights")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Intelligent Cloud Insights';
//                         Image = TileCloud;
//                         RunPageMode = View;
//                         ToolTip = 'View your Intelligent Cloud insights.';

//                         trigger OnAction()
//                         var
//                             IntelligentCloudManagement: Codeunit "Intelligent Cloud Management";
//                         begin
//                             Hyperlink(IntelligentCloudManagement.GetIntelligentCloudInsightsUrl);
//                         end;
//                     }
//                 }
//             }
//             cuegroup(Approvals)
//             {
//                 Caption = 'Approvals';
//                 field("Requests to Approve"; "Requests to Approve")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Requests Sent for Approval"; "Requests Sent for Approval")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Projects Requests to Approve"; "Projects Requests to Approve")
//                 {
//                     ApplicationArea = Basic;
//                 }

//                 actions
//                 {
//                     action("Edit Job Queue Entry Card")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Edit Job Queue Entry Card';
//                         RunObject = Page "Job Queue Entry Card";
//                         ToolTip = 'Change the settings for the job queue entry.';
//                     }
//                     action("Edit User Setup")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Edit User Setup';
//                         RunObject = Page "User Setup";
//                         ToolTip = 'Manage users and their permissions.';
//                     }
//                     action("Edit Migration Overview")
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Edit Migration Overview';
//                         RunObject = Page "Config. Package Card";
//                         ToolTip = 'Get an overview of data migration tasks.';
//                     }
//                 }
//             }
//             cuegroup("Assigned Documents")
//             {
//                 Caption = 'Assigned Documents';
//                 Visible = ShowDataIntegrationCues;
//                 field("Assigned PCOs"; "Assigned PCOs")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Assigned Payment Certs"; "Assigned Payment Certs")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//             cuegroup(Projects)
//             {
//                 Caption = 'Projects';
//                 field("Planned Projects"; "Planned Projects")

//                     ApplicationArea = Basic;
//                     Caption = 'Planned Projects';
//                 }
//                 field("Ongoing Projects"; "Ongoing Projects")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Projects Under DLP"; "Projects Under DLP")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Projects Under PBRM"; "Projects Under PBRM")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Competed Projects"; "Competed Projects")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//             cuegroup("Project Statistics")
//             {
//                 Caption = 'Project Statistics';
//                 field("Issued Orders to Commence"; "Issued Orders to Commence")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Expired Insurances"; "Expired Insurances")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Expired Advance Guarantees"; "Expired Advance Guarantees")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Expired Performance Guarantee"; "Expired Performance Guarantee")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Expired Prof Indemnities"; "Expired Prof Indemnities")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Issued Notice of Award - Month"; "Issued Notice of Award - Month")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Awarded Contracts this Month"; "Awarded Contracts this Month")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//             cuegroup("Contractor Variations")
//             {
//                 Caption = 'Contractor Variations';
//                 field("Approved EoTs"; "Approved EoTs")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Approved Scope Variations"; "Approved Scope Variations")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Approved Cost Claims"; "Approved Cost Claims")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Approved Parties Variations"; "Approved Parties Variations")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//             cuegroup(Payments)
//             {
//                 Caption = 'Payments';
//                 field("Approved Advance Certs"; "Approved Advance Certs")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Approved Interim Certs"; "Approved Interim Certs")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Approved Interest Certs"; "Approved Interest Certs")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Approved Final Certs"; "Approved Final Certs")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Approved Retention Certs"; "Approved Retention Certs")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Approved Fee Notes"; "Approved Fee Notes")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }

//     trigger OnOpenPage()
//     var
//         DataSensitivity: Record "Data Sensitivity";
//         CRMConnectionSetup: Record "CRM Connection Setup";
//         IntegrationSynchJobErrors: Record "Integration Synch. Job Errors";
//         DataClassificationMgt: Codeunit "Data Classification Mgt.";
//     begin
//         Reset;
//         if not Get then begin
//             Init;
//             Insert;
//         end;
//         SetRange("User ID Filter", UserId);
//         // RESET;
//         // IF NOT GET THEN BEGIN
//         //  INIT;
//         //  INSERT;
//         // END;
//         // SETRANGE("User ID Filter",USERID);
//         //
//         // DataClassificationMgt.ShowNotifications;
//         //
//         // DataSensitivity.SETRANGE("Company Name",COMPANYNAME);
//         // DataSensitivity.SETRANGE("Data Sensitivity",DataSensitivity."Data Sensitivity"::Unclassified);
//         // UnclassifiedFields := DataSensitivity.COUNT;
//         //
//         // SETFILTER("Date Filter2",'<=%1',CREATEDATETIME(TODAY,0T));
//         // SETFILTER("Date Filter3",'>%1',CREATEDATETIME(TODAY,0T));
//         // SETFILTER("User ID Filter",USERID);
//         //
//         // ShowIntelligentCloud := NOT PermissionManager.SoftwareAsAService;
//         // IntegrationSynchJobErrors.SetDataIntegrationUIElementsVisible(ShowDataIntegrationCues);
//         // ShowD365SIntegrationCues := CRMConnectionSetup.IsEnabled;
//     end;

//     var
//         PermissionManager: Codeunit "Permission Manager";
//         UserTaskManagement: Codeunit "User Task Management";
//         UnclassifiedFields: Integer;
//         ShowIntelligentCloud: Boolean;
//         ShowD365SIntegrationCues: Boolean;
//         ShowDataIntegrationCues: Boolean;
// }

