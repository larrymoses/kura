#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80077 "General Assessment Line"
{
    PageType = List;
    SourceTable = "General Assessment Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("General Assessment Template ID";"General Assessment Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line Type";"Line Type")
                {
                    ApplicationArea = Basic;
                }
                field("Assessment Area ID";"Assessment Area ID")
                {
                    ApplicationArea = Basic;
                }
                field("Response Type";"Response Type")
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

