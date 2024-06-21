#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72159 "PCO Planned Meeting"
{

    fields
    {
        field(1;"Notice No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Meeting Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Meeting Type".Code where ("Project Stage"=field("Project Stage"));

            trigger OnValidate()
            begin
                ProjectMeetingType.Reset;
                ProjectMeetingType.SetRange(Code,"Meeting Type");
                if ProjectMeetingType.FindSet then
                  Description:=ProjectMeetingType.Description;
            end;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Venue/Location";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Project Stage";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Mobilization,Execution,Close-Out';
            OptionMembers = " ",Mobilization,Execution,"Close-Out";
        }
        field(10;"Project Meeting ID";Code[20])
        {
            Editable = false;
            FieldClass = Normal;
            TableRelation = "Project Meeting Register"."Meeting ID" where ("Meeting Type"=field("Meeting Type"));
        }
    }

    keys
    {
        key(Key1;"Notice No.","Meeting Type","Project Stage")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProjectMeetingType: Record "Project Meeting Type";
}

