#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72346 "Primary National Road Link"
{
    PageType = Card;
    SourceTable = "Road Inventory";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Road Code"; "Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Link Name"; "Link Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class ID"; "Road Class ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Category"; "Road Category")
                {
                    ApplicationArea = Basic;
                }
                field("Carriageway Type"; "Carriageway Type")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage Name"; "Start Chainage Name")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage(KM)"; "Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(KM)"; "End Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Gazetted Road Length (KMs)"; "Gazetted Road Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Road Sections"; "No. of Road Sections")
                {
                    ApplicationArea = Basic;
                }
                field("Total Section Length (KMs)"; "Total Section Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
                field("Original Road Agency"; "Original Road Agency")
                {
                    ApplicationArea = Basic;
                }
                field("Last Road Condition Survey ID"; "Last Road Condition Survey ID")
                {
                    ApplicationArea = Basic;
                }
                field("Last Road Cond. Survey Date"; "Last Road Cond. Survey Date")
                {
                    ApplicationArea = Basic;
                }
                field("Paved Road Length (Km)"; "Paved Road Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Paved Road Length %"; "Paved Road Length %")
                {
                    ApplicationArea = Basic;
                }
                field("Unpaved Road Length %"; "Unpaved Road Length %")
                {
                    ApplicationArea = Basic;
                }
                field("General Road Surface Condition"; "General Road Surface Condition")
                {
                    ApplicationArea = Basic;
                }
                field("Primary County ID"; "Primary County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region ID"; "Primary Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Valuation"; "Road Valuation")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Linear Referencing Information")
            {
                Caption = 'Linear Referencing Information';
                field("Start Point Longitude"; "Start Point Longitude")
                {
                    ApplicationArea = Basic;
                }
                field("Start Point Latitude"; "Start Point Latitude")
                {
                    ApplicationArea = Basic;
                }
                field("End Point Longitude"; "End Point Longitude")
                {
                    ApplicationArea = Basic;
                }
                field("End Point Latitude"; "End Point Latitude")
                {
                    ApplicationArea = Basic;
                }
                field("Web GIS URL"; "Web GIS URL")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Planning Profile (Studies, Surveys & Designs)")
            {
                Caption = 'Planning Profile (Studies, Surveys & Designs)';
                field("No. of Feasibility Studies"; "No. of Feasibility Studies")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Environmental Studies"; "No. of Environmental Studies")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Topographic Surveys"; "No. of Topographic Surveys")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Traffic Census reports"; "No. of Traffic Census reports")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Road Safety Audits"; "No. of Road Safety Audits")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Procurement of Works")
            {
                Caption = 'Procurement of Works';
                field("No. of Works Purchase Req"; "No. of Works Purchase Req")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Tender Invitations"; "No. of Tender Invitations")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Awarded Contracts"; "No. of Awarded Contracts")
                {
                    ApplicationArea = Basic;
                }
                field("Total Contract Value"; "Total Contract Value")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Construction Works Profile")
            {
                Caption = 'Construction Works Profile';
                field("Planned Construction Proj"; "Planned Construction Proj")
                {
                    ApplicationArea = Basic;
                }
                field("Ongoing Construction Proj"; "Ongoing Construction Proj")
                {
                    ApplicationArea = Basic;
                }
                field("Completed Construction Proj"; "Completed Construction Proj")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Budget"; "Construction Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Actual"; "Construction Actual")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Asset Management Profile")
            {
                Caption = 'Asset Management Profile';
                field("Planned Maintenance Proj"; "Planned Maintenance Proj")
                {
                    ApplicationArea = Basic;
                }
                field("Ongoing Maintenance Proj"; "Ongoing Maintenance Proj")
                {
                    ApplicationArea = Basic;
                }
                field("Completed Maintenance Proj"; "Completed Maintenance Proj")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Budget"; "Maintenance Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Actual"; "Maintenance Actual")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Res. Land Acq. W_orders"; "No. of Res. Land Acq. W_orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'No.Of Reserve Land Acquisition WorOrders';
                    Editable = false;
                }
                field("No. of Roadside Devpt Apps"; "No. of Roadside Devpt Apps")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. Of RoadSide Development Applications';
                    Editable = false;
                }
                field("No. of Enchmt Stop W_orders"; "No. of Enchmt Stop W_orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. Of Encroachment Stop Workorders';
                    Editable = false;
                }
                field("No. of Axle Load Inspections"; "No. of Axle Load Inspections")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Axle Load Exempt Prmts"; "No. of Axle Load Exempt Prmts")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. Of Axle Load Exemptions';
                    Editable = false;
                }
                field("No. of Filed Road Misuse Inc."; "No. of Filed Road Misuse Inc.")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. Of Road Misuse Incidents';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup75)
            {
                action("Road Sections")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Links;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    // RunObject = Page "Road Link Sections";
                    // RunPageLink = "Road Code"=field("Road Code");
                }
                action("Major Structures")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Segment;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Road Facility Type";
                    RunPageLink = "Facility Type" = filter(Structure);
                }
                action("Road Furniture")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Road Facility Type";
                    RunPageLink = "Facility Type" = filter(Furniture);
                }
                action("Road Environs")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = SelectItemSubstitution;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = false;
                    RunObject = Page "Road Environ Entries";
                    RunPageLink = "Road Code" = field("Road Code");
                    RunPageMode = View;
                }
                action("Pavement Condition Entries")
                {
                    ApplicationArea = Basic;
                    Image = EntryStatistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Pavement Surface Entries";
                    RunPageLink = "Road Code" = field("Road Code");
                }
                action("Road Inventory & Condition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Road Inventory & Condition Surveys';
                    Ellipsis = true;
                    Image = InventorySetup;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    // RunObject = Page "Road Condition Surveys(Existin";
                    // RunPageLink = "Road Code"=field("Road Code");
                }
                action("Tender Invitations")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Interaction;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Standard Purchase Codes";
                    RunPageLink = "Road Code" = field("Road Code");
                }
                action("Purchase Contracts")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = ContractPayment;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Purchase Order";
                    RunPageLink = "Road Code" = field("Road Code");
                    RunPageView = where("Document Type" = filter("Blanket Order"));
                }
                action(Workplans)
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = WorkCenterAbsence;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Consolidated Work Programs";

                    trigger OnAction()
                    begin
                        Message('Coming up soon!!');
                    end;
                }
            }
        }
        area(processing)
        {
            action("Development/Construction Works")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = AssemblyBOM;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Job List";
                RunPageLink = "Road Code" = field("Road Code");
                RunPageView = where("Road Project Type" = filter(Construction));
            }
            action("Maintenance Works")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = MaintenanceRegistrations;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Job List";
                RunPageLink = "Road Code" = field("Road Code");
                RunPageView = where("Road Project Type" = filter(Maintenance));
            }
            action("Studies & Surveys")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Statistics;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Job List";
                RunPageLink = "Road Code" = field("Road Code");
                RunPageView = where("Road Project Type" = filter(Studies_Surveys_Designs));
            }
            action("Design Works")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Design;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Job List";
                RunPageLink = "Road Code" = field("Road Code");
                RunPageView = where("Road Project Type" = filter(Studies_Surveys_Designs));
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Documentations';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;

                trigger OnAction()
                begin
                    DMSManagement.UploadDocument(DMSDocuments."document type"::"Road Link", "Road Code", 'Road Link', RecordId);
                end;
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                Visible = false;

                // trigger OnAction()
                // var
                //     DocumentAttachmentDetails: Page "Document Attachment Details";
                //     RecRef: RecordRef;
                // begin
                //     RecRef.GetTable(Rec);
                //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                //     DocumentAttachmentDetails.RunModal;
                // end;
            }
        }
    }

    var
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
}

