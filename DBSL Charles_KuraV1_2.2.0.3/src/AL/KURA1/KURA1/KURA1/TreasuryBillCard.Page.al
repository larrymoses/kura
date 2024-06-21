#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54025 "Treasury Bill Card"
{
    PageType = Card;
    SourceTable = "Investment Asset";
    SourceTableView = where("Asset Type" = const("Money Market"),
                            "Investment Type" = const('05'));

    layout
    {
        area(content)
        {
            group("Treasury Deposit Definition")
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Institution; Institution)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Description 2"; "Description 2")
                {
                    ApplicationArea = Basic;
                }
                field("Investment Type"; "Investment Type")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field("Investment Type Name"; "Investment Type Name")
                {
                    ApplicationArea = Basic;
                }
                field("FDR Number"; "FDR Number")
                {
                    ApplicationArea = Basic;
                }
                field("Investment Posting Group"; "Investment Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Type"; "Purchase Type")
                {
                    ApplicationArea = Basic;
                }
                field("Custodian Code"; "Custodian Code")
                {
                    ApplicationArea = Basic;
                }
                field("Fund Code"; "Fund Code")
                {
                    ApplicationArea = Basic;
                }
                field("Valuation Method"; "Valuation Method")
                {
                    ApplicationArea = Basic;
                }
                field("RBA Class"; "RBA Class")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Link"; "Purchase Link")
                {
                    ApplicationArea = Basic;
                }
                field("Sale Link"; "Sale Link")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Link"; "Interest Link")
                {
                    ApplicationArea = Basic;
                }
                field(Sector; Sector)
                {
                    ApplicationArea = Basic;
                }
                field("Sector Description"; "Sector Description")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Treasury Deposit Setting")
            {
                field("Issue Date"; "Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field("Investment Date"; "Investment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Period"; "Maturity Period")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Period Days"; "Maturity Period Days")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Date"; "Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Interest Periods"; "No. Of Interest Periods")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Frequency Period"; "Interest Frequency Period")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Rate Type"; "Interest Rate Type")
                {
                    ApplicationArea = Basic;
                }
                field("Rate %"; "Rate %")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Calculation Based"; "Interest Calculation Based")
                {
                    ApplicationArea = Basic;
                }
                field("Date Redeemed"; "Date Redeemed")
                {
                    ApplicationArea = Basic;
                }
                field(Redeemed; Redeemed)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Treasury Deposit Valuation")
            {
                field("Current Value"; "Current Value")
                {
                    ApplicationArea = Basic;
                }
                field(Revaluations; Revaluations)
                {
                    ApplicationArea = Basic;
                }
                field("Acquisition Cost"; "Acquisition Cost")
                {
                    ApplicationArea = Basic;
                }
                // field("Accrued Interest"; "Accrued Interest")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Interest at purchase"; "Interest at purchase")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Received1"; "Interest Received1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Interest Recieved';
                }
                field("Gain/(Loss) on Disposal"; "Gain/(Loss) on Disposal")
                {
                    ApplicationArea = Basic;
                }
                field("Discounted Original Amt"; "Discounted Original Amt")
                {
                    ApplicationArea = Basic;
                }
                field("Gain or Loss On TB Sales"; "Gain or Loss On TB Sales")
                {
                    ApplicationArea = Basic;
                }
                field("Face Value"; "Face Value")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Dimensions)
            {
                ApplicationArea = Suite;
                Caption = 'Dimensions';
                Image = Dimensions;
                // RunObject = Page "Default Dimensions";
                // RunPageLink = "Table ID"=const(54001),
                //               "No."=field("No.");
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
            }
            action(Buy)
            {
                ApplicationArea = Basic;
                Image = Apply;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    if Confirm('Are you sure you would like to PURCHASE this Money market?', false) = true then begin

                        TestField("Purchase Link");

                        /* RESET;
                        Purchase.RESET;
                        Purchase.SETRANGE(Purchase."Investment Payment Type",Purchase."Investment Payment Type"::Equity);

                        Purchase.SETRANGE(Purchase."Investment No","No.");
                        Purchase.SETRANGE(Purchase.Posted,FALSE);
                        IF Purchase.FINDFIRST THEN BEGIN

                        FORM.RUN(50123,Purchase);
                        END ELSE BEGIN
                         */


                        Purchase.Init;
                        Purchase.No := '';
                        Purchase.Date := Today;
                        Purchase."Payement Type" := "Purchase Link";
                        Purchase.Validate(Purchase."Payement Type");
                        Purchase.Institution := Institution;

                        Purchase."Investment No" := "No.";
                        Purchase.Validate(Purchase."Investment No");
                        Purchase.Broker := Broker;
                        Purchase."Pay Mode" := 'EFT';
                        Purchase.Validate(Purchase.Broker);
                        Purchase."Payment Type" := Purchase."payment type"::Normal;
                        Purchase.Status := Purchase.Status::"Cheque Printing";
                        Purchase."Investment Payment Type" := Purchase."investment payment type"::"Money Market";
                        Purchase."Dimension Set ID" := "Dimension Set ID";
                        Purchase.Insert(true);
                        Purchase.Validate(Purchase.Institution);
                        //Purchase.RESET;
                        //Purchase.SETRANGE(Purchase."Investment No","No.");
                        //FORM.RUN(54046,Purchase);
                        //END;
                        Page.Run(54056, Purchase);
                    end;

                end;
            }
            action(Redeem)
            {
                ApplicationArea = Basic;
                Image = Replan;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin

                    //GLsetup.GET;
                    if Confirm('Are you sure you would like to REDEEM this Money market deposit?', false) = true then begin

                        CalcFields("Acquisition Cost", Revaluations, "Accrued Interest");

                        Sale.Init;
                        Sale.No := '';
                        Sale.Validate(Sale.No);
                        Sale.Date := Today;
                        Sale."Receipt Type" := "Sale Link";
                        Sale.Validate(Sale."Receipt Type");
                        Sale.Institution := Institution;

                        Sale."Investment No" := "No.";
                        Sale.Validate(Sale."Investment No");
                        Sale.Broker := Broker;
                        Sale."Receipt No" := '';
                        //Sale.VALIDATE(Sale."Receipt No");

                        //Sale."Receipt No":=INCSTR(GLsetup."Receipts No");

                        // Sale.Amount:="Acquisition Cost"; //commented by Morris
                        Sale.Amount := "Acquisition Cost" + "Accrued Interest" + "Gain or Loss On TB Sales";
                        Sale."Revaluation Gain/(Loss)" := Revaluations;
                        Sale."Gain/(Loss) on TBill Disposal" := "Gain or Loss On TB Sales";
                        Sale."Accrued Interest" := "Accrued Interest";
                        Sale."Cost-Temp" := "Acquisition Cost";
                        Sale."Revaluation-Temp" := Revaluations;
                        Sale."Accrued Interest-Temp" := "Accrued Interest";
                        Sale."Pay Mode" := 'EFT';
                        Sale.Validate(Sale.Broker);
                        Sale."Receipt Payment Type" := Sale."receipt payment type"::"Money Market";
                        Sale."Dimension Set ID" := "Dimension Set ID";
                        Sale.Insert(true);
                        Sale.Validate(Sale.No);
                        Sale.Validate(Sale.Institution);
                        //Purchase.RESET;
                        //Purchase.SETRANGE(Purchase."Investment No","No.");
                        //FORM.RUN(54059,Sale);
                        Page.Run(54031, Sale);
                    end;
                end;
            }
            action("Accrued Interests")
            {
                ApplicationArea = Basic;
                Image = Revenue;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    TestField("Discounted Original Amt");

                    Investment.Reset;
                    Investment.SetRange(Investment."No.", "No.");
                    Report.Run(54066, true, true, Investment)
                end;
            }
            action(Revaluation)
            {
                ApplicationArea = Basic;
            }
            action("View Interest Schedule")
            {
                ApplicationArea = Basic;
                RunObject = Page "Interest Schedule1a";
                RunPageLink = "Investment No" = field("No.");
            }
            action("Receive Interest")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    //GLsetup.GET;
                    if Confirm('Are you sure you would like to RECEIVE this Money market interest?', false) = true then begin


                        Sale.Init;
                        Sale.No := '';
                        Sale.Validate(Sale.No);
                        Sale.Date := Today;
                        Sale."Receipt Type" := "Interest Link";
                        Sale.Validate(Sale."Receipt Type");
                        Sale.Institution := Institution;

                        Sale."Investment No" := "No.";
                        Sale.Validate(Sale."Investment No");
                        Sale.Broker := Broker;
                        Sale."Receipt No" := '';
                        //Sale.VALIDATE(Sale."Receipt No");

                        //Sale."Receipt No":=INCSTR(GLsetup."Receipts No");
                        Sale.Amount := "Accrued Interest";
                        Sale."Pay Mode" := 'EFT';
                        Sale.Validate(Sale.Broker);
                        Sale."Receipt Payment Type" := Sale."receipt payment type"::"Money Market";
                        Sale."Dimension Set ID" := "Dimension Set ID";
                        Sale.Insert(true);
                        Sale.Validate(Sale.No);
                        Sale.Validate(Sale.Institution);
                        //Purchase.RESET;
                        //Purchase.SETRANGE(Purchase."Investment No","No.");
                        Page.Run(54031, Sale);

                    end;
                end;
            }
            action("Capitalize Gain/(Loss)")
            {
                ApplicationArea = Basic;
            }
            action(Rates)
            {
                ApplicationArea = Basic;
            }
            action(Rollover)
            {
                ApplicationArea = Basic;
            }
            action("Money market Prices")
            {
                ApplicationArea = Basic;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        "Asset Type" := "asset type"::"Money Market";
        "Investment Type" := '05';
        Validate("Investment Type");
        //"Deposit Type":="Deposit Type"::Fixed;

        UnitTrust := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        "Asset Type" := "asset type"::"Money Market";
        "Investment Type" := '05';
        Validate("Investment Type");
        //"Deposit Type":="Deposit Type"::Fixed;

        UnitTrust := true;
    end;

    var
        Schedule: Record "Expected Interest1";
        NextInterestDate: Date;
        i: Integer;
        Investment: Record "Investment Asset";
        InvestSetup: Record "Investment Setup";
        Purchase: Record Payments1;
        Sale: Record Receipts;
        BondCalc: Record "Bond Calculator";
        BondCalc2: Record "Bond Calculator";
}

