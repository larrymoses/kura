#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72247 "DWR Meeting Attendance"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Attendee Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Team,Contractor Team';
            OptionMembers = " ","Internal Team","Contractor Team";
        }
        field(4;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Attendee Type"=filter("Contractor Team")) "WEP Contractor Team"."Contractor Staff No." where ("Contractor No."=field("Contractor No"),
                                                                                                                               "Document No"=field("Work Execution Plan ID"))
                                                                                                                               else if ("Attendee Type"=filter("Internal Team")) "Internal Project Resource"."Resource No." where ("Project ID"=field("Project ID"));

            trigger OnValidate()
            begin
                WEPContractorTeam.Reset;
                WEPContractorTeam.SetRange(WEPContractorTeam."Contractor No.","Contractor No");
                WEPContractorTeam.SetRange(WEPContractorTeam."Contractor Staff No.","No.");
                if WEPContractorTeam.FindSet then begin
                   "Representative Name":=WEPContractorTeam.Name;
                    Designation:=WEPContractorTeam.Designation;
                    "Representative Email":=WEPContractorTeam.Email;
                    "Representative Tel No":=WEPContractorTeam.Telephone;
                  end;

                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Project ID","Project ID");
                InternalProjectResource.SetRange(InternalProjectResource."Resource No.","No.");
                if InternalProjectResource.FindSet then begin
                    "Representative Name":=InternalProjectResource.Name;
                    Designation:=InternalProjectResource.Designation;
                    "Representative Email":=InternalProjectResource.Email;
                    "Representative Tel No":=InternalProjectResource.Telephone;
                  end;
            end;
        }
        field(5;"Representative Name";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Designation;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Representative Email";Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(8;"Representative Tel No";Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(9;"Notified on Email";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Date/Time Notified";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WEP Contractor Team"."Contractor No." where ("Document No"=field("Work Execution Plan ID"));
        }
        field(12;"Project ID";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Project ID";
        }
        field(13;"Work Execution Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where ("Document Type"=filter("Work Execution Programme"));
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.","Attendee Type","No.","Representative Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // DailyWorkRecord.RESET;
        // DailyWorkRecord.SETRANGE(DailyWorkRecord."Document No.","Document No.");
        // IF DailyWorkRecord.FINDSET THEN BEGIN
        //  "Project ID":=DailyWorkRecord."Project ID";
        //   "Contractor No":=DailyWorkRecord."Contractor No.";
        //   "Work Execution Plan ID":=DailyWorkRecord."Work Execution Programme ID";
        //   END;
    end;

    var
        DailyWorkRecord: Record "Daily Work Record";
        WEPContractorTeam: Record "WEP Contractor Team";
        InternalProjectResource: Record "Internal Project Resource";
}

