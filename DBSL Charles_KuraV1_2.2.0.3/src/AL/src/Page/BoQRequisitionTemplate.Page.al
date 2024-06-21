#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75118 "BoQ Requisition Template"
{
    ApplicationArea = Basic;
    CardPageID = "Purch Requsition Template Card";
    PageType = List;
    SourceTable = "Purchase Requisition Template";
    SourceTableView = where("Template Type"=const(BoQ));
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
                field("Procurement Type";"Procurement Type")
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
                }
                field("Primary Region";"Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate";"Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department";"Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
        area(factboxes)
        {
            systempart(Control19;Outlook)
            {
            }
            systempart(Control20;Notes)
            {
            }
            systempart(Control21;MyNotes)
            {
            }
            systempart(Control22;Links)
            {
            }
        }
    }

    actions
    {
    }
}

