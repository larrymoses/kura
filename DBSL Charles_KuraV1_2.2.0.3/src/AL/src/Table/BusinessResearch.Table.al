#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80208 "Business Research"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Employee Experience,Customer Experience,Post-Project Survey,Custom Survey';
            OptionMembers = " ","Employee Experience","Customer Experience","Post-Project Survey","Custom Survey";
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Business Research Template ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Primary Directorate";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(7;"Primary Department";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"));
        }
        field(8;Published;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Date Published";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Response Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Creation Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Creation Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(15;"No. of Responses";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

