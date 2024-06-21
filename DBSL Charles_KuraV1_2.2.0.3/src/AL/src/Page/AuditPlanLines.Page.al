#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95168 "Audit Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Audit Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Engagement Line No.";"Engagement Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Audit Template ID";"Audit Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit  Work Type";"Audit  Work Type")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement Name";"Engagement Name")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement Category";"Engagement Category")
                {
                    ApplicationArea = Basic;
                }
                field("Parent Audit Project ID";"Parent Audit Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Auditor Type";"Auditor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditor ID";"Lead Auditor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditor Email";"Lead Auditor Email")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date";"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date";"Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Auditee Type";"Auditee Type")
                {
                    ApplicationArea = Basic;
                    OptionCaption = ' ,Board,Company-Level,Directorate,Department/Center';
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Auditee ID";"Primary Auditee ID")
                {
                    ApplicationArea = Basic;
                }
                field("Auditee Name";"Auditee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditee Representative ID";"Lead Auditee Representative ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditee Email";"Lead Auditee Email")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source ID";"Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Control Job No";"Budget Control Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Control Job Task No.";"Budget Control Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Cost (LCY)";"Budget Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Internal Audit Charter ID";"Internal Audit Charter ID")
                {
                    ApplicationArea = Basic;
                }
                field("Chief Audit Executive ID";"Chief Audit Executive ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan Type";"Audit Plan Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Proposed Engagement Team")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposed Engagement Team';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Plan Line Teams";
                }
                action("Audit Location/Sites")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Plan Line Locations";
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Dimension Set Entries";
                }
                action("Audit PlanLine Objective")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Plan Line Objective';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit PlanLine Objective";
                    RunPageLink = "Audit Plan ID"=field("Audit Plan ID"),
                                  "Engagement Line No."=field("Engagement Line No.");
                }
                action("Audit Plan Line Risk")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Plan Line Risk';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Plan Line Risk";
                    RunPageLink = "Audit Plan ID"=field("Audit Plan ID"),
                                  "Engagement Line No."=field("Engagement Line No.");
                }
            }
        }
    }

    var
        DimMgt: Codeunit "Dimension CaptionClass Mgmt";

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        // OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //  DimMgt.EditDimensionSet2(
        //    "Dimension Set ID",STRSUBSTNO('%1 %2',"Document Type","No."),
        //    "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        //
        // IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
        //  MODIFY;
        //  IF PurchLinesExist THEN
        //    UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        // END;
    end;
}

