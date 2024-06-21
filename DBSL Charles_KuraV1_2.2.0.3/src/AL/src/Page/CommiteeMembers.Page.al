#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70048 "Commitee Members"
{
    PageType = ListPart;
    SourceTable = "Commitee Members";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Chair;Chair)
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

