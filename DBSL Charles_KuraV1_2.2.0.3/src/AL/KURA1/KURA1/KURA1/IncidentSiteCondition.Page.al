#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72093 "Incident Site Condition"
{
    PageType = ListPart;
    SourceTable = "Incident Site Condition";

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
                field(Assets;Assets)
                {
                    ApplicationArea = Basic;
                }
                field("Damage Condition";"Damage Condition")
                {
                    ApplicationArea = Basic;
                }
                field("Photo no";"Photo no")
                {
                    ApplicationArea = Basic;
                }
                field("Incident No";"Incident No")
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

