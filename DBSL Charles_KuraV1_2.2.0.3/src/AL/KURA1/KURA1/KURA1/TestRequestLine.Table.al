#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72319 "Test Request Line"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {

            Editable = false;
        }
        field(2; "Activity Code"; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Project ID"));

            trigger OnValidate()
            begin
                JobTask.Reset;
                JobTask.SetRange(JobTask."Job No.", "Activity Code");
                JobTask.SetRange(JobTask."Job Task No.", "Activity Description");
                if JobTask.FindSet then begin
                    "Activity Description" := JobTask.Description;
                end;
            end;
        }
        field(3; "Activity Description"; Text[250])
        {

        }
        field(4; "Line No."; Integer)
        {

        }
        field(5; "Total Done Todate"; Decimal)
        {

        }
        field(6; "Project ID"; Code[20])
        {

            TableRelation = Job."No.";
        }
        field(7; "Entry No"; Integer)
        {
            AutoIncrement = true;

        }
        field(8; "Works Start Chainage(KM)"; Decimal)
        {

        }
        field(9; "Works End Chanage(KM)"; Decimal)
        {

        }
        field(10; "Unit Of Measure"; Code[20])
        {

            TableRelation = "Unit of Measure";
        }
        field(11; "Foreman ID"; Code[20])
        {

            TableRelation = "WEP Contractor Team"."Contractor Staff No." where("Project ID" = field("Project ID"));

            trigger OnValidate()
            begin
                // WEPContractorTeam.RESET;
                // WEPContractorTeam.SETRANGE(WEPContractorTeam."Contractor Staff No.","Foreman ID");
                // IF WEPContractorTeam.FINDSET THEN
                //  BEGIN
                //    "Foreman Name":=WEPContractorTeam.Name;
                //    END;
            end;
        }
        field(12; "Foreman Name"; Text[250])
        {

        }
        field(13; "Contractor No."; Code[20])
        {

        }
        field(14; "Tests Required"; Text[2048])
        {

        }
        field(15; "Site Instruction No."; Code[20])
        {
            TableRelation = "Site Instructions Header"."Document No.";
        }
        field(16; "Planning Line No."; Integer)
        {
            TableRelation = "Job Planning Line"."Line No." where("Job No." = field("Project ID"), "Job Task No." = field("Activity Code"));
            trigger OnValidate()
            var
                JobPlanningLine: Record "Job Planning Line";
            begin
                JobPlanningLine.Reset();
                JobPlanningLine.SetRange("Job No.", "Project ID");
                JobPlanningLine.SetRange("Job Task No.", "Activity Code");
                JobPlanningLine.SetRange("Line No.", "Planning Line No.");
                if JobPlanningLine.FindFirst() then begin
                    "Bill Item No." := JobPlanningLine."Bill Item No";
                    "Bill Item Description" := JobPlanningLine.Description;
                end;
            end;
        }
        field(17; "Bill Item No."; Code[20])
        {

        }
        field(18; "Bill Item Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        
    }

    keys
    {
        key(Key1; "Document No.", "Activity Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ContractorInspectionRequest.Reset;
        ContractorInspectionRequest.SetRange(ContractorInspectionRequest."Document No.", "Document No.");
        if ContractorInspectionRequest.FindSet then begin
            "Project ID" := ContractorInspectionRequest."Project ID";
        end;
    end;

    var
        WorkPlanHeader: Record "Work Plan Header";
        JobTask: Record "Job Task";
        ContractorInspectionRequest: Record "Contractor Inspection Request";
}

