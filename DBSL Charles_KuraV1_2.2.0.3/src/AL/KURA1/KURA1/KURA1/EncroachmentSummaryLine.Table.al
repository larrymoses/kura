#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72405 "Encroachment Summary Line"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Encroachment Stop Order, Encroachment Close-Out Report';
            OptionMembers = " ","Encroachment Stop Order"," Encroachment Close-Out Report";
        }
        field(3;"Nature of Encroachment";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Permanent Structure,Temporary Structure,Farming,Illegal Allocation';
            OptionMembers = " ","Permanent Structure","Temporary Structure",Farming,"Illegal Allocation";
        }
        field(4;"Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Authentic Road Reserve Width(M";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Actual Road Reserve Width(M)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Extent of Encroachment(M)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Encroachment Removal Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Demolition,Sensitization,Demarcation';
            OptionMembers = " ",Demolition,Sensitization,Demarcation;
        }
        field(10;Deadline;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Recovery Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;Comments;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(13;Recovered;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Encroached,Recovered';
            OptionMembers = " ",Encroached,Recovered;
        }
        field(15;"Road Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Document Type","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

