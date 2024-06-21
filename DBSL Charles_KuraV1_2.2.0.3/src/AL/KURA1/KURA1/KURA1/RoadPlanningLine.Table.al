#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 52001 "Road Planning Line"
{

    fields
    {
        field(1;"Planning ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Planning Header";
        }
        field(2;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Activity;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Planned Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Actual Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;Priority;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'High,Medium,Low';
            OptionMembers = High,Medium,Low;
        }
        field(8;"% of Completion";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Planning ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Planning ID":=Header."No.";
    end;

    var
        Header: Record "Road Planning Header";
}

