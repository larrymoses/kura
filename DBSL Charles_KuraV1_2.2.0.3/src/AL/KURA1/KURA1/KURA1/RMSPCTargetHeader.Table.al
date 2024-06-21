#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72355 "RMS PC Target Header"
{

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Financial Year Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code".Code;
        }
        field(4; "Project Type"; Option)
        {
            DataClassification = ToBeClassified;
            FieldClass = Normal;
            OptionCaption = ' ,Maintenance,Road Construction,Survey/Study,Structure Construction';
            OptionMembers = " ",Maintenance,"Road Construction","Survey/Study","Structure Construction";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."Type of Project", "Project Type");
                if Job.FindSet then begin
                    repeat
                        //    RMSPCTargetLine.RESET;
                        //    RMSPCTargetLine.SETRANGE(RMSPCTargetLine."Document No","Document No");
                        //    IF NOT RMSPCTargetLine.FINDSET THEN BEGIN
                        //      REPEAT
                        RMSPCTargetLine.Init;
                        RMSPCTargetLine."Document No" := "Document No";
                        RMSPCTargetLine."Project Type" := "Project Type";
                        RMSPCTargetLine."Line No" := RMSPCTargetLine.Count + 1;
                        RMSPCTargetLine."Project Code" := Job."No.";
                        RMSPCTargetLine."Project Name" := Job.Description;
                        RMSPCTargetLine."Workplanned Length" := Job."Workplanned Length";
                        if not RMSPCTargetLine.Insert(true) then
                            RMSPCTargetLine.Modify(true);
                    //UNTIL RMSPCTargetLine.NEXT=0;
                    //END;
                    until Job.Next = 0;
                end;
            end;
        }
        field(5; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Project Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Document Date" := Today;
        "Created Date/Time" := CreateDatetime(Today, Time);

        // if "Document No" = '' then begin
        //     RMSetup.Get();
        //     RMSetup.TestField("PC Targets&Output Nos");
        //     NSMgt.InitSeries(RMSetup."PC Targets&Output Nos", xRec."No Series", Today, "Document No", xRec."No Series");
        // end;
    end;

    var
        MSetup: Record "Road Management Setup";
        //NSMgt: Codeunit NoSeriesManagement;
        Job: Record Job;
        RMSPCTargetLine: Record "RMS PC Target Line";
}

