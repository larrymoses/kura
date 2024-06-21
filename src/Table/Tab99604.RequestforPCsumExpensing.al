/// <summary>
/// Table Request for PC sum Expensing (ID 99604).
/// </summary>
table 99604 "Request for PC sum Expensing"
{
    Caption = 'Request for PC sum Expensing';

    DrillDownPageId = "Requests For PC Sum Expensing";
    LookupPageId = "Requests For PC Sum Expensing";
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(3; "Project ID"; Code[20])
        {
            Caption = 'Project ID';
            TableRelation = Job."No.";
            trigger OnValidate()
            var
                Jobs: Record Job;
            begin
                Jobs.Reset();
                Jobs.SetRange("No.", Rec."Project ID");
                if Jobs.FindFirst() then begin
                    Rec."Project Name" := Jobs.Description;
                    Rec."Contractor ID" :=Jobs."Contractor No.";
                    Rec."Contractor Name" := Jobs."Contractor Name";
                    Rec."CIT Comm No." :=Jobs."CIT Committee No.";
                    Rec.Validate("Region ID",Jobs."Global Dimension 1 Code");
                    Rec.Validate("Global Dimension 2 Code",Jobs."Global Dimension 1 Code");
                    Rec.Validate("Global Dimension 1 Code",Jobs."Global Dimension 1 Code");
                end;
            end;
        }
        field(4; "Project Name"; Text[100])
        {
            Caption = 'Project Name';
        }
        field(5; "Purchase Contract ID"; Code[20])
        {
            Caption = 'Purchase Contract ID';
        }
        field(6; "Contractor ID"; Code[20])
        {
            Caption = 'Contractor ID';
        }
        field(7; "Contractor Name"; Text[100])
        {
            Caption = 'Contractor Name';
        }
        field(8; "CIT Comm No."; Code[20])
        {
            Caption = 'CIT Comm No.';
        }
        field(9; "Region ID"; Code[20])
        {
            Caption = 'Region ID';
        }
        field(10; "Funding Source"; Code[50])
        {
            Caption = 'Funding Source';
        }

        field(11; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';

            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(12; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';

            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(13; Status; Enum "App Status")
        {

        }
        field(14; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(15; "Created By"; Code[50])
        {
            Editable = false;
            Caption = 'Created By';
        }

        field(16; "Created DateTime"; DateTime)
        {
            Editable = false;
            Caption = 'Created DateTime';
        }
        field(17; "Requested Total Amount"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Request for PC Sum Lines"."Total Requested Amount" where("Document No." = field("Document No.")));
        }
        field(18; "No. Series"; Code[20])
        {

        }
        field(19; "Document Type"; Enum "PC Document Type")
        {

        }
    }
    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        ProcurementSetup: Record "Procurement Setup";
    begin
        ProcurementSetup.Get();
        IF "Document No." = '' THEN BEGIN
            ProcurementSetup.GET;
            ProcurementSetup.TESTFIELD("Request for PCsumExpensing Nos");
            NoSeriesManagement.InitSeries(ProcurementSetup."Request for PCsumExpensing Nos", xRec."No. Series", TODAY, "Document No.", "No. Series");
        END;
        if Rec."Document Date" = 0D then
            Rec."Document Date" := WorkDate();
        Rec."Created By" := UserId;
        Rec."Created DateTime" := CurrentDateTime;
    end;

    var
        NoSeries: Record "No. Series";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    Procedure PostSumExpensing(PCSumExpensing: Record "Request for PC sum Expensing")
    var
        RequestForPCSumLines: Record "Request for PC Sum Lines";
        EvaluationPCSum: Record "Request for PC sum Expensing";
        EvaluationLines: Record "Request for PC Sum Lines";
    begin
        EvaluationPCSum.Init();
        EvaluationPCSum.Copy(PCSumExpensing);
        EvaluationPCSum."Document Type" := EvaluationPCSum."Document Type"::Evaluation;
        EvaluationPCSum."Document No." := '';
        if EvaluationPCSum.Insert(true) then begin
            RequestForPCSumLines.Reset();
            RequestForPCSumLines.SetRange("Document No.", PCSumExpensing."Document No.");
            RequestForPCSumLines.SetRange("Document Type", PCSumExpensing."Document Type");
            if RequestForPCSumLines.FindSet() then begin
                repeat
                    EvaluationLines.Init();
                    EvaluationLines.Copy(RequestForPCSumLines);
                    EvaluationLines."Document Type" := EvaluationPCSum."Document Type"::Evaluation;
                    EvaluationLines."Document No." := EvaluationPCSum."Document No.";
                    EvaluationLines.Insert();
                until RequestForPCSumLines.Next() = 0;
            end;
        end;
    end;

    procedure SubmittoProcurement(PCSumExpensing: Record "Request for PC sum Expensing")
    begin

    end;

    procedure NotifyRE(PCSumExpensing: Record "Request for PC sum Expensing")
    var
        Email: Codeunit Email;
        Mail: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        DocStream: Instream;
        Outs: Outstream;
        RecRef: RecordRef;
        fref: FieldRef;
        Body: Text;
        emailhdr: Text;
        Recepient: Text;
    begin
        emailhdr := '';
        Body := '';
        TempBlob.CreateOutstream(Outs);
        recRef.Open(Database::"Request for PC sum Expensing");
        fref := RecRef.field(1);
        fref.setrange(PCSumExpensing."Document No.");
        Report.SaveAs(Report::"Request for PC Sum Expensing", '', ReportFormat::PDF, Outs, RecRef);
        TempBlob.CreateInstream(DocStream);
        Mail.Create(Recepient, emailhdr, Body, TRUE);
        Mail.AddAttachment('Evaluation_' + PCSumExpensing."Document No." + '.pdf', 'PDF', DocStream);
        Email.Send(Mail);
    end;
}
