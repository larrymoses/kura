#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80193 "Policy Attestation Invitation"
{
    Caption = 'Policy Attestation Invitation';

    fields
    {
        field(1;"Policy ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(3;Name;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Email address";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Invited;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Date Invited";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Time Invited";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Invited By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Attestation No.";Code[50])
        {
            CalcFormula = lookup("Employee Policy Attestation"."Attestation No." where ("Policy No."=field("Policy ID")));
            FieldClass = FlowField;
        }
        field(11;"Employee Signing Status";Option)
        {
            CalcFormula = lookup("Employee Policy Attestation"."Employee Signing Status" where ("Policy No."=field("Policy ID")));
            FieldClass = FlowField;
            OptionCaption = 'Pending,Approved';
            OptionMembers = Pending,Approved;
        }
        field(12;"Date Approved";Date)
        {
            CalcFormula = lookup("Employee Policy Attestation"."Date Approved" where ("Policy No."=field("Policy ID")));
            FieldClass = FlowField;
        }
        field(13;"Policy Name";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"External Ref No";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Policy Goal";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Policy ID","Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

