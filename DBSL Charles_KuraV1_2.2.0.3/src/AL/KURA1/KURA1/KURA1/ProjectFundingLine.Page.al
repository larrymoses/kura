#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72065 "Project Funding Line"
{
    PageType = List;
    SourceTable = "Project Funding Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field("PFW No";"PFW No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Funding Worksheet No';
                }
                field("Funding Source";"Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Amount(LCY)";"Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
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

