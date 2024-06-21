#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95145 "Audit Templates"
{
    CardPageID = "Audit Template";
    PageType = List;
    SourceTable = "Audit Template";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Audit  WorkType";"Audit  WorkType")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Last Review Date";"Last Review Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

