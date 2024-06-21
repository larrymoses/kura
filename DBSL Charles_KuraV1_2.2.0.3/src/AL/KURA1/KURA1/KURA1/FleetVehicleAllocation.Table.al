#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59025 "Fleet Vehicle Allocation"
{

    fields
    {
        field(1;"Transport Requisition No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Vehicle Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "KeRRa Vehicle"," Non KeRRa Vehicle";
        }
        field(3;"Vehicle Req. No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Vehicle Type"=const("KeRRa Vehicle")) "Fleet Vehicles."."FA Serial No";

            trigger OnValidate()
            begin
                Vehicles.Reset;
                Vehicles.SetRange(Vehicles."FA Serial No","Vehicle Req. No");
                if Vehicles.FindFirst then begin
                  Make := Vehicles.Make;
                  Model := Vehicles.Model;
                  //Capacity := Vehicles
                end;
            end;
        }
        field(4;Make;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Model;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Capacity;Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Transport Requisition No","Vehicle Type","Vehicle Req. No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vehicles: Record "Fleet Vehicles.";
}

