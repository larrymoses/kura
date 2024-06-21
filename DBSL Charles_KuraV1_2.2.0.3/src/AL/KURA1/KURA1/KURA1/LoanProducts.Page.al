#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69016 "Loan Products"
{
    ApplicationArea = Basic;
    CardPageID = "Loan Products Setup";
    Editable = false;
    PageType = List;
    SourceTable = "Loan Product Type";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Interest Rate";"Interest Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Calculation Method";"Interest Calculation Method")
                {
                    ApplicationArea = Basic;
                }
                field("No of Instalment";"No of Instalment")
                {
                    ApplicationArea = Basic;
                }
                field("Loan No Series";"Loan No Series")
                {
                    ApplicationArea = Basic;
                }
                field(Rounding;Rounding)
                {
                    ApplicationArea = Basic;
                }
                field("Rounding Precision";"Rounding Precision")
                {
                    ApplicationArea = Basic;
                }
                field("Loan Category";"Loan Category")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Deduction Code";"Interest Deduction Code")
                {
                    ApplicationArea = Basic;
                }
                field("Deduction Code";"Deduction Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000014;Outlook)
            {
            }
            systempart(Control1000000015;Notes)
            {
            }
            systempart(Control1000000016;MyNotes)
            {
            }
            systempart(Control1000000017;Links)
            {
            }
        }
    }

    actions
    {
    }
}

