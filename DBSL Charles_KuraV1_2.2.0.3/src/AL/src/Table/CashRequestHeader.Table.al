#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57028 "Cash Request Header"
{
    DrillDownPageID = "Cash Requests";
    LookupPageID = "Cash Requests";

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Enabled = false;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Financial Year Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Year Codes"."Year Code";
        }
        field(5;"Financial Budget";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name".Name;
        }
        field(6;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Rejected,Released';
            OptionMembers = Open,"Pending Approval",Rejected,Released;
        }
        field(7;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Total Request Amount";Decimal)
        {
            CalcFormula = sum("Cash Request Lines"."This Request" where ("Document No"=field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9;"Funding Agency ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                // IF Customer.GET("Funding Agency ID") THEN
                //  "Funding Agency Name":=Customer.Name;
            end;
        }
        field(12;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"Posted Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"Posted Time";Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Posted By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;"Income Account";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(17;Cashier;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Total Requested Amount";Decimal)
        {
            CalcFormula = sum("Cash Request Lines"."Net GoK Current Request" where ("Document No"=field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(19;"Reference No";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Funding Agency Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22;"Created Date Time";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Shortcut Dimension 1 Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=filter(1));
        }
        field(25;"Shortcut Dimension 2 Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=filter(2));
        }
        field(26;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                // ObjJob.RESET;
                // ObjJob.SETRANGE(ObjJob."No."
            end;
        }
        field(28;"Project Name";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No"='' then begin
          CashManagementSetup.Get;
          CashManagementSetup.TestField("Cash Request Nos.");
          NoSeriesManagement.InitSeries(CashManagementSetup."Cash Request Nos.",xRec."No. Series",Today,"Document No","No. Series");
          end;
    end;

    var
        CashManagementSetup: Record "Cash Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Customer: Record Customer;
        CashRequestLines: Record "Cash Request Lines";
        CashRequestHeader: Record "Cash Request Header";
        DimMgt: Codeunit DimensionManagement;
        ObjJob: Record Job;
}

