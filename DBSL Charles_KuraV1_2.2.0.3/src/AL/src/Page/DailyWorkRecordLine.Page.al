#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72080 "Daily Work Record Line"
{
    PageType = ListPart;
    SourceTable = "Daily Work Record Line";

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
                field("Chainage From";"Chainage From")
                {
                    ApplicationArea = Basic;
                }
                field("Chainage To";"Chainage To")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Description";"Activity Description")
                {
                    ApplicationArea = Basic;
                }
                field("Photo No.";"Photo No.")
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

