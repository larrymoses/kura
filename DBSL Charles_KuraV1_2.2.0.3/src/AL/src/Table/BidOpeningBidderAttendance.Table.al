#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70176 "Bid Opening Bidder Attendance"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Opening Register".Code;
        }
        field(2;"IFS Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(3;"Vendor No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Bidder/Vendor No. that had shown an Intention to Respond (T175) for a given IFS';
            TableRelation = Vendor."No.";
            trigger OnValidate()
            var
                Vend: Record Vendor;
            begin
                if Vend.Get("Vendor No.") then begin
                    "Vendor Name" := Vend.Name;
                    "Postal Address" := Vend."Address 2";
                end;
            end;
        }
        field(4;"Bidder Representative Name";Text[250])
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
        field(8;"Date/Time Notified";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(10;Designation;Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Notified By Email";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Vendor Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Postal Address";Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Vendor No.","IFS Code","Entry No")
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
        Vendor: Record Vendor;
}

