#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72196 "Planned Regional Rate Template"
{

    fields
    {
        field(1;"Requisition Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Requisition Template Line"."Requisition Template ID";
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            TableRelation = "Requisition Template Line"."Line No.";
        }
        field(3;"Region ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region),
                                                                Blocked=filter(false));

            trigger OnValidate()
            begin
                RequisitionTemplateLine.Reset;
                RequisitionTemplateLine.SetRange(RequisitionTemplateLine."Requisition Template ID","Requisition Template ID");
                if RequisitionTemplateLine.FindSet then
                  "Planned Rate(Unit Amount Exc)":=RequisitionTemplateLine."Unit Amount Excl. VAT";
            end;
        }
        field(4;"Planned Rate(Unit Amount Exc)";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Planned Rate(Unit Amount Excl. VAT)';
        }
    }

    keys
    {
        key(Key1;"Requisition Template ID","Region ID","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RequisitionTemplateLine: Record "Requisition Template Line";
}

