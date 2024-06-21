#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69092 "Director Ledger Entries"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Director Ledger Entry";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Director No";Rec."Director No")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Code";Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Period";Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                  field("No of Days";Rec."No of Days")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true; 
                }
                field(Amount;Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
              
                field("Rate Per Day";Rec."Rate Per Day")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Taxable;Rec.Taxable)
                {
                    ApplicationArea = Basic;
                }
                field("Tax Deductible";Rec."Tax Deductible")
                {
                    ApplicationArea = Basic;
                }
                field(Frequency;Rec.Frequency)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Period";Rec."Pay Period")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account";Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code";Rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Next Period Entry";Rec."Next Period Entry")
                {
                    ApplicationArea = Basic;
                }
                field(Closed;Rec.Closed)
                {
                    ApplicationArea = Basic;
                }
                field(Paye;Rec.Paye)
                {
                    ApplicationArea = Basic;
                }
                field("Manual Entry";Rec."Manual Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode";Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000028;Outlook)
            {
            }
            systempart(Control1000000029;Notes)
            {
            }
            systempart(Control1000000030;MyNotes)
            {
            }
            systempart(Control1000000031;Links)
            {
            }
        }
    }

    actions
    {
    }
}

