#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70111 "Vendor Prequalification Entry"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            
        }
        field(2;"IFP No.";Code[20])
        {
            
        }
        field(3;"Vendor No.";Code[20])
        {
            
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vendors.Reset;
                Vendors.SetRange("No.","Vendor No.");
                if Vendors.FindSet then
                  "Vendor Name":=Vendors.Name;
            end;
        }
        field(4;"Procurement Type";Code[30])
        {
            
            TableRelation = "Procurement Types".Code;
        }
        field(5;"Procurement Category Code";Code[30])
        { 
            TableRelation = "Procurement Category".Code;
            trigger OnValidate()
            var
            ProcurementCategory: Record "Procurement Category";
            begin
                if ProcurementCategory.Get("Procurement Category Code") then
                Description := ProcurementCategory.Description;
            end;
        }
        field(6;Description;Text[250])
        {
            
        }
        field(7;"Start Date";Date)
        {
            
        }
        field(8;"End Date";Date)
        {
            
        }
        field(9;Blocked;Boolean)
        {
            
        }
        field(10;"Date Blocked";Date)
        {
            
        }
        field(11;"Document Type";Option)
        {
            
            OptionCaption = 'IFP Response,EOI Response';
            OptionMembers = "IFP Response","EOI Response";
        }
        field(12;"Posting Date";Date)
        {
            
        }
        field(13;"Document No.";Code[30])
        {
            
        }
        field(14;Region;Code[50])
        {
            
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Region));
        }
        field(15;Constituency;Code[50])
        {
            
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Constituency));
        }
        field(16;"Vendor Name";Text[250])
        {
            
        }
        field(17;"Evaluation Decision";Option)
        {
            
            Description = 'Final evaluation verdict by the Procurement function';
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(18;"Evaluation Score %";Decimal)
        {
            
            Description = 'Any % score that may be assigned to each evaluation';
            MaxValue = 100;
            MinValue = 0;
        }
        field(19; "Special Vendor Category"; Code[50])
        {
            TableRelation = "Special Vendor Category".Code;
        }
    }

    keys
    {
        key(Key1;"Vendor No.","Procurement Category Code",Region)//,"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Vendor No.","Vendor Name")
        {
        }
    }

    var
        Vendors: Record Vendor;
}

