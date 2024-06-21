#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69534 "OSH Inspection Lines"
{
    PageType = ListPart;
    SourceTable = 69450;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Category Code";"Category Code")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";"Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Response Type";"Response Type")
                {
                    ApplicationArea = Basic;
                }
                field("Response Code";"Response Code")
                {
                    ApplicationArea = Basic;
                }
                field("Response Description";"Response Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Score;Score)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}
