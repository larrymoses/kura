#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72363 "Road Camps Line"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Camp No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Camp Name";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Parcel Number";Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Physical Location";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Approximate Size(Ha.)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;County;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Layout/Spatial Reference";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Web GIS URL";Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(11;"Assigned Staff No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Assigned Staff Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Region ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"Region Name";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Ownership Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Title Deed to KeRRA,Title Deed to Other Body,Allotment Letter to KeRRA,Allotment to Other Body';
            OptionMembers = "Title Deed to KeRRA","Title Deed to Other Body","Allotment Letter to KeRRA","Allotment to Other Body";
        }
        field(16;"Current Use";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Encroached,Vacant';
            OptionMembers = Encroached,Vacant;
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
        RoadCampsHeader.Reset;
        RoadCampsHeader.SetRange(RoadCampsHeader."Document No","Document No");
        if RoadCampsHeader.FindSet then begin
          "Region ID":=RoadCampsHeader."Region ID";
          "Assigned Staff No":=RoadCampsHeader."Assigned Staff No";
          end;
    end;

    var
        RoadCampsHeader: Record "Road Camps Header";
}

