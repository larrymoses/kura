#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72339 "Contr Staff Disengagement Line"
{
    Caption = 'Contractor Staff Disengagement Line';

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Site Agent Nomination,Contractor Personnel Appointment,Plan of Equipment Delivery to Site,Contractor Staff Disengagement';
            OptionMembers = " ","Site Agent Nomination","Contractor Personnel Appointment","Plan of Equipment Delivery to Site","Contractor Staff Disengagement";
        }
        field(4;"Project No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Contractor Staff No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WEP Contractor Team"."Contractor Staff No." where ("Contractor No."=field("Contractor No"),
                                                                                "Project ID"=field("Project No"));

            trigger OnValidate()
            begin
                WEPContractorTeam.Reset;
                WEPContractorTeam.SetRange(WEPContractorTeam."Contractor Staff No.","Contractor Staff No");
                if WEPContractorTeam.FindSet then begin
                  "Staff Name":=WEPContractorTeam.Name;
                  "Staff Category":=WEPContractorTeam."Staff Category";
                  Email:=WEPContractorTeam.Email;
                  "Role Code":=WEPContractorTeam."Role Code";
                  Designation:=WEPContractorTeam.Designation;
                  "ID Number":=WEPContractorTeam."ID Number";
                  end;
            end;
        }
        field(7;"Staff Name";Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Disengagement Reason";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Normal Staff Exit,Contract Expiry,Project Demobilization';
            OptionMembers = " ","Normal Staff Exit","Contract Expiry","Project Demobilization";
        }
        field(9;"Disengagement Details";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Email;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Disengagement Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Project Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Project End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Role Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code";
        }
        field(15;Designation;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Staff Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '  ,Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Others';
            OptionMembers = "  ","Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Others;
        }
        field(17;"ID Number";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No","Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        WEPContractorSubmission.Reset;
        WEPContractorSubmission.SetRange(WEPContractorSubmission."Document No","Document No.");
        if WEPContractorSubmission.FindSet then begin
          "Project No":=WEPContractorSubmission."Project No";
          "Contractor No":=WEPContractorSubmission."Contractor No";
          end;
        "Disengagement Date":=Today;
    end;

    var
        WEPContractorSubmission: Record "WEP Contractor Submission";
        WEPContractorTeam: Record "WEP Contractor Team";
}

