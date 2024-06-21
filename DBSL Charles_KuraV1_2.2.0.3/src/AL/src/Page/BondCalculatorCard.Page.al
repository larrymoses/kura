#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54016 "Bond Calculator Card"
{
    // PageType = Card;
    // SourceTable = "Bond Calculator";

    // layout
    // {
    //     area(content)
    //     {
    //         group("Intial Info")
    //         {
    //             field(No; No)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("FXD No"; "FXD No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("System Bond No"; "System Bond No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Face Value"; "Face Value")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Original Term"; "Original Term")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Coupon Rate"; "Coupon Rate")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Nominal Amount (Cost)"; "Nominal Amount (Cost)")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Custodian Code"; "Custodian Code")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Fund Code"; "Fund Code")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //         }
    //         group("Input Details")
    //         {
    //             field("Settlement Date"; "Settlement Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Yield(input)"; "Yield(input)")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Dirty Price/per value"; "Dirty Price/per value")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("% commission"; "% commission")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //         group(Dates)
    //         {
    //             field("Issue Date"; "Issue Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Maturity Date"; "Maturity Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Next Coupon"; "Next Coupon")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Last Coupon"; "Last Coupon")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //         group("Stastistical Information")
    //         {
    //             field("Set to Next"; "Set to Next")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Last to next"; "Last to next")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Last to set"; "Last to set")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Average unpaid coupons"; "Average unpaid coupons")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Unpaid Coupon"; "Unpaid Coupon")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //         group("Bond Analysis")
    //         {
    //             field("Market Rate"; "Market Rate")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Frequency; Frequency)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Day Basis"; "Day Basis")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Accrued Interest"; "Accrued Interest")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Clean Price"; "Clean Price")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Bond Consideration"; "Bond Consideration")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Commission; Commission)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Net Amount Receivable"; "Net Amount Receivable")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Book value for the Bond"; "Book value for the Bond")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Accrued Interest 2"; "Accrued Interest 2")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Posted; Posted)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Loss/Profit on sale of bond"; "Loss/Profit on sale of bond")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //     }
    // }

    // actions
    // {
    //     area(creation)
    //     {
    //         action("Post Accrued Interest")
    //         {
    //             ApplicationArea = Basic;
    //             Image = Post;
    //             Promoted = true;
    //             PromotedCategory = Process;

    //             trigger OnAction()
    //             begin
    //           //     InvestPost.FnPostAccruedInt(Rec);


    //                 //******Commented By Morris*****//
    //                 /*
    //                 //IF Posted THEN
    //                 //ERROR('This Revaluation has been Posted');

    //                 IF Property.GET("System Bond No") THEN
    //                 BEGIN

    //                 Property.SETRANGE("Date Filter",0D,"Settlement Date");
    //                 Property.CALCFIELDS("Current Value","No.Of Units",Cost,Revaluations,"Accrued Interest");
    //                 //MESSAGE('CURRENT VALUE=%1 %2',Property."Current Value",EquityRec.Revaluations);

    //                 EquityRec.COPY(Property);
    //                 EquityRec.SETRANGE("Date Filter",0D,EndYear("Settlement Date"));
    //                 EquityRec.CALCFIELDS(EquityRec.Revaluations);
    //                 //MESSAGE('CURRENT VALUE=%1',EquityRec.Revaluations);


    //                   // DELETE ANY LINE ITEM THAT MAY BE PRESENT
    //                   GenJnlLine.RESET;
    //                   GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'GENERAL');
    //                   GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'JVS');
    //                   GenJnlLine.DELETEALL;

    //                 {
    //                 //*********REVALUATION***********/
    //                 //Reverse Previous

    //                 // GenJnlLine.Init;
    //                 // GenJnlLine."Journal Template Name":='GENERAL';
    //                 // GenJnlLine."Journal Batch Name":='JVS';
    //                 // GenJnlLine."Account Type":=GenJnlLine."account type"::"G/L Account";

    //                 // if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
    //                 // GenJnlLine."Account No.":=InvestmentPostingGrp."Investment Revaluation Account"
    //                 // else
    //                 // Error('You must specify Investment Posting Group for Property %1',"System Bond No");

    //                 // GenJnlLine.Validate(GenJnlLine."Account No.");
    //                 // GenJnlLine."Line No.":=GenJnlLine."Line No."+10000;
    //                 // GenJnlLine.Validate(GenJnlLine."Account No.");
    //                 // GenJnlLine."Posting Date":="Settlement Date";
    //                 // GenJnlLine."Document No.":=CopyStr('JV-'+"System Bond No"+'-'+Format(GenJnlLine."Posting Date"),1,20);

    //                 // GenJnlLine.Amount:=Property.Revaluations;
    //                 // //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

    //                 // //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
    //                 // GenJnlLine.Validate(GenJnlLine.Amount);
    //                 // GenJnlLine.Description:=Property.Description + '' + 'Revaluation Reversal' ;
    //                 // GenJnlLine."Investment Code":="System Bond No";
    //                 //GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Revaluation;
    //                 //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
    //                 // GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
    //                 // GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
    //                 // GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
    //                 // GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

    //                 // if GenJnlLine.Amount<>0 then
    //                 // GenJnlLine.Insert(true);


    //                 //                     if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
    //                 //                     GenJnlLine."Account No.":=InvestmentPostingGrp."Investment Cost Account"
    //                 //                     else
    //                 //                     Error('You must specify Investment Posting Group for Property %1',"System Bond No");

    //                 //                     GenJnlLine.Validate(GenJnlLine."Account No.");
    //                 //                     GenJnlLine."Line No.":=GenJnlLine."Line No."+10000;
    //                 //                     GenJnlLine.Validate(GenJnlLine."Account No.");
    //                 //                     GenJnlLine."Posting Date":="Settlement Date";
    //                 //                     GenJnlLine."Document No.":=CopyStr('JV-'+"System Bond No"+'-'+Format(GenJnlLine."Posting Date"),1,20);
    //                 //                     //GenJnlLine."External Document No.":="Cheque No";
    //                 //                     GenJnlLine.Amount:=-(Property.Revaluations);
    //                 //                     //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

    //                 //                     //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
    //                 //                     GenJnlLine.Validate(GenJnlLine.Amount);
    //                 //                     GenJnlLine.Description:=Property.Description + '' + 'Revaluation Reversal' ;
    //                 //                     GenJnlLine."Investment Code":="System Bond No";
    //                 //                     GenJnlLine."Investment Transcation Type":=GenJnlLine."investment transcation type"::Revaluation;
    //                 //                     GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
    //                 //                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
    //                 //                     GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
    //                 //                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

    //                 //                     if GenJnlLine.Amount<>0 then
    //                 //                     GenJnlLine.Insert(true);

    //                 //                     //End the reversal

    //                 //                     //current Revaluation

    //                 //                     GenJnlLine.Init;
    //                 //                     GenJnlLine."Journal Template Name":='GENERAL';
    //                 //                     GenJnlLine."Journal Batch Name":='JVS';
    //                 //                     GenJnlLine."Account Type":=GenJnlLine."account type"::"G/L Account";

    //                 //                     if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
    //                 //                     GenJnlLine."Account No.":=InvestmentPostingGrp."Investment Revaluation Account"
    //                 //                     else
    //                 //                     Error('You must specify Investment Posting Group for Property %1',"System Bond No");

    //                 //                     GenJnlLine.Validate(GenJnlLine."Account No.");
    //                 //                     GenJnlLine."Line No.":=GenJnlLine."Line No."+10000;
    //                 //                     GenJnlLine.Validate(GenJnlLine."Account No.");
    //                 //                     GenJnlLine."Posting Date":="Settlement Date";
    //                 //                     GenJnlLine."Document No.":=CopyStr('JV-'+"System Bond No"+'-'+Format(GenJnlLine."Posting Date"),1,20);
    //                 //                     //GenJnlLine."External Document No.":="Cheque No";
    //                 //                     GenJnlLine.Amount:=-("Net Amount Receivable"-Property.Cost);
    //                 //                     //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
    //                 //                     //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
    //                 //                     GenJnlLine.Validate(GenJnlLine.Amount);
    //                 //                     GenJnlLine.Description:=Property.Description + '' + 'Revaluation' ;
    //                 //                     GenJnlLine."Investment Code":="System Bond No";
    //                 //                     //GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Revaluation;
    //                 //                     GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
    //                 //                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");

    //                 //                     GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
    //                 //                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

    //                 //                     if GenJnlLine.Amount<>0 then
    //                 //                     GenJnlLine.Insert(true);


    //                 //                     if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
    //                 //                     GenJnlLine."Account No.":=InvestmentPostingGrp."Investment Cost Account"
    //                 //                     else
    //                 //                     Error('You must specify Investment Posting Group for Property %1',"System Bond No");

    //                 //                     GenJnlLine.Validate(GenJnlLine."Account No.");
    //                 //                     GenJnlLine."Line No.":=GenJnlLine."Line No."+10000;
    //                 //                     GenJnlLine.Validate(GenJnlLine."Account No.");
    //                 //                     GenJnlLine."Posting Date":="Settlement Date";
    //                 //                     GenJnlLine."Document No.":=CopyStr('JV-'+"System Bond No"+'-'+Format(GenJnlLine."Posting Date"),1,20);
    //                 //                     //GenJnlLine."External Document No.":="Cheque No";
    //                 //                     GenJnlLine.Amount:="Net Amount Receivable"-Property.Cost;
    //                 //                     //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
    //                 //                     //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
    //                 //                     GenJnlLine.Validate(GenJnlLine.Amount);
    //                 //                     GenJnlLine.Description:=Property.Description + '' + 'Revaluation' ;
    //                 //                     GenJnlLine."Investment Code":="System Bond No";
    //                 //                     GenJnlLine."Investment Transcation Type":=GenJnlLine."investment transcation type"::Revaluation;
    //                 //                     //GenJnlLine."No. Of Units":="No. Of Units";
    //                 //                     //GenJnlLine."Expected Receipt date":="Schedule Date";
    //                 //                     GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
    //                 //                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");

    //                 //                     GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
    //                 //                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");



    //                 //                     if GenJnlLine.Amount<>0 then
    //                 //                     GenJnlLine.Insert(true);

    //                 //                     //end current revaluation

    //                 //                     //*********END REVALUATION******************//

    //                 //                     }
    //                 //                     CodeunitCodeunit                    CodeunitCodeunit                    CodeunitCodeunitPage "Interest Rates";
    //                 //                 Visible = false;
    //                 // Report "Bondo Cash Flow to Excel";
    //                 //         GenJnline;
    //                 //         Equities;
    //                 //         InvestmentPostingGrp;
    //                 //         InvestmentHistory;
    //                 //         InstitutionAction;
    //                 //         Institution;
    //                 //         Property;
    //                 //         EquityRec;
    //                 //         GenJnlLine;
    //                 //         DefaultBatch;
    //                 //         Calculator;
    //                 //         DefaultDim;
    //                 //         RevaluationTable;
    //                 //         RevaluationGainLoss;
    //                 //         UnitCost;
    //                 //         FA;
    //                 //         Purchase;
    //                 //         Sale;
    //                 //         GLsetup;
    //                 //         InvestPost;


    //                 // procedure EndYear(var PostDate: Date) EndYearDate: Date
    //                 // var
    //                 //     Year: Integer;
    //                 // begin
    //                 //     Year:=Date2dmy(PostDate,3);
    //                 //     Year:=Year-1;
    //                 //     Evaluate(EndYearDate,'3112'+Format(Year));
    //                 //     //MESSAGE('%1',EndYearDate);
    //                 // """end""";"
    //         }
    //     }
    // }
}