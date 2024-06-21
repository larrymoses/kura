#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72329 "RE Payment Schedule Header"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = Job."No." where (Status=filter("Completed/Under DLP"));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindSet then begin
                    "Contract ID" := Job."Purchase Contract ID";
                    "Project Name" := Job.Description;
                    "Contractor No" := Job."Contractor No.";
                    Validate("Contractor No");
                    "Region ID" := Job."Region ID";
                    "Directorate ID" := Job."Directorate Code";
                    "Department ID" := Job."Department ID";
                end;

                Description := 'REs Payment Schedule for the Month of' + ' ' + "Payment Month" + ' ' + 'for Project' + ' ' + "Project ID";

                //Insert Lines
                WEPContractorTeam.Reset;
                WEPContractorTeam.SetRange(WEPContractorTeam."Project ID", "Project ID");
                if WEPContractorTeam.FindSet then begin
                    repeat
                        REPaymentScheduleLine.Init;
                        REPaymentScheduleLine."Document No" := "Document No.";
                        REPaymentScheduleLine."Line No" := REPaymentScheduleLine.Count + 1;
                        REPaymentScheduleLine."Project ID" := "Project ID";
                        REPaymentScheduleLine."Contractor No" := "Contractor No";
                        REPaymentScheduleLine."Contractor Staff No" := WEPContractorTeam."Contractor Staff No.";
                        REPaymentScheduleLine.Name := WEPContractorTeam.Name;
                        REPaymentScheduleLine.Email := WEPContractorTeam.Email;
                        REPaymentScheduleLine.Designation := WEPContractorTeam.Designation;
                        REPaymentScheduleLine."Phone No." := WEPContractorTeam.Telephone;
                        REPaymentScheduleLine.Insert;
                    until WEPContractorTeam.Next = 0;
                end;
            end;
        }
        field(4; "Contract ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));
        }
        field(5; "Project Name"; Text[2000])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Payment Month"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "No. of Staff"; Integer)
        {
            CalcFormula = count("RE Payment Schedule Line" where("Document No" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Total Amount"; Decimal)
        {
            CalcFormula = sum("RE Payment Schedule Line".Amount where("Document No" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(15; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Vendors"."Vendor No" where("Contract No" = field("Contract ID"));

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.", "Contractor No");
                if Vendor.FindSet then begin
                    "Contractor Name" := Vendor.Name;
                    "Contractor Email" := Vendor.Email;
                    "Contractor Phone No" := Vendor."Phone No.";
                end;
            end;
        }
        field(18; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Contractor Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(20; "Contractor Phone No"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(21; "No.Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Portal Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Draft,Submitted';
            OptionMembers = Draft,Submitted;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Document Date" := Today;
        Status := Status::Open;
        "Created By" := UserId;
        "Created Date/Time" := CreateDatetime(Today, Time);
        //No. Series
        if "Document No." = '' then begin
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("RE Payment Schedule Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."RE Payment Schedule Nos", xRec."No.Series", Today, "Document No.", "No.Series");
        end;
        "Payment Month" := Lowercase(Format("Document Date", 0, '<Month Text>'));
    end;

    var
        Job: Record Job;
        Vendor: Record Vendor;
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        WEPContractorTeam: Record "WEP Contractor Team";
        REPaymentScheduleLine: Record "RE Payment Schedule Line";
}

