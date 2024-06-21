// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// Page 72039 "Road Asset List"
// {
//     AdditionalSearchTerms = 'fa list';
//     ApplicationArea = FixedAssets;
//     Caption = 'Road Assets';
//     CardPageID = "Road Asset Card";
//     Editable = false;
//     PageType = List;
//     SourceTable = "Fixed Asset";
//     SourceTableView = where("Record Type" = const("Road Asset"));
//     UsageCategory = Lists;

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 field("No."; "No.")
//                 {
//                     ApplicationArea = FixedAssets;
//                     Caption = 'Road Code';
//                     ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
//                 }
//                 field(Description; Description)
//                 {
//                     ApplicationArea = FixedAssets;
//                     Caption = 'Link Name';
//                     ToolTip = 'Specifies a description of the fixed asset.';
//                 }
//                 field("Master Road Link ID"; "Master Road Link ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Original Road ID"; "Original Road ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Original Road Class"; "Original Road Class")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Original Road No"; "Original Road No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Orignal Road Agency"; "Orignal Road Agency")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Road Label"; "Road Label")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Gazetted  Road Class"; "Gazetted  Road Class")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Government; Government)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Constituency ID"; "Constituency ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("County ID"; "County ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Region ID"; "Region ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Start Reference Point"; "Start Reference Point")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Start Point Coordinates"; "Start Point Coordinates")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("End Reference Point"; "End Reference Point")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("End Point Coordinates"; "End Point Coordinates")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Total Road Length(KM)"; "Total Road Length(KM)")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Total Paved Length(KM)"; "Total Paved Length(KM)")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             systempart(Control1900383207; Links)
//             {
//                 ApplicationArea = RecordLinks;
//                 Visible = false;
//             }
//             systempart(Control1905767507; Notes)
//             {
//                 ApplicationArea = Notes;
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             group("Fixed &Asset")
//             {
//                 Caption = 'Fixed &Asset';
//                 Image = FixedAssets;
//                 action("Depreciation &Books")
//                 {
//                     ApplicationArea = FixedAssets;
//                     Caption = 'Depreciation &Books';
//                     Image = DepreciationBooks;
//                     RunObject = Page "FA Depreciation Books";
//                     RunPageLink = "FA No." = field("No.");
//                     ToolTip = 'View or edit the depreciation book or books that must be used for each of the fixed assets. Here you also specify the way depreciation must be calculated.';
//                     Visible = false;
//                 }
//                 action("Details of Road Activities")
//                 {
//                     ApplicationArea = FixedAssets;
//                     Caption = 'Details of Road Activities';
//                     Image = Statistics;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     RunObject = Page "Fixed Asset Statistics";
//                     RunPageLink = "FA No." = field("No.");
//                     ShortCutKey = 'F7';
//                     ToolTip = 'View detailed historical information about the fixed asset.';
//                 }
//                 group(Dimensions)
//                 {
//                     Caption = 'Dimensions';
//                     Image = Dimensions;
//                     action("Dimensions-Single")
//                     {
//                         ApplicationArea = Dimensions;
//                         Caption = 'Dimensions-Single';
//                         Image = Dimensions;
//                         Promoted = true;
//                         PromotedCategory = Process;
//                         RunObject = Page "Default Dimensions";
//                         RunPageLink = "Table ID" = const(5600),
//                                       "No." = field("No.");
//                         ShortCutKey = 'Shift+Ctrl+D';
//                         ToolTip = 'View or edit the single set of dimensions that are set up for the selected record.';
//                         Visible = false;
//                     }
//                     action("Dimensions-&Multiple")
//                     {
//                         AccessByPermission = TableData Dimension = R;
//                         ApplicationArea = Dimensions;
//                         Caption = 'Dimensions-&Multiple';
//                         Image = DimensionSets;
//                         Promoted = true;
//                         PromotedCategory = Process;
//                         ToolTip = 'View or edit dimensions for a group of records. You can assign dimension codes to transactions to distribute costs and analyze historical information.';
//                         Visible = false;

//                         trigger OnAction()
//                         var
//                             FA: Record "Fixed Asset";
//                             DefaultDimMultiple: Page "Default Dimensions-Multiple";
//                         begin
//                             CurrPage.SetSelectionFilter(FA);
//                             DefaultDimMultiple.SetMultiRecord(FA, FieldNo("No."));
//                             DefaultDimMultiple.RunModal;
//                         end;
//                     }
//                 }
//                 action("Main&tenance Ledger Entries")
//                 {
//                     ApplicationArea = FixedAssets;
//                     Caption = 'Main&tenance Ledger Entries';
//                     Image = MaintenanceLedgerEntries;
//                     RunObject = Page "Maintenance Ledger Entries";
//                     RunPageLink = "FA No." = field("No.");
//                     RunPageView = sorting("FA No.");
//                     ToolTip = 'View all the maintenance ledger entries for a fixed asset. ';
//                     Visible = false;
//                 }
//                 action(Picture)
//                 {
//                     ApplicationArea = FixedAssets;
//                     Caption = 'Picture';
//                     Image = Picture;
//                     RunObject = Page "Fixed Asset Picture";
//                     RunPageLink = "No." = field("No.");
//                     ToolTip = 'Add or view a picture of the fixed asset.';
//                 }
//                 action("FA Posting Types Overview")
//                 {
//                     ApplicationArea = FixedAssets;
//                     Caption = 'FA Posting Types Overview';
//                     Image = ShowMatrix;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     RunObject = Page "FA Posting Types Overview";
//                     ToolTip = 'View accumulated amounts for each field, such as book value, acquisition cost, and depreciation, and for each fixed asset. For every fixed asset, a separate line is shown for each depreciation book linked to the asset.';
//                     Visible = false;
//                 }
//                 action("Co&mments")
//                 {
//                     ApplicationArea = Comments;
//                     Caption = 'Co&mments';
//                     Image = ViewComments;
//                     RunObject = Page "Comment Sheet";
//                     RunPageLink = "Table Name" = const("Fixed Asset"),
//                                   "No." = field("No.");
//                     ToolTip = 'View or add comments for the record.';
//                     Visible = false;
//                 }
//             }
//             group("Main Asset")
//             {
//                 Caption = 'Main Asset';
//                 Image = Components;
//                 action("M&ain Asset Components")
//                 {
//                     ApplicationArea = FixedAssets;
//                     Caption = 'M&ain Asset Components';
//                     Image = Components;
//                     RunObject = Page "Main Asset Components";
//                     RunPageLink = "Main Asset No." = field("No.");
//                     ToolTip = 'View or edit fixed asset components of the main fixed asset that is represented by the fixed asset card.';
//                     Visible = false;
//                 }
//                 action("Ma&in Asset Statistics")
//                 {
//                     ApplicationArea = FixedAssets;
//                     Caption = 'Ma&in Asset Statistics';
//                     Image = StatisticsDocument;
//                     RunObject = Page "Main Asset Statistics";
//                     RunPageLink = "FA No." = field("No.");
//                     ToolTip = 'View detailed historical information about all the components that make up the main asset.';
//                     Visible = false;
//                 }
//                 separator(Action45)
//                 {
//                     Caption = '';
//                 }
//                 action(Attachments)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Attachments';
//                     Image = Attach;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     PromotedOnly = true;
//                     ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

//                     trigger OnAction()
//                     var
//                         DocumentAttachmentDetails: Page "Document Attachment Details";
//                         RecRef: RecordRef;
//                     begin
//                         RecRef.GetTable(Rec);
//                         DocumentAttachmentDetails.OpenForRecRef(RecRef);
//                         DocumentAttachmentDetails.RunModal;
//                     end;
//                 }
//                 action(Sections)
//                 {
//                     ApplicationArea = Basic;
//                     Image = Segment;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     PromotedOnly = true;
//                     RunObject = Page "Road Sections";
//                     RunPageLink = "Road Code" = field("No.");
//                 }
//                 action(Furnitures)
//                 {
//                     ApplicationArea = Basic;
//                     Image = FARegisters;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     PromotedOnly = true;
//                     RunObject = Page "Road Facility Item";
//                     RunPageLink = "Road Code" = field("No."),
//                                   "Road Section No." = filter('2');
//                 }
//                 action(Structures)
//                 {
//                     ApplicationArea = Basic;
//                     Image = CalculateSalesTax;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     PromotedOnly = true;
//                     RunObject = Page "Road Structure Inventory";
//                     RunPageLink = "Road Code" = field("No."),
//                                   "Road Facility Catgegory" = filter(Structure);
//                     RunPageMode = View;
//                 }
//                 action("Road Definition")
//                 {
//                     ApplicationArea = Basic;
//                     Image = Default;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     PromotedOnly = true;
//                     RunObject = Page "Road Definitions";
//                     RunPageLink = "Road Code" = field("No.");
//                     RunPageMode = View;
//                 }
//             }
//             group(History)
//             {
//                 Caption = 'History';
//                 Image = History;
//                 action("Ledger E&ntries")
//                 {
//                     ApplicationArea = FixedAssets;
//                     Caption = 'Ledger E&ntries';
//                     Image = FixedAssetLedger;
//                     RunObject = Page "FA Ledger Entries";
//                     RunPageLink = "FA No." = field("No.");
//                     RunPageView = sorting("FA No.")
//                                   order(descending);
//                     ShortCutKey = 'Ctrl+F7';
//                     ToolTip = 'View the history of transactions that have been posted for the selected record.';
//                 }
//                 action("Error Ledger Entries")
//                 {
//                     ApplicationArea = FixedAssets;
//                     Caption = 'Error Ledger Entries';
//                     Image = ErrorFALedgerEntries;
//                     RunObject = Page "FA Error Ledger Entries";
//                     RunPageLink = "Canceled from FA No." = field("No.");
//                     RunPageView = sorting("Canceled from FA No.")
//                                   order(descending);
//                     ToolTip = 'View the entries that have been posted as a result of you using the Cancel function to cancel an entry.';
//                     Visible = false;
//                 }
//                 action("Maintenance &Registration")
//                 {
//                     ApplicationArea = FixedAssets;
//                     Caption = 'Maintenance &Registration';
//                     Image = MaintenanceRegistrations;
//                     RunObject = Page "Maintenance Registration";
//                     RunPageLink = "FA No." = field("No.");
//                     ToolTip = 'View or edit maintenance codes for the various types of maintenance, repairs, and services performed on your fixed assets. You can then enter the code in the Maintenance Code field on journals.';
//                 }
//             }
//         }
//         area(processing)
//         {
//             action("Fixed Asset Journal")
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'Fixed Asset Journal';
//                 Image = Journal;
//                 RunObject = Page "Fixed Asset Journal";
//                 ToolTip = 'Post fixed asset transactions with a depreciation book that is not integrated with the general ledger, for internal management. Only fixed asset ledger entries are created. ';
//                 Visible = false;
//             }
//             action("Fixed Asset G/L Journal")
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'Fixed Asset G/L Journal';
//                 Image = Journal;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 RunObject = Page "Fixed Asset G/L Journal";
//                 ToolTip = 'Post fixed asset transactions with a depreciation book that is integrated with the general ledger, for financial reporting. Both fixed asset ledger entries are general ledger entries are created. ';
//                 Visible = false;
//             }
//             action("Fixed Asset Reclassification Journal")
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'Fixed Asset Reclassification Journal';
//                 Image = Journal;
//                 RunObject = Page "FA Reclass. Journal";
//                 ToolTip = 'Transfer, split, or combine fixed assets.';
//                 Visible = false;
//             }
//             action("Recurring Fixed Asset Journal")
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'Recurring Fixed Asset Journal';
//                 Image = Journal;
//                 RunObject = Page "Recurring Fixed Asset Journal";
//                 ToolTip = 'Post recurring entries to a depreciation book without integration with general ledger.';
//                 Visible = false;
//             }
//             action(CalculateDepreciation)
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'Calculate Depreciation';
//                 Ellipsis = true;
//                 Image = CalculateDepreciation;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 ToolTip = 'Calculate depreciation according to conditions that you specify. If the related depreciation book is set up to integrate with the general ledger, then the calculated entries are transferred to the fixed asset general ledger journal. Otherwise, the calculated entries are transferred to the fixed asset journal. You can then review the entries and post the journal.';
//                 Visible = false;

//                 trigger OnAction()
//                 begin
//                     Report.RunModal(Report::"Calculate Depreciation", true, false, Rec);
//                 end;
//             }
//             action("C&opy Fixed Asset")
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'C&opy Fixed Asset';
//                 Ellipsis = true;
//                 Image = CopyFixedAssets;
//                 ToolTip = 'Create one or more new fixed assets by copying from an existing fixed asset that has similar information.';
//                 Visible = false;

//                 trigger OnAction()
//                 var
//                     CopyFA: Report "Copy Fixed Asset";
//                 begin
//                     CopyFA.SetFANo("No.");
//                     CopyFA.RunModal;
//                 end;
//             }
//         }
//         area(reporting)
//         {
//             action("Fixed Assets List")
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'Fixed Assets List';
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 //RunObject = Report "Fixed Asset - List";
//                 ToolTip = 'View the list of fixed assets that exist in the system .';
//                 Visible = false;
//             }
//             action("Acquisition List")
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'Acquisition List';
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 //  RunObject = Report "Fixed Asset - Acquisition List";
//                 ToolTip = 'View the related acquisitions.';
//                 Visible = false;
//             }
//             action(Details)
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'Details';
//                 Image = View;
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 //   RunObject = Report "Fixed Asset - Details";
//                 ToolTip = 'View detailed information about the fixed asset ledger entries that have been posted to a specified depreciation book for each fixed asset.';
//                 Visible = false;
//             }
//             action("FA Book Value")
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'FA Book Value';
//                 Image = "Report";
//                 // RunObject = Report "Fixed Asset - Book Value 01";
//                 ToolTip = 'View detailed information about acquisition cost, depreciation and book value for both individual assets and groups of assets. For each of these three amount types, amounts are calculated at the beginning and at the end of a specified period as well as for the period itself.';
//                 Visible = false;
//             }
//             action("FA Book Val. - Appr. & Write-D")
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'FA Book Val. - Appr. & Write-D';
//                 Image = "Report";
//                 //  RunObject = Report "Fixed Asset - Book Value 02";
//                 ToolTip = 'View detailed information about acquisition cost, depreciation, appreciation, write-down and book value for both individual assets and groups of assets. For each of these categories, amounts are calculated at the beginning and at the end of a specified period, as well as for the period itself.';
//                 Visible = false;
//             }
//             action(Analysis)
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'Analysis';
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 //   RunObject = Report "Fixed Asset - Analysis";
//                 ToolTip = 'View an analysis of your fixed assets with various types of data for both individual assets and groups of fixed assets.';
//                 Visible = false;
//             }
//             action("Projected Value")
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'Projected Value';
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 //   RunObject = Report "Fixed Asset - Projected Value";
//                 ToolTip = 'View the calculated future depreciation and book value. You can print the report for one depreciation book at a time.';
//                 Visible = false;
//             }
//             action("G/L Analysis")
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'G/L Analysis';
//                 Image = "Report";
//                 //  RunObject = Report "Fixed Asset - G/L Analysis";
//                 ToolTip = 'View an analysis of your fixed assets with various types of data for individual assets and/or groups of fixed assets.';
//                 Visible = false;
//             }
//             action(Register)
//             {
//                 ApplicationArea = FixedAssets;
//                 Caption = 'Register';
//                 Image = Confirm;
//                 //  RunObject = Report "Fixed Asset Register";
//                 ToolTip = 'View registers containing all the fixed asset entries that are created. Each register shows the first and last entry number of its entries.';
//                 Visible = false;
//             }
//         }
//     }

//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         "Record Type" := "record type"::"Road Asset";
//     end;

//     procedure GetSelectionFilter(): Text
//     var
//         FixedAsset: Record "Fixed Asset";
//         SelectionFilterManagement: Codeunit SelectionFilterManagement;
//     begin
//         CurrPage.SetSelectionFilter(FixedAsset);
//         exit(SelectionFilterManagement.GetSelectionFilterForFixedAsset(FixedAsset));
//     end;
// }

