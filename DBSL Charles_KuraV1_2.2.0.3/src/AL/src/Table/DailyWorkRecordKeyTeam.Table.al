#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72242 "Daily Work Record Key Team"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Daily Work Record,Project Status Report';
            OptionMembers = " ","Daily Work Record","Project Status Report";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Contractor Staff No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WEP Contractor Team"."Contractor Staff No." where ("Project ID"=field("Job No."),
                                                                                "Document Type"=filter("Contractor Personnel Appointment"));

            trigger OnValidate()
            begin
                WEPContractorTeam.Reset;
                WEPContractorTeam.SetRange(WEPContractorTeam."Document Type",WEPContractorTeam."document type"::"Contractor Personnel Appointment");
                //WEPContractorTeam.SETRANGE(WEPContractorTeam."Document No","Work Execution Programme ID");
                WEPContractorTeam.SetRange(WEPContractorTeam."Contractor Staff No.","Contractor Staff No.");
                if WEPContractorTeam.FindSet then begin
                  Name:=WEPContractorTeam.Name;
                  "Role Code":=WEPContractorTeam."Role Code";
                  Designation:=WEPContractorTeam.Designation;
                  "Staff Category":=WEPContractorTeam."Staff Category";
                  end;
            end;
        }
        field(5;Name;Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Role Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Designation;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Staff Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Other';
            OptionMembers = " ","Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Other;
        }
        field(9;"Work Execution Programme ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where ("Document Type"=filter("Work Execution Programme"));
        }
        field(10;"Job No.";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Project ID";
        }
        field(11;"Estimate ManHours Worked";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Estimate ManHours Worked">8 then begin
                "Overtime Hours Worked":="Estimate ManHours Worked"-8;
                  end;
            end;
        }
        field(12;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Document Date";
        }
        field(13;Remarks;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Overtime Hours Worked";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;Gender;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
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

    trigger OnInsert()
    begin
        DailyWorkRecord.Reset;
        DailyWorkRecord.SetRange(DailyWorkRecord."Document No.","Document No.");
        if DailyWorkRecord.FindSet then begin
          "Job No.":=DailyWorkRecord."Project ID";
           "Document Date":=DailyWorkRecord."Document Date";
           "Work Execution Programme ID":=DailyWorkRecord."Work Execution Programme ID";
          end;
    end;

    var
        WEPContractorTeam: Record "WEP Contractor Team";
        DailyWorkRecord: Record "Daily Work Record";
}

