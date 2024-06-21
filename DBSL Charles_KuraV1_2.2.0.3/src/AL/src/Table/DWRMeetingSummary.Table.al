#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72249 "DWR Meeting Summary"
{
    DrillDownPageID = "DWR Meeting Summaries";
    LookupPageID = "DWR Meeting Summaries";

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;
        }
        field(3;"Agenda Code";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Agenda Item No.";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;"Item Discussed";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Summary Notes";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Task Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Responsibility Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Team,Contractor Team';
            OptionMembers = " ","Internal Team","Contractor Team";
        }
        field(10;"Task Owner ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Responsibility Category"=const("Contractor Team")) "Vendor Professional Staff"."Staff Number" where (Blocked=filter(false),
                                                                                                                                      "Vendor No."=field("Contractor No"))
                                                                                                                                      else if ("Responsibility Category"=const("Internal Team")) "Internal Project Resource"."Resource No." where (Status=const(Active),
                                                                                                                                                                                                                                                   "Project ID"=field("Project No"));

            trigger OnValidate()
            begin
                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Project ID",Rec."Project No");
                InternalProjectResource.SetRange(InternalProjectResource."Resource No.","Task Owner ID");
                if InternalProjectResource.FindSet then begin
                  Name:=InternalProjectResource.Name;
                  end;
            end;
        }
        field(11;Name;Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Project No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Contributor No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "DWR Meeting Attendance"."No." where ("Document No."=field("Document No."));
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.","Agenda Code","Agenda Item No.","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DailyWorkRecord: Record "Daily Work Record";
        InternalProjectResource: Record "Internal Project Resource";
}

