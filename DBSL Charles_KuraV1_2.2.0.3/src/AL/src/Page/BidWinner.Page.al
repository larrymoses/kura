#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70086 "Bid Winner"
{
    PageType = List;
    SourceTable = Bidders;
    SourceTableView = where("Failed Mandatory"=const(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Ref No.";"Ref No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Recommended Winner";"Recommended Winner")
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

