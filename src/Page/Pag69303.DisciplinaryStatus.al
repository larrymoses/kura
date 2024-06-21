#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69303 "Disciplinary Status"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Disciplinary Status Table";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Disciplinary Status";"Disciplinary Status")
                {
                    ApplicationArea = Basic;
                }
                field("Deduction Code";"Deduction Code")
                {
                    ApplicationArea = Basic;
                }
                field("Deductions Based On";"Deductions Based On")
                {
                    ApplicationArea = Basic;
                    TableRelation = EarningsX.Code;
                }
                field("Computation Method";"Computation Method")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage;Percentage)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Formula;Formula)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

