#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 95361 "Functional Disposal Plan"
{
    PageType = Card;
    SourceTable = "Annual Disposal plan Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Consolidate Disposal Plan"; "Consolidate Disposal Plan")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; "Document Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control21; "Disposal Plan Lines-f")
            {
                SubPageLink = "Disposal header" = field(No);//, "Disposal Catetory" = field("Disposal Catetory");
            }
        }
        area(factboxes)
        {
            part(Control15; "Purchase Order Subform")
            {
            }
            part(Control16; "Purch. Invoice Subform")
            {
            }
            systempart(Control17; Outlook)
            {
            }
            systempart(Control18; Notes)
            {
            }
            systempart(Control19; MyNotes)
            {
            }
            systempart(Control20; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
        area(navigation)
        {
            group("Procurement Plan")
            {
                Caption = 'Procurement Plan';
                action("Request for Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Approval';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //SendForApproval() ;
                    end;
                }
                action("<Action1000000041>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        // IF ApprovalMgt.SendPrcmntPlanApprovalRequest(Rec) THEN;
                    end;
                }
                action("<Action1000000042>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //IF ApprovalMgt.CancelPrcmntPlaApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                action("Copy Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Procurement Plan';
                    //  RunObject = Report UnknownReport57022;
                }
                action("Suggest Disposal Items")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        BookValue: Decimal;
                    begin
                        Rec.TestField("Global Dimension 1 Code");
                        Rec.TestField("Global Dimension 2 Code");
                        FixedAsset.Reset;
                        //  FixedAsset.SetRange("Suggested For Disposal", false);
                        // FixedAsset.SetRange("Marked for Disposal", true);
                        FixedAsset.SetRange("Global Dimension 1 Code", "Global Dimension 1 Code");
                        FixedAsset.SetRange("Global Dimension 2 Code", "Global Dimension 2 Code");
                        if FixedAsset.Find('-') then begin
                            repeat
                                BookValue := 0;
                                FADepreciationBook.Reset;
                                FADepreciationBook.SetRange("FA No.", FixedAsset."No.");
                                if FADepreciationBook.Find('-') then begin
                                    BookValue := GetBookValue(FADepreciationBook);
                                    // IF BookValue=0 THEN BEGIN
                                    //MESSAGE('Disposal Amount %1',BookValue);
                                    DisposalPlanLines.Reset;
                                    DisposalPlanLines.SetRange("Disposal header", Rec.No);
                                    if DisposalPlanLines.Find('-') then
                                        DisposalPlanLines.FindLast;

                                    LineNumber := DisposalPlanLines."Line No." + 1;
                                    DisposalPlanLinesN.Init;
                                    DisposalPlanLinesN."Disposal header" := Rec.No;
                                    DisposalPlanLinesN."Line No." := LineNumber;
                                    // DisposalPlanLinesN."Disposal Catetory" := DisposalPlanLinesN."disposal catetory"::"Functional Disposal";
                                    DisposalPlanLinesN."Market Value" := DisposalPlanLines."Market Value";
                                    DisposalPlanLinesN.Type := DisposalPlanLines.Type::"Fixed Asset";
                                    DisposalPlanLinesN."Item No." := FixedAsset."No.";
                                    DisposalPlanLinesN."Description of Item" := FixedAsset.Description;
                                    DisposalPlanLinesN."Estimated current value" := BookValue;
                                    DisposalPlanLinesN.Insert(true);
                                    //END;
                                end;
                                // FixedAsset."Suggested For Disposal" := true;
                                FixedAsset.Modify;
                            until FixedAsset.Next = 0;
                        end;
                        Message('Items Suggested Successfully');
                    end;
                }
                action("Import Disposal Plan")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = XMLport "Import Procurement Plan";
                }
                action("Update Budget Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Update Budget Entries';
                    Image = UpdateUnitCost;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        ProcPlanItem.Reset;
                        ProcPlanItem.SetRange(ProcPlanItem."Plan Year", Rec.No);
                        //ProcPlanItem.SETRANGE(Type,ProcPlanItem.Type::"G/L Account");
                        ProcPlanItem.SetFilter(ProcPlanItem."Estimated Cost", '<>%1', 0);
                        if ProcPlanItem.Find('-') then begin

                            repeat
                                BudgetEntries.Reset;
                                BudgetEntries.SetRange("Budget Name", ProcPlanItem."Plan Year");
                                BudgetEntries.SetRange("Procurement Item", ProcPlanItem."Plan Item No");
                                //BudgetEntries.SETRANGE("G/L Account No.",ProcPlanItem."No.");
                                if BudgetEntries.FindSet then begin
                                    BudgetEntries.Date := Rec."Start Date";
                                    BudgetEntries."Budget Name" := ProcPlanItem."Plan Year";

                                    //Update G/L if Item
                                    if ProcPlanItem.Type = ProcPlanItem.Type::Item then begin

                                        if ItemRec.Get(ProcPlanItem."No.") then begin
                                            GenPostingSetup.Reset;
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Bus. Posting Group", '');
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Prod. Posting Group", ItemRec."Gen. Prod. Posting Group");
                                            if GenPostingSetup.Find('+') then
                                                BudgetEntries."G/L Account No." := GenPostingSetup."Inventory Adjmt. Account";
                                        end;
                                    end;

                                    //Update GL if FA
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"Fixed Asset" then begin
                                        FADepreciation.Reset;
                                        FADepreciation.SetRange(FADepreciation."FA No.", ProcPlanItem."No.");
                                        if FADepreciation.Find('-') then
                                            if FAPostingGp.Get(FADepreciation."FA Posting Group") then
                                                if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                                    BudgetEntries."G/L Account No." := FAPostingGp."Acquisition Cost Account";
                                    end;

                                    //Update GL if GL
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                        BudgetEntries."G/L Account No." := ProcPlanItem."No.";

                                    BudgetEntries.Description := ProcPlanItem."Item Description";
                                    BudgetEntries."Global Dimension 1 Code" := ProcPlanItem."Department Code";
                                    //BudgetEntries."Global Dimension 2 Code":=ProcPlanItem."Global Dimension 2 Code";
                                    BudgetEntries.Amount := ProcPlanItem."Estimated Cost";
                                    BudgetEntries."Procurement Item" := ProcPlanItem."Plan Item No";
                                    if BudgetEntries.Amount <> 0 then
                                        BudgetEntries.Modify(true);
                                end else begin

                                    BudgetEntries.Init;
                                    BudgetEntries."Entry No." := 0;
                                    BudgetEntries.Date := Rec."Start Date";
                                    BudgetEntries."Budget Name" := ProcPlanItem."Plan Year";
                                    BudgetEntries."G/L Account No." := ProcPlanItem."No.";
                                    BudgetEntries.Description := ProcPlanItem."Item Description";
                                    BudgetEntries."Global Dimension 1 Code" := ProcPlanItem."Department Code";
                                    // BudgetEntries."Global Dimension 2 Code":=ProcPlanItem."Global Dimension 2 Code";
                                    BudgetEntries.Amount := ProcPlanItem."Estimated Cost";
                                    BudgetEntries."Procurement Item" := ProcPlanItem."Plan Item No";

                                    //Update G/L if Item
                                    if ProcPlanItem.Type = ProcPlanItem.Type::Item then begin

                                        if ItemRec.Get(ProcPlanItem."No.") then begin
                                            GenPostingSetup.Reset;
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Bus. Posting Group", '');
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Prod. Posting Group", ItemRec."Gen. Prod. Posting Group");
                                            if GenPostingSetup.Find('+') then
                                                BudgetEntries."G/L Account No." := GenPostingSetup."Inventory Adjmt. Account";
                                        end;
                                    end;

                                    //Update GL if FA
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"Fixed Asset" then begin
                                        FADepreciation.Reset;
                                        FADepreciation.SetRange(FADepreciation."FA No.", ProcPlanItem."No.");
                                        if FADepreciation.Find('-') then
                                            if FAPostingGp.Get(FADepreciation."FA Posting Group") then
                                                if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                                    BudgetEntries."G/L Account No." := FAPostingGp."Acquisition Cost Account";
                                    end;

                                    //Update GL if GL
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                        BudgetEntries."G/L Account No." := ProcPlanItem."No.";


                                    BudgetEntries.Insert(true);
                                end;


                            until ProcPlanItem.Next = 0;

                            Message('Update Complete!');

                        end;
                    end;
                }
                action(Consolidate)
                {
                    ApplicationArea = Basic;
                    Image = SelectEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        DisposalPlanLines.Reset;
                        DisposalPlanLines.SetRange("Disposal header", Rec.No);
                        if DisposalPlanLines.FindSet then begin
                            repeat
                                //
                                //     DisposalPlanLines.RESET;
                                //     IF DisposalPlanLines.FINDLAST THEN
                                //       LineNumber:=DisposalPlanLines."Line No."+1;
                                DisposalPlanLinesN.Init;
                                DisposalPlanLinesN.TransferFields(DisposalPlanLines);
                                DisposalPlanLinesN."Disposal header" := "Consolidate Disposal Plan";
                                // DisposalPlanLinesN."Disposal Catetory" := DisposalPlanLinesN."disposal catetory"::"Consolidated Disposal";
                                DisposalPlanLinesN.Insert(true);

                            until DisposalPlanLines.Next = 0;
                        end;
                        Message('Disposal Items Loaded to Consolidate Disposal Plans Successfully');
                    end;
                }
                action(Submit)
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        // Rec.TestField("Document Status", "document status"::Draft);
                        // if Confirm('Are you sure you want to submit ?', true) then begin
                        //     "Document Status" := "document status"::Submitted;
                        //     Message('Submitted Successfully');
                        // end;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Rec.No, Rec.No);
                        Report.Run(70130, true, true, Rec);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Disposal Catetory" := "disposal catetory"::"Functional Disposal";
    end;

    trigger OnOpenPage()
    begin
        "Disposal Catetory" := "disposal catetory"::"Functional Disposal";
    end;

    var
        ProcPlanItem: Record "Procurement Plan1";
        BudgetEntries: Record "Procurement Plan Entry1";
        GenPostingSetup: Record "General Posting Setup";
        FAPostingGp: Record "FA Posting Group";
        FADepreciation: Record "FA Depreciation Book";
        ItemRec: Record Item;
        Window: Dialog;
        FixedAsset: Record "Fixed Asset";
        FADepreciationBook: Record "FA Depreciation Book";
        DisposalPlanLines: Record "Disposal Plan Lines";
        LineNumber: Integer;
        DisposalPlanLinesN: Record "Disposal Plan Lines";
        Disposalheader: Record "Annual Disposal plan Header";

    local procedure GetBookValue(FADepreciationBook: Record "FA Depreciation Book"): Decimal
    begin
        if FADepreciationBook."Acquisition Date" > 0D then
            FADepreciationBook.CalcFields("Book Value");
        exit(FADepreciationBook."Book Value");

        //EXIT(FADepreciationBook."Book Value");
    end;
}
