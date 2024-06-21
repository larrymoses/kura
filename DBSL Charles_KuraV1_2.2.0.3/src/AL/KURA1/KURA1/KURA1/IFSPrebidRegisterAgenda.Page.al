#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75138 "IFS Prebid Register Agenda"
{
    PageType = ListPart;
    SourceTable = "IFS Prebid Clarification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Prebid Register ID";"Prebid Register ID")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code";"IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Agenda Code";"Agenda Code")
                {
                    ApplicationArea = Basic;
                }
                field("Agenda Description";"Agenda Description")
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

