#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72015 "Feasibilty Study Card"
{
    // PageType = Card;
    // SourceTable = "Road Study_Survey";
    // SourceTableView = where("Study/Survey Type"=filter("Feasibility Study"));

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             field("Study ID";"Study ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Description;Description)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Road Asset ID";"Road Asset ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("All Road Sections";"All Road Sections")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Primary Execution Approach";"Primary Execution Approach")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Study Abstract";"Study Abstract")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Planned Start Date";"Planned Start Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Planned End Date";"Planned End Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Total Distance (KM)";"Total Distance (KM)")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Global Dimension 1";"Global Dimension 1")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Global Dimension 2";"Global Dimension 2")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Region ID";"Region ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Road Works Project ID";"Road Works Project ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Total Approved Budget (LCY)";"Total Approved Budget (LCY)")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Total Actual Cost (LCY)";"Total Actual Cost (LCY)")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Primary Funding Agency ID";"Primary Funding Agency ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //         group(Funding)
    //         {
    //             Caption = 'Funding';
    //             Visible = false;
    //             field("Funding Source Type";"Funding Source Type")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Funding Agency Contacts";"Funding Agency Contacts")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Funding Agency Name";"Funding Agency Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //         group(Responsibility)
    //         {
    //             Caption = 'Responsibility';
    //             field("Project Manager";"Project Manager")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Study Admin Officer ID";"Study Admin Officer ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Admin Officer Name";"Admin Officer Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Study Finance Officer ID";"Study Finance Officer ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Study Finance Officer Name";"Study Finance Officer Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Regional Director ID";"Regional Director ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Regional Director Name";"Regional Director Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //         part(Control31;"Road Study Task Line")
    //         {
    //             SubPageLink = "Study ID"=field("Study ID");
    //         }
    //     }
    // }

    // actions
    // {
    //     area(navigation)
    //     {
    //         action(Objectives)
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Objectives';
    //             Image = Opportunity;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;
    //             RunObject = Page "Road Study Objectives";
    //             RunPageLink = "Study ID"=field("Study ID");
    //         }
    //         action(Relations)
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Related/Collaborating Studies';
    //             Image = Relationship;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;
    //             RunObject = Page "Road Study Relations";
    //             RunPageLink = "Study ID"=field("Study ID");
    //         }
    //         action("Alternative Options")
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Project Alternatives';
    //             Image = AlternativeAddress;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;
    //             RunObject = Page "Road Study Alternative Options";
    //             RunPageLink = "Study ID"=field("Study ID");
    //         }
    //         action("Cost Benefit Analysis Matrix")
    //         {
    //             ApplicationArea = Basic;
    //             Image = CalculateCost;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;
    //             RunObject = Page "Study Cost Benefit Analysis";
    //             RunPageLink = "Study ID"=field("Study ID");
    //         }
    //         action(Risks)
    //         {
    //             ApplicationArea = Basic;
    //             Image = Reserve;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;
    //             RunObject = Page "Feasibility Study Risks";
    //             RunPageLink = "Feasibility Study No"=field("Study ID");
    //         }
    //         action("Study Team")
    //         {
    //             ApplicationArea = Basic;
    //             Image = TransferOrder;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;
    //             RunObject = Page "Feasibility Study Teams";
    //             RunPageLink = "Feasibility Study No"=field("Study ID");
    //         }
    //         action(AttachDocuments)
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Documentations & Photos';
    //             Image = Attach;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;
    //             Visible = true;

    //             trigger OnAction()
    //             begin
    //                 //DMSManagement.UploadDocument(DMSDocuments."Document Type"::"Road Link","Road Code",'Road Link',RECORDID);
    //                 DMSManagement.UploadRoadLinkDocuments("Study ID",'Road Link',RecordId,"Global Dimension 1");
    //             end;
    //         }
    //     }
    // }

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     "Study/Survey Type":="study/survey type"::"Feasibility Study";
    // end;

    // var
    //     DMSDocuments: Record "DMS Documents";
    //     DMSManagement: Codeunit "DMS Management";
}

