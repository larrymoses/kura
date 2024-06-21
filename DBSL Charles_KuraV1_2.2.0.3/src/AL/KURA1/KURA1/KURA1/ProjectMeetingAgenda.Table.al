
Table 72169 "Project Meeting Agenda"
{
    DrillDownPageId = "Project Meeting Agenda";
    LookupPageId = "Project Meeting Agenda";
    fields
    {
        field(1; "Meeting ID"; Code[20])
        {

        }
        field(2; "Agenda Code"; Code[20])
        {

            // TableRelation = "Project Meeting Agenda Temp"."Agenda Code";
        }
        field(3; "Agenda Description"; Text[250])
        {

        }
        field(4; Owner; Option)
        {

            OptionCaption = ' ,All,Client,Contractor';
            OptionMembers = " ",All,Client,Contractor;
        }
        field(5; "Estimate Time (Minutes)"; Integer)
        {

        }
    }

    keys
    {
        key(Key1; "Meeting ID", "Agenda Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Meeting ID", "Agenda Code", "Agenda Description", Owner)
        {

        }
        fieldgroup(Brick; "Meeting ID", "Agenda Code", "Agenda Description", Owner)
        {

        }
    }
}

