#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72282 "QM Plan Line"
{

    fields
    {
        field(1; "Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                // ObjJob.RESET;
                // ObjJob.SETRANGE(ObjJob."No.","Project ID");
                // IF ObjJob.FINDSET THEN BEGIN
                //
                //  "Actual Start Date":=ObjJob."Starting Date";
                //  "Actual End Date":=ObjJob."Ending Date";
                //  END;
            end;
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Inspection Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Self Inspection,Adhoc Inspection,Formal Inspection,Take Over Inspection,Post DLP Inspection';
            OptionMembers = " ","Self Inspection","Adhoc Inspection","Formal Inspection","Take Over Inspection","Post DLP Inspection";
        }
        field(5; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Responsibility; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Contractor, Contractor/RE, RE';
            OptionMembers = " ",Contractor," Contractor/RE"," RE";
        }
        field(7; "Scheduled Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Scheduled End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Actual Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Actual End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Corrective Orders Issued"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; Comments; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Project Supervision Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Supervision Template"."Template ID" where(Blocked = filter(false));
        }
    }

    keys
    {
        key(Key1; "Plan ID", "Project ID", "Inspection Type", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        QMPlanHeader.Reset;
        QMPlanHeader.SetRange(QMPlanHeader."Plan ID", "Plan ID");
        if QMPlanHeader.FindSet then
            "Project ID" := QMPlanHeader."Project ID";
    end;

    var
        ObjJob: Record Job;
        ObjVendor: Record Vendor;
        // RoadInventory: Record "Road Inventory";
        // RoadSection: Record "Road Section";
        QMPlanHeader: Record "QM Plan Header";
}

