#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75125 "IFS Tender Document Source"
{
    PageType = List;
    SourceTable = "IFS Tender Document Source";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Source ID";"Tender Source ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Url Link";"Url Link")
                {
                    ApplicationArea = Basic;
                }
                field("Date Published";"Date Published")
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

