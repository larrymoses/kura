
/// <summary>
/// Page Incidence Resolutions List (ID 60011).
/// </summary>
page 60011 "Incidence Resolutions List"
{
    PageType = ListPart;
    SourceTable = "Incidence Resolution Table";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resolution Status"; Rec."Resolution Status")
                {
                    ApplicationArea = BasicHr;
                }
                field("Actions Taken"; Rec."Actions Taken")
                {
                    ApplicationArea = BasicHr;
                }
                field("Actioned By"; Rec."Actioned By")
                {
                    ApplicationArea = BasicHr;
                }
                field("Actioned At"; Rec."Actioned At")
                {
                    ApplicationArea = BasicHr;
                }
                field("Duration Taken"; Rec."Duration Taken")
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



