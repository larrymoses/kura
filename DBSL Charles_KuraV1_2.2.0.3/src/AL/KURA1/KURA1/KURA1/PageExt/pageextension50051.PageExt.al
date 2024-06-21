#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50051 "pageextension50051" extends "Bank Account Statement List"
{

    layout
    {

    }

    actions
    {
        addfirst(navigation)
        {
            group("St&atement")
            {
                Caption = 'St&atement';
            }
            action("&Card")
            {
                ApplicationArea = Basic;
                Caption = '&Card';
                Image = EditLines;
                RunObject = Page "Bank Account Card";
                RunPageLink = "No." = field("Bank Account No.");
                ShortCutKey = 'Shift+F7';
            }
            action("&Bank Reconciliation Report")
            {
                ApplicationArea = Basic;
                Caption = '&Bank Reconciliation Report';
                Image = Report;
                Promoted = true;
                ShortCutKey = 'Shift+F7';

                trigger OnAction()
                begin
                    BankStatement.Reset;
                    BankStatement.SetRange(BankStatement."Bank Account No.", Rec."Bank Account No.");
                    BankStatement.SetRange(BankStatement."Statement No.", Rec."Statement No.");
                    Report.Run(Report::"Bank Account Reconciliation", true, false, BankStatement);
                end;
            }
        }
    }

    var
        BankStatement: Record "Bank Account Statement";
        UserSetup: Record "User Setup";
        BankAccount: Record "Bank Account";



}

