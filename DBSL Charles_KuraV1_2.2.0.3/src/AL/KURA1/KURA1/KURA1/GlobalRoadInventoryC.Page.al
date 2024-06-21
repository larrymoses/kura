#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72149 "Global Road Inventory C"
{
    PageType = Card;
    SourceTable = "Road Inventory";

    layout
    {
        area(content)
        {
            group(General)

            {
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'KURA Road Code';
                }
                field("KeRRA Road Reference Code"; Rec."KeRRA Road Reference Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Gazetted Road Code';
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                }
                 field("Known Name";Rec."Known Name")
                {
                     ApplicationArea = Basic;
                }
                field("Road Class ID"; Rec."Road Class ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Category"; Rec."Road Category")
                {
                    ApplicationArea = Basic;
                }
                field("Surface Type"; Rec."Surface Type")
                {
                    ApplicationArea = Basic;
                }
                field(Town; Rec.Town)
                {
                    ApplicationArea = basic;
                }
                field("Carriageway Type"; Rec."Carriageway Type")
                {
                    ApplicationArea = Basic;
                }
                field("Chainage Description"; Rec."Chainage Description")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage Name"; Rec."Start Chainage Name")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage(KM)"; Rec."Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(KM)"; Rec."End Chainage(KM)")
                {
                    ApplicationArea = Basic;

                }
                field("Gazetted Road Length (KMs)"; Rec."Gazetted Road Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Road Sections"; Rec."No. of Road Sections")
                {
                    ApplicationArea = Basic;
                }
                field("Total Section Length (KMs)"; Rec."Total Section Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
                field("Original Road Agency"; Rec."Original Road Agency")
                {
                    ApplicationArea = Basic;
                }
                field("Last Road Condition Survey ID"; Rec."Last Road Condition Survey ID")
                {
                    ApplicationArea = Basic;
                }
                field("Last Road Cond. Survey Date"; Rec."Last Road Cond. Survey Date")
                {
                    ApplicationArea = Basic;
                }
                field("Paved Road Length (Km)"; Rec."Paved Road Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Paved Road Length %"; Rec."Paved Road Length %")
                {
                    ApplicationArea = Basic;
                }
                field("Paved Start Chainage(KM)"; Rec."Paved Start Chainage(KM)") { ApplicationArea = basic; }
                field("Paved End Chainage(KM)"; Rec."Paved End Chainage(KM)") { ApplicationArea = basic; }
                field("Unpaved Road Length %"; Rec."Unpaved Road Length %")
                {
                    ApplicationArea = Basic;
                }
                field("UnPaved Start Chainage(KM)"; Rec."UnPaved Start Chainage(KM)") { ApplicationArea = basic; }
                field("UnPaved End Chainage(KM)"; Rec."UnPaved End Chainage(KM)") { ApplicationArea = basic; }

                field("General Road Surface Condition"; Rec."General Road Surface Condition")
                {
                    ApplicationArea = Basic;
                }
                field("Primary County ID"; Rec."Primary County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region ID"; Rec."Primary Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Road Reserve Width(M)"; Rec."Desired Road Reserve Width(M)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'This is the length that is defined under the contract specifications/ Standard road reserve length.';
                }
                field("Road Valuation"; Rec."Road Valuation")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Linear Referencing Information")
            {
                Caption = 'Linear Referencing Information';
                field("Start Point Longitude"; Rec."Start Point Longitude")
                {
                    ApplicationArea = Basic;
                }
                field("Start Point Latitude"; Rec."Start Point Latitude")
                {
                    ApplicationArea = Basic;
                }
                field("End Point Longitude"; Rec."End Point Longitude")
                {
                    ApplicationArea = Basic;
                }
                field("End Point Latitude"; Rec."End Point Latitude")
                {
                    ApplicationArea = Basic;
                }
                field("Web GIS URL"; Rec."Web GIS URL")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Planning Profile (Studies, Surveys & Designs)")
            {
                Caption = 'Planning Profile (Studies, Surveys & Designs)';
                field("No. of Feasibility Studies"; Rec."No. of Feasibility Studies")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Environmental Studies"; Rec."No. of Environmental Studies")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Topographic Surveys"; Rec."No. of Topographic Surveys")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Traffic Census reports"; Rec."No. of Traffic Census reports")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Road Safety Audits"; Rec."No. of Road Safety Audits")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Procurement of Works")
            {
                Caption = 'Procurement of Works';
                field("No. of Works Purchase Req"; Rec."No. of Works Purchase Req")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Tender Invitations"; Rec."No. of Tender Invitations")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Awarded Contracts"; Rec."No. of Awarded Contracts")
                {
                    ApplicationArea = Basic;
                }
                field("Total Contract Value"; Rec."Total Contract Value")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Construction Works Profile")
            {
                Caption = 'Construction Works Profile';
                field("Planned Construction Proj"; Rec."Planned Construction Proj")
                {
                    ApplicationArea = Basic;
                }
                field("Ongoing Construction Proj"; Rec."Ongoing Construction Proj")
                {
                    ApplicationArea = Basic;
                }
                field("Completed Construction Proj"; Rec."Completed Construction Proj")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Budget"; Rec."Construction Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Actual"; Rec."Construction Actual")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Asset Management Profile")
            {
                Caption = 'Asset Management Profile';
                field("Planned Maintenance Proj"; Rec."Planned Maintenance Proj")
                {
                    ApplicationArea = Basic;
                }
                field("Ongoing Maintenance Proj"; Rec."Ongoing Maintenance Proj")
                {
                    ApplicationArea = Basic;
                }
                field("Completed Maintenance Proj"; Rec."Completed Maintenance Proj")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Budget"; Rec."Maintenance Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Actual"; Rec."Maintenance Actual")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Res. Land Acq. W_orders"; Rec."No. of Res. Land Acq. W_orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'No.Of Reserve Land Acquisition WorOrders';
                    Editable = false;
                }
                field("No. of Roadside Devpt Apps"; Rec."No. of Roadside Devpt Apps")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. Of Pending RoadSide Development Applications';
                    Editable = false;
                }
                field("No. of App Roadside Devpt Apps"; Rec."No. of App Roadside Devpt Apps")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Approved Roadside Development Applications';
                    Editable = false;
                }
                field("No. of Rej Roadside Devpt Apps"; Rec."No. of Rej Roadside Devpt Apps")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Rejected Roadside Development Applications';
                    Editable = false;
                }
                field("No. of Enchmt Stop W_orders"; Rec."No. of Enchmt Stop W_orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. Of Encroachment Stop Workorders';
                    Editable = false;
                }
                field("No. of Axle Load Inspections"; Rec."No. of Axle Load Inspections")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Axle Load Exempt Prmts"; Rec."No. of Axle Load Exempt Prmts")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. Of Axle Load Exemptions';
                    Editable = false;
                }
                field("No. of Filed Road Misuse Inc."; Rec."No. of Filed Road Misuse Inc.")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. Of Road Misuse Incidents';
                    Editable = false;
                }
            }
            part(Control31; "Layers SubPage")
            {
                Caption = 'Road Cross Sectional Structure';
                SubPageLink = "Road Code" = field("Road Code");
            }
            part(Control86; "Road Constituencies Subform")
            {
                Visible =false;
                Caption = 'Constituencies Covered';
                SubPageLink = "Road Code" = field("Road Code");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup28)
            {
                action("Road Sections")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Links;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Road Link Sections";
                    RunPageLink = "Road Code" = field("Road Code");
                }
                action("Major Structures")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Segment;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Registered Road Structures";
                    RunPageLink = "Road Code" = field("Road Code");
                }
                action("Road Furniture")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Registered Road Furnitures";
                    RunPageLink = "Road Facility Category" = filter(Furniture),
                                   "Road Code" = field("Road Code");
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
                    RunObject = Page "Registered Road Environs";
                    RunPageLink = "Road Code" = field("Road Code");
                    RunPageMode = View;
                }
                action("Road Reserve Widths")
                {
                    ApplicationArea = Basic;
                    Image = Reserve;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Road Reserve Widths";
                    RunPageLink = "KeRRA Road Code" = field("Road Code");
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
                    //                 RunObject = Page "Road Condition Surveys(Existin";
                    //               RunPageLink = "Road Code"=field("Road Code");
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
                    RunObject = Page "Purchase Order List";
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
                }
                action("Constituencies Covered")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Workflow;
                    Promoted = true;
                    Visible =false;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page Constituencies;
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
                RunPageView = where("Type of Project" = filter(Maintenance));
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
             action("Conditions Surveys")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Statistics;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Link RICS";
                RunPageLink = "Road Code" = field("Road Code");
                RunPageView = where("Approval Status" = Const(approved));
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
                Caption = 'Documentations & Photos';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;
                trigger OnAction()
                begin
                    //DMSManagement.UploadDocument(DMSDocuments."Document Type"::"Road Link","Road Code",'Road Link',RECORDID);
                    //                 DMSManagement.UploadRoadLinkDocuments("Road Code",'Road Link',RecordId,"Primary Region ID");
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

                trigger OnAction()
                var
                //DocumentAttachmentDetails: Page "Document Attachment Details";
                // RecRef: RecordRef;
                begin
                    // RecRef.GetTable(Rec);
                    //DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    //DocumentAttachmentDetails.RunModal;
                end;
            }
        }
    }

    // var
    //     DMSDocuments: Record "DMS Documents";
    //     DMSManagement: Codeunit "DMS Management";
}



