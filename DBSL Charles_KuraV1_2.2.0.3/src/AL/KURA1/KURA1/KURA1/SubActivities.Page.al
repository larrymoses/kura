#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80039 "Sub Activities"
{
    PageType = List;
    SourceTable = "Strategy Sub_Activity Entry";

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
                field("Entry Type";"Entry Type")
                {
                    ApplicationArea = Basic;
                }
                field("Entry Description";"Entry Description")
                {
                    ApplicationArea = Basic;
                }
                field("Year Reporting Code";"Year Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter Reporting Code";"Quarter Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Date";"Planning Date")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate";"Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department";"Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Cost Amount";"Cost Amount")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No";"External Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Source Type";"Source Type")
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

