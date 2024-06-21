#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69498 "HSE Responsibility Lines"
{
    PageType = ListPart;
    SourceTable = "HSE Responsibility";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Role ID";Rec."Role ID")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility ID";Rec."Responsibility ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
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
