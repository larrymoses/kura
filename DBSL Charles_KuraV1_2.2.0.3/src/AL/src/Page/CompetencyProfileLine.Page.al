#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80070 "Competency Profile Line"
{
    PageType = ListPart;
    SourceTable = "Competency Profile Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Competency Profile ID";"Competency Profile ID")
                {
                    ApplicationArea = Basic;
                }
                field("Competency Priority";"Competency Priority")
                {
                    ApplicationArea = Basic;
                }
                field("Competency ID";"Competency ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Competency Rating Scale";"Competency Rating Scale")
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

