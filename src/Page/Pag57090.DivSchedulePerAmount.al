#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57090 "Div Schedule Per Amount"
{
    PageType = Card;
    SourceTable = "Budget Commitment";

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             field("Entry No.";"Entry No.")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Account No.";"Account No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Account Name";"Account Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Budgeted Amount";"Budgeted Amount")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Commited Amount PRN";"Commited Amount PRN")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Commited Amount Orders";"Commited Amount Orders")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Budget Name";"Budget Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Budget Start Date";"Budget Start Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Actual Amount";"Actual Amount")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //         }
    //         part(Control14;"institutions Action List")
    //         {
    //            // SubPageLink = "Document No"=field("Entry No.");
    //         }
    //     }
    // }

    // actions
    // {
    //     area(creation)
    //     {
    //         action("Update Lines")
    //         {
    //             ApplicationArea = Basic;
    //             Image = SuggestLines;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin
    //                 TestField("Budget Start Date");
    //                 Equity.Reset;
    //                 Equity.SetRange(Institution,"Budget Start Date");
    //                 Equity.SetFilter(Equity."Asset Type",'%1',Equity."asset type"::Equity);

    //                 if Equity.Find('-') then begin
    //                   repeat
    //                     Institutional.Init;
    //                     Institutional."Document No":="Entry No.";
    //                     Institutional."Investment Code":=Equity."No.";
    //                     Institutional.Type:=Institutional.Type::Dividend;
    //                     Institutional.Validate(Institutional."Investment Code");
    //                     Institutional."Fund Code":=Equity."Fund Code";
    //                     Institutional."Custodian Code":=Equity."Custodian Code";
    //                     Institutional.Insert(true);
    //                     //Institutional.
    //                    until Equity.Next=0;
    //                   end;
    //             end;
    //         }
    //         action("Post Dividend Income")
    //         {
    //             ApplicationArea = Basic;
    //             Image = Post;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin

    //                 Temp.Get(UserId);
    //                     JTemplate:=Temp."Payment Journal Template";JBatch:=Temp."Payment Journal Batch";
    //                     if JTemplate='' then
    //                     begin
    //                       Error('Ensure the PV Template is set up in Funds User Setup');
    //                     end;
    //                     if JBatch='' then
    //                     begin
    //                      Error('Ensure the PV Batch is set up in the Funds User Setup')
    //                   end;

    //                   GenJnline.Reset;
    //                   GenJnline.SetRange(GenJnline."Journal Template Name",JTemplate);
    //                   GenJnline.SetRange(GenJnline."Journal Batch Name",JBatch);
    //                   GenJnline.DeleteAll;



    //                 inst.Reset;
    //                 inst.SetRange("Document No","Entry No.");
    //                 inst.SetRange("Check to Post",true);
    //                 if inst.Find('-') then begin
    //                   repeat
    //                     InvestPost.FnPostDividendIncomeAmt(inst);
    //                     until inst.Next=0;
    //                 end;


    //                 GenJnline.Reset;
    //                 GenJnline.SetRange(GenJnline."Journal Template Name",JTemplate);
    //                 GenJnline.SetRange(GenJnline."Journal Batch Name",JBatch);
    //                 if GenJnline.Find('-') then begin
    //                   //REPEAT
    //                   Codeunit.Run(Codeunit::"Gen. Jnl.-Post",GenJnline);
    //                 //UNTIL GenJnline.NEXT=0;
    //                 end;

    //                 InstitutionalActions.Reset;
    //                 InstitutionalActions.SetRange("Document No","Entry No.");
    //                 if InstitutionalActions.Find('-') then begin
    //                   repeat
    //                     InstitutionalActions.Posted:=true;
    //                     InstitutionalActions.Modify;
    //                     until InstitutionalActions.Next=0;
    //                 end;



    //                 InstitutionalActions.Reset;
    //                 InstitutionalActions.SetRange("Document No","Entry No.");
    //                 if InstitutionalActions.Find('-') then begin
    //                   repeat

    //                       Equities.Reset;
    //                       Equities.SetRange(Equities."No.",InstitutionalActions."Investment Code");
    //                       if Equities.Find('-') then begin
    //                       repeat

    //                       if DivSchedule.Get(Equities."No.",InstitutionalActions."Books Closure Date") then begin
    //                       DivSchedule.Posted:=true;
    //                       DivSchedule.Modify;
    //                       end;
    //                     until Equities.Next=0;
    //                     end;
    //                  until InstitutionalActions.Next=0;
    //                 end;

    //                 "Commited Amount Orders":=true;
    //                 Modify;
    //             end;
    //         }
    //         action("Post Dividend Payment")
    //         {
    //             ApplicationArea = Basic;
    //             Image = Payment;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin
    //                 Temp.Get(UserId);
    //                     JTemplate:=Temp."Payment Journal Template";JBatch:=Temp."Payment Journal Batch";
    //                     if JTemplate='' then
    //                     begin
    //                       Error('Ensure the PV Template is set up in Funds User Setup');
    //                     end;
    //                     if JBatch='' then
    //                     begin
    //                      Error('Ensure the PV Batch is set up in the Funds User Setup')
    //                   end;

    //                   GenJnline.Reset;
    //                   GenJnline.SetRange(GenJnline."Journal Template Name",JTemplate);
    //                   GenJnline.SetRange(GenJnline."Journal Batch Name",JBatch);
    //                   GenJnline.DeleteAll;

    //                 inst.Reset;
    //                 inst.SetRange("Document No","Entry No.");
    //                 inst.SetRange("Check to Post",true);
    //                 if inst.Find('-') then begin
    //                   repeat
    //                     InvestPost.FnPostDividendPayment(inst);
    //                     until inst.Next=0;
    //                 end;


    //                 GenJnline.Reset;
    //                 GenJnline.SetRange(GenJnline."Journal Template Name",JTemplate);
    //                 GenJnline.SetRange(GenJnline."Journal Batch Name",JBatch);
    //                 if GenJnline.Find('-') then begin
    //                   //REPEAT
    //                   Codeunit.Run(Codeunit::"Gen. Jnl.-Post",GenJnline);
    //                 //UNTIL GenJnline.NEXT=0;
    //                 end;

    //                 InstitutionalActions.Reset;
    //                 InstitutionalActions.SetRange("Document No","Entry No.");
    //                 if InstitutionalActions.Find('-') then begin
    //                   repeat
    //                     InstitutionalActions."Payment posted":=true;
    //                     InstitutionalActions.Modify;
    //                    until InstitutionalActions.Next=0;
    //                 end;

    //                 InstitutionalActions.Reset;
    //                 InstitutionalActions.SetRange("Document No","Entry No.");
    //                 if InstitutionalActions.Find('-') then begin
    //                   repeat
    //                     Equities.Reset;
    //                     Equities.SetRange(Equities."No.",InstitutionalActions."Investment Code");
    //                     if Equities.Find('-') then begin
    //                     repeat

    //                         if DivSchedule.Get(Equities."No.",InstitutionalActions."Books Closure Date") then begin
    //                         DivSchedule."Payment posted":=true;
    //                         DivSchedule.Modify;
    //                         end;
    //                     until Equities.Next=0;
    //                     end;
    //                  until InstitutionalActions.Next=0;
    //                 end;

    //                 "Budget Name":=true;
    //                 Modify;
    //             end;
    //         }
    //     }
    // }

    // var
    //     Equity: Record "Investment Asset";
    //     InvestPost: Codeunit "Investment Management";
    //     GenJnline: Record "Gen. Journal Line";
    //     JTemplate: Code[50];
    //     JBatch: Code[50];
    //     Temp: Record "Petty Cash Lines1";
    //     Equities: Record "Investment Asset";
    //     InvestmentPostingGrp: Record "Investment Posting Group";
    //     LineNo: Integer;
    //     DivSchedule: Record "Dividend Payment";
    //     BankAcc: Record "Bank Account";
    //     Custodian: Record "Custodian Code";
    //     Institutional: Record "Institutional Actns Amount";
    //     inst: Record "Institutional Actns Amount";
    //     InstitutionalActions: Record "Institutional Actns Amount";
    //     LineNumber: Integer;
}

