#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95120 "Audit Opinion Types"
{
    CardPageID = "Audit Opinion Type";
    PageType = List;
    SourceTable = "Audit Opinion Type";

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
                field("Additional Comments";"Additional Comments")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Draft Audit Reports";"No. of Draft Audit Reports")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Final Audit Reports";"No. of Final Audit Reports")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

