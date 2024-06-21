#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59032 "Driver Out of Office Req"
{
    DrillDownPageID = "Driver Out of Office Reqs";
    LookupPageID = "Driver Out of Office Reqs";

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Driver No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Drivers".Driver where (Active=filter(true));
        }
        field(4;"Driver Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Trip No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Trip Descrption";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Trip Starting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Trip Duration";DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Trip End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Vehicle Reg No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Vehicle Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"No Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
    }

    keys
    {
        key(Key1;"Document No","Driver No","Trip No")
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
          FleetManagementSetup.Get;
          FleetManagementSetup.TestField("Out of Office Requistion No");
          NoSeriesManagement.InitSeries(FleetManagementSetup."Out of Office Requistion No",xRec."No Series",Today,"Document No","No Series");
          end;
        "Document Date":=Today;
        Status:= Status::Open;
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        FleetManagementSetup: Record "Fleet Management Setup";
}

