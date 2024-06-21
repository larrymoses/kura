#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72141 "Project Works Staff Template"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Code<>'' then
                  begin

                    ProcurementSetup.TestField("Project Key Staff Temp Nos");
                    NoMgt.TestManual(ProcurementSetup."Project Key Staff Temp Nos");
                     "No. Series":=''
                end;
            end;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Main Works Category";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Works Category".Code;
        }
        field(4;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Purchase Requisitions";Integer)
        {
            CalcFormula = count("Purchase Header" where ("Document Type"=filter("Purchase Requisition"),
                                                         "Project Staffing Template ID"=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Created Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Created Time";Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
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
        if Code='' then begin
        ProcurementSetup.Get;
        ProcurementSetup.TestField("Project Key Staff Temp Nos");
        NoMgt.InitSeries(ProcurementSetup."Project Key Staff Temp Nos",xRec."No. Series",0D,Code,"No. Series");
        end;

        "Created By":=UserId;
        "Created Date":=Today;
        "Created Time":=Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
}

