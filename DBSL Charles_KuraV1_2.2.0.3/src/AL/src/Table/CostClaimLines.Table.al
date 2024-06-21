#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72346 "Cost Claim Lines"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Extension of Time Request,Contractor Variation Request,Project Variation Order,Budget Reallocation Voucher,Engineer Variation Request,Cost Claim';
            OptionMembers = " ","Extension of Time Request","Contractor Variation Request","Project Variation Order","Budget Reallocation Voucher","Engineer Variation Request","Cost Claim";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Cause of Overrun";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Cost Claim Requested Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Cost Claim Approved Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Status;Option)
        {
            CalcFormula = lookup("Project Variation Header".Status where ("Document Type"=field("Document Type"),
                                                                          "Document No."=field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(7;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

