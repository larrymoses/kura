table 99613 "Vendor Appraisal Period"
{
    DrillDownPageID = "Vendor Appraisal Periods";
    LookupPageID = "Vendor Appraisal Periods";

    fields
    {
        field(1; "Period Code"; Code[30])
        {
            NotBlank = true;
            
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Start Date"; Date)
        {

           
        }
        field(4; "End Date"; Date)
        {
        }
        field(5; "Closed"; Boolean)
        {
            Editable = true;
        }
        field(19; Blocked; Boolean)
        {
            
        }
     
    }

    keys
    {
        key(Key1; "Period Code")
        {
            Clustered = true;
        }
        key(Key2; "Start Date")
        {
        }
        
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Period Code", Description, "Start Date","End Date")
        {
        }
        fieldgroup(Brick; "Period Code", Description, "Start Date","End Date")
        {
        }
    }

    trigger OnDelete()
    begin
        TestField(Closed, false);
    end;

    trigger OnInsert()
    begin

        
    end;

    trigger OnRename()
    begin

       
    end;

    


}
