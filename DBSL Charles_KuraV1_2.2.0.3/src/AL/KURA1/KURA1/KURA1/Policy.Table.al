#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80111 "Policy"
{
    DrillDownPageID = "All Policies";
    LookupPageID = "All Policies";

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if (Type=Type::External) then begin
                    if Code <> xRec.Code then begin
                       SPMSetup.Get;
                        NoSeriesMgt.TestManual(SPMSetup."External Policy No. Series");
                       "No. Series" := '';
                    end;
                end;

                if (Type=Type::Internal) then begin
                    if Code <> xRec.Code then begin
                       SPMSetup.Get;
                        NoSeriesMgt.TestManual(SPMSetup."Internal Policy No. Series");
                       "No. Series" := '';
                    end;
                end;
            end;
        }
        field(2;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
        }
        field(3;"Policy Name";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Summary;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Applies-To";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'All Staff,Some Staff,Public,Other';
            OptionMembers = "All Staff","Some Staff",Public,Other;
        }
        field(6;"Responsibility Center";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(7;"Responsible Person";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Responsible Person") then begin
                   Name:=Employee.FullName;
                   Title:=Employee.Title;
                end;
            end;
        }
        field(8;Name;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Title;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Date Approved";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Current Version No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Last Review Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(15;"Policy Dev Institution ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Policy Development Institution".Code;
        }
        field(16;"Policy Goal";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"External Ref No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Policy Overview";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Policy Purpose";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Policy Rationale";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Policy Scope";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Primary Directorate";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(23;"Primary Department";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"));
        }
        field(24;"Process Owner ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Process Owner Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Process Owner Title";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Approved By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Approver Name";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Policy Stage";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Agenda Setting,Policy Formulation,Implementation,Terminated';
            OptionMembers = "Agenda Setting","Policy Formulation",Implementation,Terminated;
        }
        field(30;"No. of Policy Revisions";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Employee Policy Attestations";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32;" Policy Compliance Audits";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Created Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(35;"Created Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(36;"Drafting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(37;"Approval Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Last Revision Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(39;"Vision Statement";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(40;"Mission Statement";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(41;"Employee Attestation Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if (Type=Type::External) then begin
            if Code = '' then begin
              SPMSetup.Get;
              SPMSetup.TestField("External Policy No. Series");
              NoSeriesMgt.InitSeries(SPMSetup."External Policy No. Series",xRec."No. Series",0D,Code,"No. Series");
            end;
        end;

        if (Type=Type::Internal) then begin
            if Code = '' then begin
              SPMSetup.Get;
              SPMSetup.TestField("Internal Policy No. Series");
              NoSeriesMgt.InitSeries(SPMSetup."Internal Policy No. Series",xRec."No. Series",0D,Code,"No. Series");
            end;
        end;
    end;

    var
        SPMSetup: Record "Policy Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
}

