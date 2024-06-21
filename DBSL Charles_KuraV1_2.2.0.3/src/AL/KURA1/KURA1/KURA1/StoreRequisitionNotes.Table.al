#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57026 "Store Requisition Notes"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";
        }
        field(3;"Qty. Requested";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Qty. Approved";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Qty. Issued";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Employee No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(7;"Employee Name";Text[100])
        {
            CalcFormula = lookup(Customer.Name where ("No."=field("Employee No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;Selected;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Item No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Unit Measures";Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Remaining Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Requisition Date";Date)
        {
            CalcFormula = lookup("Purchase Header"."Document Date" where ("No."=field("Document No")));
            FieldClass = FlowField;
        }
        field(14;"Requsted By";Code[30])
        {
            CalcFormula = lookup("Purchase Header"."Request-By Name" where ("No."=field("Document No")));
            FieldClass = FlowField;
        }
        field(15;Dept;Code[30])
        {
            CalcFormula = lookup("Purchase Header"."Department Code" where ("No."=field("Document No")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

