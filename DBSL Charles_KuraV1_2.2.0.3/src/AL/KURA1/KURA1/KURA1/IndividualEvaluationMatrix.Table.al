#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70224 "Individual Evaluation Matrix"
{

    fields
    {
        field(1;"Bid Evaluation Register No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Evaluation Register".Code;
        }
        field(2;"Bid No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where ("Document Type"=const(Quote));
        }
        field(3;"Vendor No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(4;"Evaluation Decision";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Responsive,Non-Responsive';
            OptionMembers = " ",Responsive,"Non-Responsive";
        }
        field(5;"Evaluation Score";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Evaluator No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(7;"Evaluator Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Evaluation Results";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Pass,Fail';
            OptionMembers = " ",Pass,Fail;
        }
        field(9;"Evaluation Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Bid Evaluation Register No","Bid No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

