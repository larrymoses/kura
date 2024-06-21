#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80010 "Corporate Strategic Plans"
{
    DrillDownPageID = "All CSPS";
    LookupPageID = "All CSPS";

    fields
    {
        field(1;"Code";Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Code <> xRec.Code then begin
                   SPMSetup.Get;
                    NoSeriesMgt.TestManual(SPMSetup."Corp Strategic Plan Nos");
                   "No. Series" := '';
                end;
            end;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Primary Theme";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Strategy Framework";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework";
        }
        field(5;"Start Date";Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "End Date":=CalcDate("Duration (Years)","Start Date");
                "End Date":=CalcDate('-1D',"End Date");
            end;
        }
        field(6;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Duration (Years)";DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Vision Statement";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Mission Statement";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Implementation Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Not Started,Ongoing,Closed';
            OptionMembers = "Not Started",Ongoing,Closed;
        }
        field(11;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(12;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(13;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Created Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Creation Time";Time)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
        key(Key2;"Strategy Framework")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
          SPMSetup.Get;
          SPMSetup.TestField("Corp Strategic Plan Nos");
          NoSeriesMgt.InitSeries(SPMSetup."Corp Strategic Plan Nos",xRec."No. Series",0D,Code,"No. Series");
        end;
        /*
        CoreV.RESET;
        CoreV.SETFILTER(Code,'<>%1','');
        IF CoreV.FIND('-') THEN BEGIN
          REPEAT
            StrategyCoreV.INIT;
            StrategyCoreV."Strategic Plan ID":=Code;
            StrategyCoreV."Core Value":=CoreV.Description;
            StrategyCoreV.Description:=CoreV.Description;
            StrategyCoreV.INSERT(TRUE);
          UNTIL CoreV.NEXT=0;
        END;
        */
        "Created By":=UserId;
        "Created Date":=Today;
        "Creation Time":=Time;

    end;

    var
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        StrategyCoreV: Record "Strategy Core Value";
        CoreV: Record "Core Values";
}

