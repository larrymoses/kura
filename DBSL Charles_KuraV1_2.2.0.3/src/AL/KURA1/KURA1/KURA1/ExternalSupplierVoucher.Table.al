#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70236 "External Supplier Voucher"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"External Authority Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Authority"."Road Authority Code";

            trigger OnValidate()
            begin
                if RoadAuthority.Get("External Authority Code") then
                  "External Authority Name":=RoadAuthority.Name;
            end;
        }
        field(5;"External Authority Name";Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Procurement  Category ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code where (Blocked=filter(false));

            trigger OnValidate()
            begin
                ProcurementCategory.Reset;
                ProcurementCategory.SetRange(ProcurementCategory.Code,"Procurement  Category ID");
                if ProcurementCategory.FindSet then
                  "Procurement Category Name":=ProcurementCategory.Description;
            end;
        }
        field(7;"IFS Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            begin
                StandardPurchaseCode.Reset;
                StandardPurchaseCode.SetRange(StandardPurchaseCode.Code,"IFS Code");
                if StandardPurchaseCode.FindSet then
                  "IFS Description":=StandardPurchaseCode.Description;
            end;
        }
        field(8;"IFS Description";Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(10;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"Posted By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"DateTime Posted";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Procurement Category Name";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"No. Series";Code[20])
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
        "Document Date":=Today;
        Status:=Status::Open;
        "Created By":=UserId;
        "Created DateTime":=CreateDatetime(Today,Time);

        if "Document No"='' then begin
          ProcurementSetup.Get();
          ProcurementSetup.TestField("External Supplier Nos");
          NoSeriesManagement.InitSeries(ProcurementSetup."External Supplier Nos",xRec."No. Series",Today,"Document No","No. Series");
          end;
    end;

    var
        RoadAuthority: Record "Road Authority";
        ProcurementCategory: Record "Procurement Category";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ProcurementSetup: Record "Procurement Setup";
        StandardPurchaseCode: Record "Standard Purchase Code";
}

