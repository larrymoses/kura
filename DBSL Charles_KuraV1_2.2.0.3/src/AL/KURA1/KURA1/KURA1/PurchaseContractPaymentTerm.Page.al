#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75287 "Purchase Contract Payment Term"
{
    Caption = 'Record of Payments';
    PageType = List;
    SourceTable = "Purchase Contract Payment Term";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Sum";"Contract Sum")
                {
                    ApplicationArea = Basic;
                }
                field("Instalment Code";"Instalment Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'IPC Number';
                }
                field("Payment Certificate Type";"Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type';
                    OptionCaption = ',Advance,Interim,Interest,Final';
                }
                field(Payee;Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Payment %";"Payment %")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Amount";"Planned Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Gross IPC Amount(KES)';
                }
                field("Planned Amount (LCY)";"Planned Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cumulative IPC Gross Amount(KES)';
                }
                field("Gross IPC Amount(FCY)";"Gross IPC Amount(FCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Gross IPC Amount(FCY)';
                }
                field("Cumulative Gross IPC Amount(FC";"Cumulative Gross IPC Amount(FC")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cumulative Gross IPC Amount(FCY';
                }
                field("Paid Amount";"Paid Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Paid Amount (LCY)";"Paid Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cumulative Paid Amount (KES)';
                    Editable = false;
                }
                field("Outstanding Amount";"Outstanding Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Cumulative Outstanding Amount";"Cumulative Outstanding Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Lines)
            {
                Caption = 'Lines';
                action("Purchase Contract Milestone")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Milestones';
                    Image = PlanningWorksheet;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Purchase Contract Milestone";
                    RunPageLink = "No."=field("No."),
                                  "Payment Instalment Code"=field("Instalment Code");
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        "Outstanding Amount":="Planned Amount"-"Paid Amount";
        "Cumulative Outstanding Amount":="Cumulative Outstanding Amount"+"Outstanding Amount";
    end;

    trigger OnAfterGetRecord()
    begin
        "Outstanding Amount":="Planned Amount"-"Paid Amount";
        "Cumulative Outstanding Amount":="Cumulative Outstanding Amount"+"Outstanding Amount";
    end;

    trigger OnOpenPage()
    begin

        "Outstanding Amount":="Planned Amount"-"Paid Amount";
        "Cumulative Outstanding Amount":="Cumulative Outstanding Amount"+"Outstanding Amount";
    end;

    var
        PurchaseContractPaymentTerm: Record "Purchase Contract Payment Term";
}

