#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Table 70047 "Disposal Header"
{
    DrillDownPageID = "Disposal List";
    LookupPageID = "Disposal List";

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF No<>'' THEN
                //  BEGIN
                //    SalessSetup.TESTFIELD("Inst. Accreditation Nos.");
                //    NoMgt.TestManual(SalessSetup."Inst. Accreditation Nos.");
                //     "No Series":=''
                //    END;
            end;
        }
        field(2; Title; Text[100])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //Title:=LOWERCASE(Title);
            end;
        }
        field(3; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Closing Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Approved;
        }
        field(7; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Rejected By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Rejected Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(12; "Reason For Disposal"; Text[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Reason For Disposal" := UpperCase("Reason For Disposal");
            end;
        }
        field(13; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1),
                                                          Blocked = const(false),
                                                          "Dimension Value Type" = const(Standard));
        }
        field(14; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));
        }
        field(15; "Select Customer"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if xRec."Select Customer" <> Rec."Select Customer" then begin
                    "Customer Name" := '';
                end;
                if Customer.Get("Select Customer") then
                    "Customer Name" := Customer.Name;
            end;
        }
        field(16; "Customer Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Sales Order Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Disposal Plan"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Disposal plan Header".No;// where ("Disposal Catetory"=const("Consolidated Disposal"));
        }
        field(19; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Employee."No.";
        }
        field(20; "Employee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("Disposal Requisition Nos");
            NoMgt.InitSeries(ProcurementSetup."Disposal Requisition Nos", xRec."No Series", 0D, No, "No Series");
        end;
        "No Series" := ProcurementSetup."Disposal Requisition Nos";
        "Created By" := UserId;
        "Created Date" := Today;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then
            "Created By" := UserId;
        "Employee No" := UserSetup."Employee No.";
        "Employee Name" := UserSetup."Employee Name";
        "Created Date" := Today;
        Date := Today;
        Employees.Reset;
        Employees.SetRange("No.", UserSetup."Employee No.");
        if Employees.FindSet then
            "Global Dimension 1 Code" := Employees."Global Dimension 1 Code";
        "Global Dimension 2 Code" := Employees."Global Dimension 2 Code";
        Title := 'Disposal Request';
    end;

    var
        NoMgt: Codeunit NoSeriesManagement;
        SalessSetup: Record "Sales & Receivables Setup";
        DisposalLines: Record "Disposal Lines";
        Customer: Record Customer;
        ProcurementSetup: Record "Procurement Setup";
        UserSetup: Record "User Setup";
        Employees: Record Employee;


    procedure FnCheckLines("DocumentNo.": Code[20]): Boolean
    var
        DisposalLines: Record "Disposal Lines";
    begin
        DisposalLines.Reset;
        DisposalLines.SetRange("Document No.", "DocumentNo.");
        exit(DisposalLines.FindFirst);
    end;
}
