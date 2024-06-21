#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70156 "IFS Prebid Bidder Attendance"
{

    fields
    {
        field(1;"Prebid Register ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Prebid Register".Code;
        }
        field(2;"IFS Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(3;"Bidder No";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Bidder/Vendor No. that had shown an Intention to Respond (T175) for a given IFS';
            TableRelation = "Standard Vendor Purchase Code"."Vendor No.";
        }
        field(4;"Representative Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Bidder Name as recorded in the Intention to Bid';
        }
        field(5;"Representative Email";Text[80])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Vendor.Primary Email (It shall be used for vendor communications during the bidding process)';
        }
        field(6;"Representative Tel No";Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Count Calcfield linked to the IFS Prebid Bidder Attendance Table (Filter based on Prebid Register ID and Bidder No.)';
        }
        field(8;"Date/Time Notified";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(10;Designation;Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Notified on Email";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Prebid Register ID","Bidder No","Line No.","IFS Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vend: Record "Standard Vendor Purchase Code";
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
}

