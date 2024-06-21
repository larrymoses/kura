#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72210 "Road Reserve Width"
{

    fields
    {
        field(1; "KeRRA Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Actual Road Reserve Width"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Authentic Road Reserve Width"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Gazetted Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "KeRRA Road Code", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // IF "KeRRA Road Code"='' THEN BEGIN
        //  RoadManagementSetup.GET;
        //  RoadManagementSetup.TESTFIELD("Road Reserve Nos");
        //  NoSeriesManagement.InitSeries(RoadManagementSetup."Road Reserve Nos",xRec."Start Chainage",TODAY,"KeRRA Road Code","Start Chainage");
        //  END;
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
    //  Constituency: Record Constituency;
    // County1: Record County1;
}

