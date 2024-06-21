#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72360 "Material On site"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            
            Description = ' Measurement Sheet,Contractor Notice of Works,Works Inspection,Payment Certificate,Contractor Payment Request,New Job Voucher,Contractor Request for Close-Out,Contractor Request for Post DLP Inspection';
            OptionCaption = ' ,Measurement Sheet,Contractor Notice of Works,Works Inspection,Payment Certificate,Contractor Payment Request,New Job Voucher,Contractor Request for Taking Over,Contractor Request for End of DLP Inspection';
            OptionMembers = " ","Measurement Sheet","Contractor Notice of Works","Works Inspection","Payment Certificate","Contractor Payment Request","New Job Voucher","Contractor Request for Taking Over","Contractor Request for End of DLP Inspection";
        }
        field(2;"Document No.";Code[20])
        {
            
            Editable = false;
        }
        field(3;"Material Code";Code[20])
        {
            
            TableRelation = "Material On Site Setup"."Material Code" where (Blocked=filter(false));

            trigger OnValidate()
            begin
                MaterialOnSiteSetup.Reset;
                MaterialOnSiteSetup.SetRange(MaterialOnSiteSetup."Material Code","Material Code");
                if MaterialOnSiteSetup.FindSet then begin
                  "Material Description":=MaterialOnSiteSetup."Material Description";
                  "Unit Of Measure":=MaterialOnSiteSetup."Unit Of Measure Code";
                  end;
            end;
        }
        field(4;"Material Description";Text[250])
        {
            
        }
        field(5;"Unit Of Measure";Code[20])
        {
            
            TableRelation = "Unit of Measure".Code;
        }
        field(6;"Line No.";Integer)
        {
            AutoIncrement = true;
            
        }
        field(7; "Previos Quantity"; Decimal)
        {
            
        }
        field(8; "Current Quantty"; Decimal)
        {
            
        }
        field(9; Rate; Decimal)
        {
            
        }
        field(10; "Total Amount"; Decimal)
        {
            
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        MaterialOnSiteSetup: Record "Material On Site Setup";
}

