#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72253 "Meeting Agenda Item Template"
{
    PageType = ListPart;
    SourceTable = "Meeting Agenda Item Template";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Meeting Type";"Project Meeting Type")
                {
                    ApplicationArea = Basic;
                }
                field("Agenda Code";"Agenda Code")
                {
                    ApplicationArea = Basic;
                }
                field("Item Code";"Item Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

