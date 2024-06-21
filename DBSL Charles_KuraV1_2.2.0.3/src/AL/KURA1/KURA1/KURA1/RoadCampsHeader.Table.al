#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72362 "Road Camps Header"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            //
            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Region ID");
                if ResponsibilityCenter.FindSet then
                    "Region Name" := ResponsibilityCenter.Name;
            end;
        }
        field(4; "Region Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Assigned Staff No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Blocked = const(false));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange(Resource."No.", "Assigned Staff No");
                if Resource.FindSet then
                    "Assigned Staff Name" := Resource.Name;
            end;
        }
        field(6; "Assigned Staff Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Created Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Responsibility Center"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; County; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No" = '' then begin
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("Road Camps Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Road Camps Nos", xRec."No Series", Today, "Document No", xRec."No Series");
        end;

        "Document Date" := Today;
        "Created By" := UserId;
        "Created Date Time" := CreateDatetime(Today, Time);

        if UserSetup.Get(UserId) then
            "Responsibility Center" := UserSetup."Purchase Resp. Ctr. Filter";

        ResponsibilityCenter.Reset;
        ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Responsibility Center");
        if ResponsibilityCenter.FindSet then
            "Document No" := 'KERRA' + '/' + 'ROADCAMP' + '/' + ResponsibilityCenter.Code + '/' + CopyStr("Document No", 6);
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        ResponsibilityCenter: Record "Responsibility Center";
        Resource: Record Resource;
        UserSetup: Record "User Setup";
}

