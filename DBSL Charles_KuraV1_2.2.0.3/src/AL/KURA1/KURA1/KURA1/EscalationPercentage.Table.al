#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70242 "Escalation Percentage"
{
    DrillDownPageID = "Escalation Percentage";
    LookupPageID = "Escalation Percentage";

    fields
    {
        field(1; "Item Catecory"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code;

            trigger OnValidate()
            begin

                if xRec."Item Catecory" <> Rec."Item Catecory" then begin
                    FinanceEvaluationLine.Reset;
                    FinanceEvaluationLine.SetRange("Document ID", "Bid Register No");
                    if FinanceEvaluationLine.FindSet then begin
                        repeat
                            PurchaseLine.Reset;
                            PurchaseLine.SetRange("Document No.", FinanceEvaluationLine."No.");
                            PurchaseLine.SetRange("Document Type", PurchaseLine."document type"::Quote);
                            PurchaseLine.SetRange("Item Category Code", xRec."Item Catecory");
                            //PurchaseLine.SetRange("Contract Type", PurchaseLine."contract type"::Construction);
                            if PurchaseLine.FindSet then begin
                                repeat
                                    PurchaseLine."Escalation Percentage" := 0;
                                    PurchaseLine."Escalaleted Amount" := 0;
                                    PurchaseLine."Escalated By" := UserId;
                                    PurchaseLine."Escalated On" := CreateDatetime(Today, Time);
                                    PurchaseLine.Escalated := false;
                                    PurchaseLine.Modify(true);

                                until PurchaseLine.Next = 0;
                            end;

                        until FinanceEvaluationLine.Next = 0;
                    end;
                    ItemCategory.Reset;
                    ItemCategory.SetRange(Code, "Item Catecory");
                    if ItemCategory.Find('-') then
                        "Item Category Description" := ItemCategory.Description;
                    "Escalation Percentage" := 0;
                end else begin
                    ItemCategory.Reset;
                    ItemCategory.SetRange(Code, "Item Catecory");
                    if ItemCategory.Find('-') then
                        "Item Category Description" := ItemCategory.Description;
                    "Escalation Percentage" := 0;

                end;
            end;
        }
        field(2; "Escalation Percentage"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                FinanceEvaluationLine.Reset;
                FinanceEvaluationLine.SetRange("Document ID", "Bid Register No");
                if FinanceEvaluationLine.FindSet then begin
                    repeat
                        PurchaseLine.Reset;
                        PurchaseLine.SetRange("Document No.", FinanceEvaluationLine."No.");
                        PurchaseLine.SetRange("Document Type", PurchaseLine."document type"::Quote);
                        PurchaseLine.SetRange("Item Category Code", "Item Catecory");
                        //PurchaseLine.SetRange("Contract Type", PurchaseLine."contract type"::Construction);
                        if PurchaseLine.FindSet then begin
                            repeat
                                PurchaseLine."Escalation Percentage" := "Escalation Percentage";
                                PurchaseLine."Escalaleted Amount" := ((("Escalation Percentage" + 100) / 100) * PurchaseLine.Amount);
                                PurchaseLine."Escalated By" := UserId;
                                PurchaseLine."Escalated On" := CreateDatetime(Today, Time);
                                PurchaseLine.Escalated := true;
                                PurchaseLine.Modify(true);

                            until PurchaseLine.Next = 0;
                        end;

                    until FinanceEvaluationLine.Next = 0;
                end;
            end;
        }
        field(3; "Escalation Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Item Category Description"; Text[120])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Bid Register No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "IFS Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Item Catecory", "Bid Register No", "IFS Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        FinanceEvaluationLine.Reset;
        FinanceEvaluationLine.SetRange("Document ID", "Bid Register No");
        if FinanceEvaluationLine.FindSet then begin
            repeat
                PurchaseLine.Reset;
                PurchaseLine.SetRange("Document No.", FinanceEvaluationLine."No.");
                PurchaseLine.SetRange("Document Type", PurchaseLine."document type"::Quote);
                PurchaseLine.SetRange("Item Category Code", "Item Catecory");
                PurchaseLine.SetRange("Contract Type", PurchaseLine."contract type"::Construction);
                if PurchaseLine.FindSet then begin
                    repeat
                        PurchaseLine."Escalation Percentage" := 0;
                        PurchaseLine."Escalaleted Amount" := 0;
                        PurchaseLine."Escalated By" := UserId;
                        PurchaseLine."Escalated On" := CreateDatetime(Today, Time);
                        PurchaseLine.Escalated := false;
                        PurchaseLine.Modify(true);

                    until PurchaseLine.Next = 0;
                end;

            until FinanceEvaluationLine.Next = 0;
        end;
    end;

    var
        ItemCategory: Record "Item Category";
        FinanceEvaluationLine: Record "Finance Evaluation Line";
        PurchaseLine: Record "Purchase Line";
}

