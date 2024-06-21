#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54023 "Call Deposit Card"
{
    // PageType = Card;
    // SourceTable = "Investment Asset";
    // SourceTableView = where("Asset Type"=const("Money Market"),
    //                         "Investment Type"=const('04'),
    //                         "Deposit Type"=const(Call));

    // layout
    // {
    //     area(content)
    //     {
    //         group("Call Deposit Definition")
    //         {
    //             field("No.";"No.")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field(Institution;Institution)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Description;Description)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Description 2";"Description 2")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Investment Type";"Investment Type")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Type;Type)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Investment Type Name";"Investment Type Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("FDR Number";"FDR Number")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Investment Posting Group";"Investment Posting Group")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Purchase Type";"Purchase Type")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Custodian Code";"Custodian Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Fund Code";"Fund Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Valuation Method";"Valuation Method")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("RBA Class";"RBA Class")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Purchase Link";"Purchase Link")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Sale Link";"Sale Link")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Interest Link";"Interest Link")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Sector;Sector)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Sector Description";"Sector Description")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //         group("Call Deposit Setting")
    //         {
    //             field("Issue Date";"Issue Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Investment Date";"Investment Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Maturity Period";"Maturity Period")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Maturity Period Days";"Maturity Period Days")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Maturity Date";"Maturity Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("No. Of Interest Periods";"No. Of Interest Periods")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Interest Frequency Period";"Interest Frequency Period")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Interest Rate Type";"Interest Rate Type")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Rate %";"Rate %")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Interest Calculation Based";"Interest Calculation Based")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Date Redeemed";"Date Redeemed")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Redeemed;Redeemed)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //         group("Call Deposit Valuation")
    //         {
    //             field("Current Value";"Current Value")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Revaluations;Revaluations)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Acquisition Cost";"Acquisition Cost")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Accrued Interest";"Accrued Interest")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Interest at purchase";"Interest at purchase")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Interest Received1";"Interest Received1")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Interest Recieved';
    //             }
    //             field("Gain/(Loss) on Disposal";"Gain/(Loss) on Disposal")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Face Value";"Face Value")
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
    //         action(Dimensions)
    //         {
    //             ApplicationArea = Basic;
    //             Image = Dimensions;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             RunObject = Page "Default Dimensions";
    //         }
    //         action(Buy)
    //         {
    //             ApplicationArea = Basic;
    //             Image = Apply;
    //             Promoted = true;
    //             PromotedCategory = Process;

    //             trigger OnAction()
    //             begin
                    
    //                 if Confirm('Are you sure you would like to PURCHASE this Money market?',false)= true then begin
                    
    //                 TestField("Purchase Link");
                    
    //                 /* RESET;
    //                 Purchase.RESET;
    //                 Purchase.SETRANGE(Purchase."Investment Payment Type",Purchase."Investment Payment Type"::Equity);
                    
    //                 Purchase.SETRANGE(Purchase."Investment No","No.");
    //                 Purchase.SETRANGE(Purchase.Posted,FALSE);
    //                 IF Purchase.FINDFIRST THEN BEGIN
                    
    //                 FORM.RUN(50123,Purchase);
    //                 END ELSE BEGIN
    //                  */
                    
                    
    //                 Purchase.Init;
    //                 Purchase.No:='';
    //                 Purchase.Date:=Today;
    //                 Purchase."Payement Type":="Purchase Link";
    //                 Purchase.Validate(Purchase."Payement Type");
    //                 Purchase.Institution:=Institution;
                    
    //                 Purchase."Investment No":="No.";
    //                 Purchase.Validate(Purchase."Investment No");
    //                 Purchase.Broker:=Broker;
    //                 Purchase."Pay Mode":='EFT';
    //                 Purchase.Validate(Purchase.Broker);
    //                 Purchase."Payment Type":=Purchase."payment type"::Normal;
    //                 Purchase.Status:=Purchase.Status::"Cheque Printing" ;
    //                 Purchase."Investment Payment Type":=Purchase."investment payment type"::"Money Market";
    //                 Purchase."Dimension Set ID":="Dimension Set ID";
    //                 Purchase.Insert(true);
    //                 Purchase.Validate(Purchase.Institution);
    //                 //Purchase.RESET;
    //                 //Purchase.SETRANGE(Purchase."Investment No","No.");
    //                 //FORM.RUN(54046,Purchase);
    //                 //END;
    //                 Page.Run(54056,Purchase);
    //                 end;

    //             end;
    //         }
    //         action(Redeem)
    //         {
    //             ApplicationArea = Basic;
    //             Image = Replan;
    //             Promoted = true;
    //             PromotedCategory = "Report";

    //             trigger OnAction()
    //             begin

    //                 //GLsetup.GET;
    //                 if Confirm('Are you sure you would like to REDEEM this Money market deposit?',false)= true then begin

    //                 CalcFields("Acquisition Cost",Revaluations,"Accrued Interest");

    //                 Sale.Init;
    //                 Sale.No:='';
    //                 Sale.Validate(Sale.No);
    //                 Sale.Date:=Today;
    //                 Sale."Receipt Type":="Sale Link";
    //                 Sale.Validate(Sale."Receipt Type");
    //                 Sale.Institution:=Institution;

    //                 Sale."Investment No":="No.";
    //                 Sale.Validate(Sale."Investment No");
    //                 Sale.Broker:=Broker;
    //                 Sale."Receipt No":='';
    //                 //Sale.VALIDATE(Sale."Receipt No");

    //                 //Sale."Receipt No":=INCSTR(GLsetup."Receipts No");

    //                  Sale.Amount:="Acquisition Cost";
    //                  Sale."Revaluation Gain/(Loss)":=Revaluations;
    //                  Sale."Accrued Interest":="Accrued Interest";
    //                  Sale."Cost-Temp":="Acquisition Cost";
    //                  Sale."Revaluation-Temp":=Revaluations;
    //                  Sale."Accrued Interest-Temp":="Accrued Interest";
    //                 Sale."Pay Mode":='EFT';
    //                 Sale.Validate(Sale.Broker);
    //                 Sale."Receipt Payment Type":=Sale."receipt payment type"::"Money Market";
    //                 Sale."Dimension Set ID":="Dimension Set ID";
    //                 Sale.Insert(true);
    //                 Sale.Validate(Sale.No);
    //                 Sale.Validate(Sale.Institution);
    //                 //Purchase.RESET;
    //                 //Purchase.SETRANGE(Purchase."Investment No","No.");
    //                 //FORM.RUN(54059,Sale);
    //                 Page.Run(54031,Sale);
    //                 end;
    //             end;
    //         }
    //         action("Accrued Interest")
    //         {
    //             ApplicationArea = Basic;
    //             Image = Revenue;
    //             Promoted = true;
    //             PromotedCategory = Process;

    //             trigger OnAction()
    //             begin
    //                 /*
    //                 BondCalc.RESET;
    //                 BondCalc.SETRANGE(BondCalc."FXD No","FDR Number");
    //                 BondCalc.SETRANGE(BondCalc."System Bond No","No.");
    //                 BondCalc.SETRANGE(BondCalc.Posted,FALSE);
                    
    //                 IF BondCalc.FIND('-') THEN BEGIN
    //                 //FORM.RUN(54060,BondCalc);
    //                 END ELSE BEGIN
    //                 BondCalc2.INIT;
    //                 BondCalc2."FXD No":="FDR Number";
    //                 BondCalc2."System Bond No":="No.";
    //                 CALCFIELDS("Acquisition Cost");
    //                 BondCalc2."Nominal Amount (Cost)":="Acquisition Cost";
    //                 BondCalc2.VALIDATE("System Bond No");
                    
    //                 BondCalc2.INSERT;
    //                 //FORM.RUN(54060,BondCalc2);
                    
    //                 END;/*/
    //                  Investment.Reset;
    //                  Investment.SetRange(Investment."No.","No.");
    //                  Report.Run(54066,true,true,Investment)

    //             end;
    //         }
    //         action(Revaluation)
    //         {
    //             ApplicationArea = Basic;

    //             trigger OnAction()
    //             begin

    //                 BondCalc.Reset;
    //                 BondCalc.SetRange(BondCalc."FXD No","FDR Number");
    //                 BondCalc.SetRange(BondCalc."System Bond No","No.");
    //                 BondCalc.SetRange(BondCalc.Posted,false);

    //                 if BondCalc.Find('-') then begin
    //                 //FORM.RUN(54058,BondCalc);
    //                 end else begin
    //                 BondCalc2.Init;
    //                 BondCalc2."FXD No":="FDR Number";
    //                 BondCalc2."System Bond No":="No.";
    //                 CalcFields("Acquisition Cost");
    //                 BondCalc2."Nominal Amount (Cost)":="Acquisition Cost";
    //                 BondCalc2.Validate("System Bond No");

    //                 BondCalc2.Insert;
    //                 //FORM.RUN(54058,BondCalc2);

    //                 end;
    //             end;
    //         }
    //         action("View Interest Schedule")
    //         {
    //             ApplicationArea = Basic;
    //             RunObject = Page "Interest Schedule1a";
    //             RunPageLink = "Investment No"=field("No.");
    //         }
    //         action("Receive Interest")
    //         {
    //             ApplicationArea = Basic;
    //             Image = ReceiptLines;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;

    //             trigger OnAction()
    //             begin

    //                 //GLsetup.GET;
    //                 if Confirm('Are you sure you would like to RECEIVE this Money market interest?',false)= true then begin

    //                 CalcFields("Accrued Interest");

    //                 Sale.Init;
    //                 Sale.No:='';
    //                 Sale.Validate(Sale.No);
    //                 Sale.Date:=Today;
    //                 Sale."Receipt Type":="Interest Link";
    //                 Sale.Validate(Sale."Receipt Type");
    //                 Sale.Institution:=Institution;

    //                 Sale."Investment No":="No.";
    //                 Sale.Validate(Sale."Investment No");
    //                 Sale.Broker:=Broker;
    //                 Sale."Receipt No":='';
    //                 //Sale.VALIDATE(Sale."Receipt No");

    //                 //Sale."Receipt No":=INCSTR(GLsetup."Receipts No");
    //                 Sale.Amount:="Accrued Interest";
    //                 Sale."Pay Mode":='EFT';
    //                 Sale.Validate(Sale.Broker);
    //                 Sale."Receipt Payment Type":=Sale."receipt payment type"::"Money Market";
    //                 Sale."Dimension Set ID":="Dimension Set ID";
    //                 Sale."Investment Transcation Type":=Sale."investment transcation type"::Interest;
    //                 Sale.Insert(true);
    //                 Sale.Validate(Sale.No);
    //                 Sale.Validate(Sale.Institution);
    //                 //Purchase.RESET;
    //                 //Purchase.SETRANGE(Purchase."Investment No","No.");
    //                 Page.Run(54031,Sale);

    //                 end;
    //             end;
    //         }
    //         action("Capitalize Gain/(Loss)")
    //         {
    //             ApplicationArea = Basic;
    //         }
    //         action(Rates)
    //         {
    //             ApplicationArea = Basic;
    //         }
    //         action(Rollover)
    //         {
    //             ApplicationArea = Basic;
    //         }
    //         action("Money market Prices")
    //         {
    //             ApplicationArea = Basic;
    //         }
    //     }
    // }

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin

    //      "Asset Type":="asset type"::"Money Market";
    //      "Investment Type":='04';
    //      Validate("Investment Type");
    //      "Deposit Type":="deposit type"::Call;

    //      UnitTrust:=true;
    // end;

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin

    //      "Asset Type":="asset type"::"Money Market";
    //      "Investment Type":='04';
    //      Validate("Investment Type");
    //      "Deposit Type":="deposit type"::Call;

    //      UnitTrust:=true;
    // end;

    // var
    //     Schedule: Record "Expected Interest1";
    //     NextInterestDate: Date;
    //     i: Integer;
    //     Investment: Record "Investment Asset";
    //     InvestSetup: Record "Investment Setup";
    //     Purchase: Record Payments1;
    //     Sale: Record Receipts;
    //     BondCalc: Record "Bond Calculator";
    //     BondCalc2: Record "Bond Calculator";
}

