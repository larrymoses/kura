#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72313 "Subcontracting Lines"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Subcontractor No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(3;"Subcontractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(4;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"KRA PIN";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Payee;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Vendor No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Scope of Subcontracting";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Main Contractor No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Main Contractor Name";Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        SubcontractingHeader.Reset;
        SubcontractingHeader.SetRange(SubcontractingHeader."Document No","Document No");
        if SubcontractingHeader.FindSet then begin
          "Project ID":=SubcontractingHeader."Project Code";
         "Main Contractor No":=SubcontractingHeader."Main Contractor No.";
         "Main Contractor Name":=SubcontractingHeader."Main Contractor Name";
         end;
    end;

    var
        ObjJob: Record Job;
        ObjVendor: Record Vendor;
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ProjectDocumentTemplateLine: Record "Project Document Template Line";
        SubcontractingRequiredDoc: Record "Subcontracting Required Doc";
        SubcontractingHeader: Record "Subcontracting Header";
}

