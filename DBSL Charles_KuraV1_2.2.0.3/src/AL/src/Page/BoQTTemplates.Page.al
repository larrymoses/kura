#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72184 "BoQ TTemplates"
{
    ApplicationArea = Basic;
    Caption = 'BoQ Templates';
    CardPageID = "BoQ Template";
    PageType = List;
    SourceTable = "Purchase Requisition Template";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Template Type";"Template Type")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Start Date";"Effective Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary Region";"Primary Region")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary Directorate";"Primary Directorate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary Department";"Primary Department")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date";"Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time";"Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Template Type":="template type"::BoQ;
    end;
}

