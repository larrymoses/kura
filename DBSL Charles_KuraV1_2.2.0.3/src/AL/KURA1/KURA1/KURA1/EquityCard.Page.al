#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54001 "Equity Card"
{
    PageType = Card;
    SourceTable = "Investment Asset";
    SourceTableView = where("Asset Type" = const(Equity),
                            UnitTrust = const(false),
                            Offshore = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Institution; Institution)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Institution Name';
                }
                field("Investment Type"; "Investment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Investment Type Name"; "Investment Type Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Investment Posting Group"; "Investment Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Fund Code"; "Fund Code")
                {
                    ApplicationArea = Basic;
                }
                field("Custodian Code"; "Custodian Code")
                {
                    ApplicationArea = Basic;
                }
                field(Broker; Broker)
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
                field(Sector; Sector)
                {
                    ApplicationArea = Basic;
                }
                field("Sector Description"; "Sector Description")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Equity Evaluation Details")
            {
                field("No.Of Units"; "No.Of Units")
                {
                    ApplicationArea = Basic;
                }
                field("Unit value"; "Unit value")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Value"; "Current Value")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Value"; "Disposal Value")
                {
                    ApplicationArea = Basic;
                }
                field(Revaluations; Revaluations)
                {
                    ApplicationArea = Basic;
                }
                field("Gain/(Loss) on Disposal"; "Gain/(Loss) on Disposal")
                {
                    ApplicationArea = Basic;
                }
                field("Acquisition Cost"; "Acquisition Cost")
                {
                    ApplicationArea = Basic;
                }
                field(Cost; Cost)
                {
                    ApplicationArea = Basic;
                }
                field("Dividend Receivable"; "Dividend Receivable")
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
            action(Buy)
            {
                ApplicationArea = Basic;
                Image = Apply;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    //MESSAGE('yes');
                    if Confirm('Are you sure you would like to BUY this share?', false) = true then begin

                        TestField("Purchase Link");


                        /*RESET;
                       Purchase.RESET;
                       Purchase.SETRANGE(Purchase."Investment Payment Type",Purchase."Investment Payment Type"::Equity);

                       Purchase.SETRANGE(Purchase."Investment No","No.");
                       Purchase.SETRANGE(Purchase.Posted,FALSE);
                       IF Purchase.FINDFIRST THEN BEGIN

                       FORM.RUN(54046,Purchase);
                       END ELSE BEGIN
                        */
                        Purchase.Init;
                        Purchase.No := '';
                        //Purchase.VALIDATE(Purchase.No);
                        //Purchase.Date:=TODAY;
                        Purchase."Payement Type" := "Purchase Link";
                        Purchase.Validate(Purchase."Payement Type");
                        Purchase.Institution := Institution;
                        //Purchase.VALIDATE(Purchase.Institution);
                        Purchase."Investment No" := "No.";
                        Purchase.Validate(Purchase."Investment No");
                        Purchase.Broker := Broker;
                        Purchase."Pay Mode" := 'EFT';
                        Purchase.Validate(Purchase.Broker);
                        Purchase."Payment Type" := Purchase."payment type"::Normal;
                        Purchase.Status := Purchase.Status::"Cheque Printing";
                        Purchase."Investment Payment Type" := Purchase."investment payment type"::Equity;
                        Purchase."Dimension Set ID" := "Dimension Set ID";

                        Purchase.Insert(true);
                        Purchase.Validate(Purchase.Institution);
                        //Purchase.RESET;
                        //Purchase.SETRANGE(Purchase."Investment No","No.");
                        //************************FORM.RUN(54056,Purchase)***************************//;
                        Page.Run(54003, Purchase);
                        //END;
                    end;

                end;
            }
            action(Sale)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    //GLsetup.GET;
                    if Confirm('Are you sure you would like to SALE this share?', false) = true then begin


                        Sale.Init;
                        Sale.No := '';
                        Sale.Validate(Sale.No);
                        //Sale.Date:=TODAY;
                        Sale."Receipt Type" := "Sale Link";
                        Sale.Validate(Sale."Receipt Type");
                        Sale.Institution := Institution;
                        //Sale.VALIDATE(Sale.Institution);
                        Sale."Investment No" := "No.";
                        Sale.Validate(Sale."Investment No");
                        Sale.Broker := Broker;
                        Sale."Dimension Set ID" := "Dimension Set ID";
                        //Sale."Receipt No":='';
                        //Sale.VALIDATE(Sale."Receipt No");

                        //Sale."Receipt No":=INCSTR(GLsetup."Receipts No");

                        Sale."Pay Mode" := 'EFT';
                        Sale.Validate(Sale.Broker);
                        if "No.Of Units" > 0 then
                            Sale."Price Per Share" := "Current Value" / "No.Of Units";
                        Sale."Receipt Payment Type" := Sale."receipt payment type"::Equity;
                        Sale.Insert(true);
                        //Sale.VALIDATE(Sale.No);
                        //Sale.RESET;
                        Sale.Validate(Sale.Institution);
                        //Sale.SETRANGE(Sale."Investment No","No.");
                        Page.Run(54005, Sale);

                    end;
                end;
            }
            action("Dividend Schedule")
            {
                ApplicationArea = Basic;
                Image = Skills;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Dividend Payment";
                RunPageLink = "Investment No." = field("No.");
            }
            action("Shares Price")
            {
                ApplicationArea = Basic;
                Image = Change;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Interest Rates";
                RunPageLink = No = field("No.");
            }
            action("Shares Split")
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Shares Split";
                RunPageLink = "Investment No" = field("No.");
            }
            action(Bonus)
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page Bonus;
                RunPageLink = "Investment No" = field("No.");
            }
            action(Dimensions)
            {
                ApplicationArea = Suite;
                Caption = 'Dimensions';
                // Image = Dimensions;
                // RunObject = Page "Default Dimensions";
                // RunPageLink = "Table ID"=const(54001),
                //               "No."=field("No.");
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin

        CalcFields("Current Value");
        CalcFields("No.Of Units");

        if "No.Of Units" <> 0 then
            UnitCost := ROUND("Current Value" / "No.Of Units", 0.01)
        // MESSAGE('%1',UnitCost);
        else
            UnitCost := 0;
        "Unit value" := UnitCost;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Asset Type" := "asset type"::Equity;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Asset Type" := "asset type"::Equity;
    end;

    var
        Purchase: Record Payments1;
        GenJnline: Record "Gen. Journal Line";
        DefaultDim: Record "Default Dimension";
        RevaluationTable: Record "Receipts and Payment Types";
        RevaluationGainLoss: Decimal;
        Property: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        UnitCost: Decimal;
        FA: Record "Investment Asset";
        Sale: Record Receipts;
        GLsetup: Record "General Ledger Setup";
}

