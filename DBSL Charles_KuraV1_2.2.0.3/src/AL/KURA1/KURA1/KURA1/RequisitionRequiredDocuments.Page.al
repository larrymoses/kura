#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69790 "Requisition Required Documents"
{
    PageType = ListPart;
    SourceTable = "Recruitment Req Documents";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("HR Document Type";"HR Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";"Requirement Type")
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

