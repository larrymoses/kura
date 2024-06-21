#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75129 "IFS Required Document"
{
    PageType = List;
    SourceTable = "IFS Required Document";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Document Type ID";Rec."Procurement Document Type ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Guidelines/Instruction";Rec."Guidelines/Instruction")
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
