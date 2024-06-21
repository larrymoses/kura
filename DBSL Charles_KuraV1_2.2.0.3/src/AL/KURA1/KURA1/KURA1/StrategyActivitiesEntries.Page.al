#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80037 "Strategy Activities Entries"
{
    PageType = List;
    SourceTable = "Strategy Sub_Activity Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("External Document No";"External Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Strategic Plan ID";"Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Theme ID";"Theme ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Objective ID";"Objective ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Strategy ID";"Strategy ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Activity ID";"Activity ID")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry Description";"Entry Description")
                {
                    ApplicationArea = Basic;
                }
                field("Entry Type";"Entry Type")
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
                field("Posting Date";"Posting Date")
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

