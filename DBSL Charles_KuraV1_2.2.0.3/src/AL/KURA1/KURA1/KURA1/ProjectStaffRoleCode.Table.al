#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72140 "Project Staff Role Code"
{
    DrillDownPageID = "Staff Role Code";
    LookupPageID = "Staff Role Code";

    fields
    {
        field(1; "Staff Role Code"; Code[20])
        {

        }
        field(2; "Team Type"; Option)
        {

            OptionCaption = ' ,Contractor,Sub-Contractor,Internal Project Team,Consultant';
            OptionMembers = " ",Contractor,"Sub-Contractor","Internal Project Team",Consultant;
        }
        field(3; Designation; Text[250])
        {

        }
        field(4; "Staff Category"; Option)
        {

            OptionCaption = ' ,Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Others';
            OptionMembers = " ","Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Others;
        }
        field(5; Blocked; Boolean)
        {

        }
        field(6; "Multiple Projects"; Boolean)
        {

        }
        field(7; "Resident Engineer"; Boolean)
        {

        }
        field(8; "Project Engineer"; Boolean)
        {

        }
    }

    keys
    {
        key(Key1; "Staff Role Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Staff Role Code", Designation)
        {
        }
        fieldgroup(Brick; "Staff Role Code", Designation)
        {
        }
    }
    trigger OnModify()
    begin
        //   Error('You cannot modify this table %1',Rec.TableCaption);
    end;
}

