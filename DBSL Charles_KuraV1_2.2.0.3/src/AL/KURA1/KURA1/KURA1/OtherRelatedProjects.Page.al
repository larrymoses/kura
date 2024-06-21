#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72795 "Other Related Projects"
{
    Caption = 'Other Related Projects';
    CardPageID = "Other Related Project";
    PageType = List;
    SourceTable = "Other Related Project";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No.";"Project No.")
                {
                    ApplicationArea = Basic;
                }
                field("Search Description";"Search Description")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Starting Date";"Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Ending Date";"Ending Date")
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

