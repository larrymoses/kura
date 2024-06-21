#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 52024 "Roads Projects"
{
    //  DrillDownPageID = "All Road Projects";
    // LookupPageID = "All Road Projects";

    fields
    {
        field(1; "Project  No"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin


                if "Project  No" <> xRec."Project  No" then begin
                    //   GrantsSetup.Get;
                    NoSeriesMgt.TestManual(RMSSetup."Project  Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Contact No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Name; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Address; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Address 2"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Post Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; City; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Country/Region Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Contact; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Phone No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Email; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Responsibility Center"; Code[50])
        {
            Caption = 'Region';
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(14; "Project Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Project End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Contract Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Signed,Cancelled';
            OptionMembers = Signed,Cancelled;
        }
        field(17; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(18; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(21; "Currency Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(22; "Road Class"; Code[50])
        {
            DataClassification = ToBeClassified;
            //    TableRelation = Table50001;
        }
        field(23; "Road Length(km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Project Engineer"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(25; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            InitValue = Open;
            OptionCaption = 'Open,Ongoing,Completed';
            OptionMembers = Open,Ongoing,Completed;

            trigger OnValidate()
            var
                JobPlanningLine: Record "Job Planning Line";
            begin
            end;
        }
    }

    keys
    {
        key(Key1; "Project  No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Project  No" = '' then begin
            RMSSetup.Get;
            RMSSetup.TestField("Project  Nos");
            NoSeriesMgt.InitSeries(RMSSetup."Project  Nos", xRec."No. Series", 0D, "Project  No", "No. Series");
        end;

        "Created On" := Today;
        "Created By" := UserId;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        // GrantsSetup: Record "Grants Setup";
        //GFA: Record "Grant Funding Application";
        Cust: Record Customer;
        RMSSetup: Record "Roads Management Setup";
}

