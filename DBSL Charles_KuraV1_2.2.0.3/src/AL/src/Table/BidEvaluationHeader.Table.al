#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70239 "Bid Evaluation Header"
{
    DrillDownPageID = "Bid Evaluation Register List";
    LookupPageID = "Bid Evaluation Register List";

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.TestField("Bid Opening Nos");
                    NoMgt.TestManual(ProcurementSetup."Bid Opening Nos");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "Evaluation Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Preliminary Evaluation,Technical Evaluation,Financial Evaluation,Due Dilligence';
            OptionMembers = "Preliminary Evaluation","Technical Evaluation","Financial Evaluation","Due Dilligence";
        }
        field(3; "Evaluator Category"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Evaluation Committee,Individual Evaluator';
            OptionMembers = "Evaluation Committee","Individual Evaluator";
        }
        field(4; "Evaluation Lead"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Resource."No.";
        }
        field(5; "Evaluation Lead Name"; Text[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(10; "Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Evaluation Venue"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "IFS Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            var
                bidopen: Record "Bid Opening Register";
                bideval: Record "Bid Evaluation Register";

            begin
                IFS.Reset;
                IFS.SetRange(Code, "IFS Code");
                if IFS.FindSet then begin

                    "Document Status" := "document status"::Active;
                    "Evaluation Date" := Today;
                    //"Tender Evaluation Committee" := IFS."Bid Evaluation Committe";
                    //"Tender Opening Committee" := IFS."Bid Opening Committe";
                    "Bid Evaluation Criteria" := IFS."Bid Scoring Template";
                    "Last Evaluation Version No." := IFS."Last Evaluation Version No.";
                    //"Purchaser Code":=IFS."Purchaser Code";
                    Description := 'Evaluation of ' + "IFS Code" + ' ' + IFS."Tender Name";
                    Validate("Tender Evaluation Committee");

                end;

                bidopen.Reset;
                bidopen.SetRange("IFS Code", rec."IFS Code");
                if bidopen.FindSet then begin
                    "Tender Opening Committee" := bidopen."Appointed Bid Opening Com";
                end;

                bideval.Reset;
                bideval.SetRange("IFS Code", rec."IFS Code");
                if bideval.FindSet then begin
                    "Tender evaluation Committee" := bideval."Appointed Bid Evaluation Commi";
                end;

                //MESSAGE('WHATSUP');
            end;
        }
        field(28; "Tender Evaluation Comm Remarks"; Text[80])
        {
            DataClassification = ToBeClassified;
            Description = 'Tender Evaluation Committee Remarks';
        }
        field(29; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Cancelled';
            OptionMembers = Active,Cancelled;
        }
        field(30; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(32; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(34; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(35; "Posted By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(36; "Posted Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(46; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(47; "Tender Opening Committee"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Tender Evaluation Committee"; Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                IFSTenderCommitteeMember.Reset;
                IFSTenderCommitteeMember.SetRange("Document No.", "Tender Evaluation Committee");
                IFSTenderCommitteeMember.SetRange(Role, IFSTenderCommitteeMember.Role::Chairperson);
                if IFSTenderCommitteeMember.FindFirst then begin
                    "Evaluation Lead" := IFSTenderCommitteeMember."Member No.";
                    "Evaluation Lead Name" := IFSTenderCommitteeMember."Member Name";
                end;
            end;
        }
        field(49; "Bid Evaluation Criteria"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50; "Total Evaluated Bids"; Integer)
        {
            CalcFormula = count("Bid Evaluation Register" where("Evaluation Type" = field("Evaluation Type"),
                                                                 "IFS Code" = field("IFS Code"),
                                                                 "Last Evaluation Version No." = field("Last Evaluation Version No.")));
            FieldClass = FlowField;
        }
        field(51; "No Failed Preliminary"; Integer)
        {
            CalcFormula = count("Bid Evaluation Register" where("Evaluation Type" = field("Evaluation Type"),
                                                                 "IFS Code" = field("IFS Code"),
                                                                 "Preliminary Evaluation Score" = filter("Non-Responsive"),
                                                                 "Last Evaluation Version No." = field("Last Evaluation Version No.")));
            FieldClass = FlowField;
        }
        field(52; "No Passed Preliminary"; Integer)
        {
            CalcFormula = count("Bid Evaluation Register" where("Evaluation Type" = field("Evaluation Type"),
                                                                 "IFS Code" = field("IFS Code"),
                                                                 "Preliminary Evaluation Score" = filter(Responsive),
                                                                 "Last Evaluation Version No." = field("Last Evaluation Version No.")));
            FieldClass = FlowField;
        }
        field(53; "No Failed Technical"; Integer)
        {
            CalcFormula = count("Bid Evaluation Register" where("Evaluation Type" = field("Evaluation Type"),
                                                                 "IFS Code" = field("IFS Code"),
                                                                 "Technical Evaluation  Decision" = filter(Fail),
                                                                 "Last Evaluation Version No." = field("Last Evaluation Version No.")));
            FieldClass = FlowField;
        }
        field(54; "No Passed Technical"; Integer)
        {
            CalcFormula = count("Bid Evaluation Register" where("Evaluation Type" = field("Evaluation Type"),
                                                                 "IFS Code" = field("IFS Code"),
                                                                 "Technical Evaluation  Decision" = filter(Pass),
                                                                 "Last Evaluation Version No." = field("Last Evaluation Version No.")));
            FieldClass = FlowField;
        }
        field(55; "Last Evaluation Version No."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(56; "Primary Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // fieldgroup(DropDown;Field6,"IFS Code",Field8,Description)
        // {
        // }
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("Bid Opening Nos");
            NoMgt.InitSeries(ProcurementSetup."Bid Opening Nos", xRec."No. Series", 0D, Code, "No. Series");
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Evaluation Date" := Today;
        "Created Time" := Time;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then
            "Primary Region" := UserSetup."Purchase Resp. Ctr. Filter";
    end;

    trigger OnModify()
    begin
        // CALCFIELDS("No of Passed Requirements");
        // CALCFIELDS("No of Requirements");
        // IF "No of Passed Requirements"<>xRec."No of Passed Requirements" THEN BEGIN
        // Nopassreq:="No of Passed Requirements";
        // Allreq:="No of Requirements";
        // IF Nopassreq=Allreq THEN BEGIN
        //  "Preliminary Evaluation Score":="Preliminary Evaluation Score"::Responsive;
        //  MODIFY(TRUE);
        //  END ELSE BEGIN
        //    "Preliminary Evaluation Score":="Preliminary Evaluation Score"::"Non-Responsive";
        //    MODIFY(TRUE);
        //    END;
        //    END;
    end;

    var
        bidopen: Record "Bid Opening Register";
        bideval: Record "Bid Evaluation Register";
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        IFS: Record "Standard Purchase Code";
        IFSTenderCommitte: Record "IFS Tender Committee Member";
        BidCommitte: Record "Bid Evaluation Committee";
        Bids: Record "Purchase Header";
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
        IndividualEvaluationMatrix: Record "Individual Evaluation Matrix";
        Nopassreq: Integer;
        Allreq: Integer;
        IFSTenderCommitteeMember: Record "IFS Tender Committee Member";
}

