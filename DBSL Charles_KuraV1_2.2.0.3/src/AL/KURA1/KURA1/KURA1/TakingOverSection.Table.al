#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72324 "Taking Over Section"
{

    fields
    {
        field(1;"Inspection No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Measurement Sheet,Contractor Notice of Works,Works Inspection,Payment Certificate,Contractor Payment Request,New Job Voucher,Contractor Request for Taking Over,Contractor Request for End of DLP Inspection';
            OptionMembers = " ","Measurement Sheet","Contractor Notice of Works","Works Inspection","Payment Certificate","Contractor Payment Request","New Job Voucher","Contractor Request for Taking Over","Contractor Request for End of DLP Inspection";
        }
        field(3;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Taking Over Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Taking Over End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Comments;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Contract ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Road Section No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Link Name";Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Section Name";Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Workplannned Length";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;"Taking Over Length";Decimal)
        {
            CalcFormula = sum("Taking Over Section Line"."Taking Over Length" where ("Line No"=field("Line No")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Inspection No","Document Type","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        InspectionHeadersss.Reset;
        InspectionHeadersss.SetRange(InspectionHeadersss."Inspection No","Inspection No");
        if InspectionHeadersss.FindSet then begin
          "Project ID":=InspectionHeadersss."Project ID";
          Validate("Project ID");
          end;
    end;

    var
        InspectionHeadersss: Record "Inspection Headersss";
}

