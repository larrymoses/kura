table 99469 "Vendor Appraisal Voucher"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {

            Description = 'Linked to Vendor Debarment & Vendor Reinstatement Voucher No. Series';

            trigger OnValidate()
            begin
                IF "Document No" <> '' THEN BEGIN
                    ProcurementSetup.TESTFIELD("Vendor Appraisal Nos");
                    NoMgt.TestManual(ProcurementSetup."Vendor Appraisal Nos");
                    "No. Series" := ''
                END;
            end;
        }
        field(2; "Document Type"; Option)
        {

            Description = 'This field shall have different captions on Debarment ("Blacklisted By") or Reinstatement ("Reinstated By) vouchers';
            OptionCaption = 'Debarment,Reinstatement';
            OptionMembers = Debarment,Reinstatement;
        }
        field(3; "Source Type"; Option)
        {

            OptionCaption = ',Internal(Procuring Entity),Procurement Regulator,External 3rd Party';
            OptionMembers = ,"Internal(Procuring Entity)","Procurement Regulator","External 3rd Party";
        }
        field(4; Description; Text[80])
        {

        }
        field(5; "Document Date"; Date)
        {

        }
        field(6; "External Document No"; Code[30])
        {

            Description = 'For external references such as Memo etc';
        }
        field(7; "Approval Status"; Enum "App Status")
        {

            Editable = false;
            // OptionCaption = 'Open,Pending Approval,Released';
            // OptionMembers = Open,"Pending Approval",Released;
        }
        field(8; Posted; Boolean)
        {

            Editable = false;
        }
        field(9; "Created By"; Code[50])
        {

            Editable = false;
        }
        field(10; "Created Date"; Date)
        {

            Editable = false;
        }
        field(11; "Created Time"; Time)
        {

            Editable = false;
        }
        field(12; "No. Series"; Code[20])
        {

        }
        field(36; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                
                PurchaseReqDet.VALIDATE(PurchaseReqDet."No."); */

            end;
        }
        field(37; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                 END;*/

            end;
        }
        field(38; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';

            trigger OnValidate()
            begin
                Dimen := "Global Dimension 3 Code";
                Dimen := COPYSTR(Dimen, 1, 3);
                "Global Dimension 2 Code" := Dimen;
                Dimens := "Global Dimension 3 Code";
                Dimens := COPYSTR(Dimens, 1, 1);
                "Global Dimension 1 Code" := Dimens;
            end;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';

            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Global Dimension 2 Code");
            end;
        }
        field(481; "Vendor No."; Code[30])
        {

            TableRelation = Vendor."No." WHERE("Vendor Type" = filter(<> Director));

            trigger OnValidate()
            begin
                IF vend.GET("Vendor No.") THEN
                    "Vendor Name" := vend.Name;
            end;
        }
        field(500; "GRN No."; Code[30])
        {

            TableRelation = "Purch. Rcpt. Header"."No.";
            trigger OnValidate()
            VAR
                GRN: Record "Purch. Rcpt. Header";
            begin
                IF GRN.GET("GRN No.") THEN
                    REC."Vendor No." := GRN."Buy-from Vendor No.";
                Validate("Vendor No.");

            end;
        }
        field(482; "Vendor Name"; Text[250])
        {

        }
        field(483; "Appraisal Period"; Code[30])
        {
            TableRelation = "Vendor Appraisal Period"."Period Code";
        }
        field(484; "Tendor Category"; Code[10])
        {

            TableRelation = "Procurement Category".Code;

            trigger OnValidate()
            begin
                IF TendCate.GET("Tendor Category") THEN
                    "Tender Category Description" := TendCate.Description;
            end;
        }
        field(485; "Evaluation Template"; Code[10])
        {

            TableRelation = "Bid Scoring Template".Code where("Template type" = const("Supplier Performance Review"));

            trigger OnValidate()
            var
                BidScoreCriteriaGroup: Record "Bid Score Criteria Group";
            begin
                VendorScoreEntry.RESET;
                IF VendorScoreEntry.FINDLAST THEN
                    LineNo := VendorScoreEntry."Line No";

                VendorScoreEntry.RESET;
                VendorScoreEntry.SETRANGE("Bid Scoring Document No.", "Evaluation Template");
                VendorScoreEntry.SETRANGE(Code, "Document No");
                IF VendorScoreEntry.FINDSET THEN BEGIN
                    VendorScoreEntry.DELETEALL;

                END;

                BidSCoreGuide.RESET;
                BidSCoreGuide.SETRANGE("Template ID", "Evaluation Template");
                BidSCoreGuide.SETRANGE("Evaluation Type", BidSCoreGuide."Evaluation Type"::"Vendor Appraisal");
                IF BidSCoreGuide.FINDSET() THEN BEGIN
                    REPEAT
                        VendorScoreEntry.INIT;
                        VendorScoreEntry.Code := "Document No";
                        VendorScoreEntry."Line No" := LineNo + 1;
                        VendorScoreEntry."Vendor No." := "Vendor No.";
                        VendorScoreEntry."Criteria Group" := BidSCoreGuide."Criteria Group ID";
                        VendorScoreEntry."Criteria Group ID" := BidSCoreGuide."Criteria Group ID";
                        VendorScoreEntry."Criteria Description" := BidSCoreGuide."Criteria Group Description";
                        BidScoreCriteriaGroup.Reset();
                        BidScoreCriteriaGroup.SetRange("Criteria Group ID", BidSCoreGuide."Criteria Group ID");
                        if BidScoreCriteriaGroup.FindFirst() then
                            VendorScoreEntry."Criteria Description" := BidScoreCriteriaGroup.Description;
                        VendorScoreEntry."Requirement ID" := BidSCoreGuide."Requirement ID";
                        VendorScoreEntry."Evaluation Requirement" := BidSCoreGuide."Evaluation Requirement";
                        VendorScoreEntry."Rating Type" := BidSCoreGuide."Rating Type";
                        VendorScoreEntry."Target Qty" := BidSCoreGuide."Target Qty";
                        VendorScoreEntry."Target Value/KPI" := BidSCoreGuide."Target Value";
                        VendorScoreEntry."Unit of Measure" := BidSCoreGuide."Unit of Measure";
                        VendorScoreEntry."Assigned Weight %" := BidSCoreGuide."Assigned Weight %";
                        VendorScoreEntry."Equipment Type" := BidSCoreGuide."Equipment Type";
                        VendorScoreEntry."Desired Perfomance Direction" := BidSCoreGuide."Desired Perfomance Direction";
                        VendorScoreEntry."Bid Scoring Document No." := "Evaluation Template";
                        VendorScoreEntry.INSERT(TRUE);
                        LineNo += 1;
                    UNTIL BidSCoreGuide.NEXT = 0;
                END;
            end;
        }
        field(486; "Tender Category Description"; Text[100])
        {

        }
        field(487; Remarks; Text[30])
        {

        }
        field(488; "Recommendation(s)"; Text[250])
        {

        }
        field(489; "Suggested Areas of Imprevement"; Text[250])
        {

        }
        FIELD(490; "Appraisal Method"; ENUM "Appraisal Methods")

        {

        }
        field(491; "Inspection No."; code[50])
        {
            TableRelation = "Inspection Header1"."Inspection No";
            trigger OnValidate()
            var
                inspection: record "Inspection Header1";
                LPO: RECORD 38;
                PRN: Record 38;
            begin

                if inspection.get(rec."Inspection No.") then begiN

                    rec."Vendor nAME" := inspection."Supplier Name";
                    LPO.RESET;
                    LPO.SetRange("No.", inspection."Contract/Order No");
                    IF LPO.FindSet() THEN BEGIN
                        REC."Vendor No." := LPO."Buy-from Vendor No.";
                        VALIDATE("Vendor No.");

                        PRN.Reset();
                        PRN.SetRange("Ordered PRN", LPO."Ordered PRN");
                        IF PRN.FindSet() THEN begin
                            REC."Tendor Category" := PRN."PP Planning Category";
                            REC.Validate("Tendor Category");
                        end;

                    END;
                END;

            END;

        }
    }
    keys
    {
        key(Key1; "Document No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "Document No" = '' THEN BEGIN
            ProcurementSetup.GET;
            ProcurementSetup.TESTFIELD("Vendor Appraisal Nos");
            NoMgt.InitSeries(ProcurementSetup."Vendor Appraisal Nos", xRec."No. Series", 0D, "Document No", "No. Series");
        END;
        "Document Date" := WorkDate();
        "Created By" := USERID;
        "Created Date" := TODAY;
        "Created Time" := TIME;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
        Dimen: Text;
        Dimens: Text;
        vend: Record Vendor;
        TendCate: Record "Procurement Category";
        VendorAppraisalVoucher: Record "Vendor Appraisal Voucher";
        VendorEvaluationScoreEntry: Record "Vendor Evaluation Score Entry";
        VendorScoreEntry: Record "Vendor Evaluation Score Entry";
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        BidScore: Record "Bid Score Guide";
        BidEvaluationCriteria: Record "Bid Evaluation Criteria Group";
        EvaluationCriteria: Record "Bid Score Criteria Group";
        BidEvalScore: Record "Bid Evaluation Score Guide";
        BidEvaluationregister: Record "Bid Evaluation Register";
        BidOpening: Record "Bid Opening Register";
        UserSetup: Record "User Setup";
        Emp: Record Employee;

    [Scope('Personalization')]
    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", STRSUBSTNO('%1 %2', "Document Type", "Document No"),
            "Global Dimension 1 Code", "Global Dimension 2 Code");

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;
}

