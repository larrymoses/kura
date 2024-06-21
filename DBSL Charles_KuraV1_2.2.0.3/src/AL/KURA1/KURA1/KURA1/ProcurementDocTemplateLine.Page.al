#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75025 "Procurement Doc Template Line"
{
    Caption = 'Procurement Document Template Line';
    PageType = List;
    SourceTable = "Procurement Doc Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Process";"Procurement Process")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Document Type";"Procurement Document Type")
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
                field("Part of Contract Document";"Part of Contract Document")
                {
                    ApplicationArea = Basic;
                }
                field("Track Certificate Expiry";"Track Certificate Expiry")
                {
                    ApplicationArea = Basic;
                }
                field("Guidelines/Instruction";"Guidelines/Instruction")
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

