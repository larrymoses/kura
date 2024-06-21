#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75113 "Procurement Committee Function"
{
    PageType = List;
    SourceTable = "Procurement Committee Function";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Committee Type";"Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Act Reference";"Act Reference")
                {
                    ApplicationArea = Basic;
                    Caption = 'PPDA Act reference';
                }
            }
        }
    }

    actions
    {
    }
}

