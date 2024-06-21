#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69443 "Safety Permit Team"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Safe Work Permit Application","Safe Work Completion Report";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Safe Work Permit Header"."Document No.";
        }
        field(3;"Resource No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=const(Person));

            trigger OnValidate()
            begin
                Resources.Reset;
                Resources.SetRange("No.","Resource No.");
                if Resources.FindSet then
                  Name:=Resources.Name;
               //// "Telephone No.":=Resources."M-Pesa Number";
                Email:=Resources.Email;
            end;
        }
        field(4;Name;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Role;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Safety Manager,Evacuation Manager,Assembly Point Manager,Emergency Response Member,First Aid Coordinator,Observer,Other Participant,Contractor Team';
            OptionMembers = " ","Safety Manager","Evacuation Manager","Assembly Point Manager","Emergency Response Member","First Aid Coordinator",Observer,"Other Participant","Contractor Team";
        }
        field(6;"Telephone No.";Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(7;Email;Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resources: Record Resource;
}
