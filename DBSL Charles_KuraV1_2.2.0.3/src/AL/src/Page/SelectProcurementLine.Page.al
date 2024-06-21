#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 72867 "Select Procurement Line1"
{
    PageType = List;
    SourceTable = "G/L Budget Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // field(Select;Select)
                // {
                //     ApplicationArea = Basic;
                // }
                field("Budget Name"; "Budget Name")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account No."; "G/L Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("KeRRA Budget Code"; "KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Type"; "Project Type")
                {
                    ApplicationArea = Basic;
                }
                field("Works Type"; "Works Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

}