#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72663 "Contract Circulation Team"
{
    Caption = 'Circulation Team';
    PageType = List;
    SourceTable = "Purchase Contract Cir Team";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Representative Name";"Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = EMail;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6;Outlook)
            {
            }
            systempart(Control7;Notes)
            {
            }
            systempart(Control8;MyNotes)
            {
            }
            systempart(Control9;Links)
            {
            }
        }
    }

    actions
    {
    }
}

