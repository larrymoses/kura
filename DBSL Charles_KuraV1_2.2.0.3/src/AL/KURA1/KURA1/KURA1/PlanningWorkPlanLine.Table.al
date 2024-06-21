#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72317 "Planning Work Plan Line"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Daily,Weekly,Monthly';
            OptionMembers = " ",Daily,Weekly,Monthly;
        }
        field(3;"Activity Code";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // JobTask.RESET;
                // JobTask.SETRANGE(JobTask."Job No.","Project ID");
                // JobTask.SETRANGE(JobTask."Job Task No.","Activity Code");
                // IF JobTask.FINDSET THEN BEGIN
                //   "Activity Description":=JobTask.Description;
                //  END;
            end;
        }
        field(4;"Works Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Total Done Todate";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(8;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(9;"Works Start Chainage(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Works End Chanage(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Unit Of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(12;"Foreman ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WEP Contractor Team"."Contractor Staff No." where ("Project ID"=field("Project ID"));

            trigger OnValidate()
            begin
                WEPContractorTeam.Reset;
                WEPContractorTeam.SetRange(WEPContractorTeam."Contractor Staff No.","Foreman ID");
                if WEPContractorTeam.FindSet then
                  begin
                    "Foreman Name":=WEPContractorTeam.Name;
                    end;
            end;
        }
        field(13;"Foreman Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Contractor No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Document Type","Activity Code","Line No.","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        WorkPlanHeader.Reset;
        WorkPlanHeader.SetRange(WorkPlanHeader."Document No.","Document No.");
        if WorkPlanHeader.FindSet then begin
            "Project ID":=WorkPlanHeader."Project ID";
            "Contractor No.":=WorkPlanHeader."Contractor No.";
          end;
    end;

    var
        WorkPlanHeader: Record "Work Plan Header";
        JobTask: Record "Job Task";
        WEPContractorTeam: Record "WEP Contractor Team";
}

