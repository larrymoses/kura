
/// <summary>
/// Page Security Incident Types (ID 95126).
/// </summary>
page 99995 "Security Incident Types"
{
    PageType = List;
    SourceTable = "Security Incident Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = BasicHr;
                }
                field(Description; Rec.Description)
                {
                     ApplicationArea = BasicHr;
                }
            }
        }
    }

    actions
    {
    }
}



