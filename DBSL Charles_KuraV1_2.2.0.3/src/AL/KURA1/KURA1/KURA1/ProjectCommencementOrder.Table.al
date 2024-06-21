#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72155 "Project Commencement Order"
{
    LookupPageID = "Project Commencement Order";

    fields
    {
        field(1; "Notice No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Purchase Contract ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"),
                                                           "Contract Status" = const(" "));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", "Purchase Contract ID");
                if PurchaseHeader.FindSet then begin
                    "Contractor No." := PurchaseHeader."Buy-from Vendor No.";
                    Validate("Contractor No.");
                    "Contract End Date" := PurchaseHeader."Contract End Date";
                    "Contract Start Date" := PurchaseHeader."Contract Start Date";
                    "Project ID" := PurchaseHeader.Job;
                    Validate("Project ID");
                end;
            end;
        }
        field(4; "Project ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = Job."No." where (Status=filter(Planned));

            trigger OnValidate()
            begin
                Description := 'Notice to Commence' + '-' + "Project ID" + ('Contract No:' + "Purchase Contract ID");


                Job.Reset;
                Job.SetRange(Job."No.", "Project ID");
                if Job.FindSet then begin
                    "Project Name" := Job.Description;
                    "Project End Date" := Job."Ending Date";
                    "Project Start Date" := Job."Starting Date";
                    "Road Code" := Job."Road Code";
                    "Road Section No." := Job."Road Section No";
                    "Section Name" := Job."Section Name";
                    "Region ID" := Job."Region ID";
                    "Constituency ID" := Job."Constituency ID";
                    //"Department ID":=Job.department;
                    "Directorate ID" := Job."Directorate Code";

                end;
                Validate("Road Section No.");
            end;
        }
        field(5; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Staff Appointment Voucher No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Voucher"."Document No." where("Document Type" = filter(Appointment),
                                                                          Posted = filter(true));

            trigger OnValidate()
            begin
                //Insert PCO Internal Project Team
                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Appointment Document No.", "Staff Appointment Voucher No.");
                InternalProjectResource.SetRange(InternalProjectResource.Status, InternalProjectResource.Status::Active);
                if InternalProjectResource.FindSet then begin
                    repeat
                        PCOInternalProjectTeam.Init;
                        PCOInternalProjectTeam."Commencement Order No." := "Notice No.";
                        PCOInternalProjectTeam."Resource No." := InternalProjectResource."Resource No.";
                        PCOInternalProjectTeam.Name := InternalProjectResource.Name;
                        PCOInternalProjectTeam.Email := InternalProjectResource.Email;
                        //PCOInternalProjectTeam.Address:=InternalProjectResource.
                        PCOInternalProjectTeam."Role Code" := InternalProjectResource."Role Code";
                        PCOInternalProjectTeam.Designation := InternalProjectResource.Designation;
                        PCOInternalProjectTeam.Insert;
                    until InternalProjectResource.Next = 0;
                end;
            end;
        }
        field(7; "Contractor No."; Code[20])
        {
            Caption = 'Contracting Vendor No.';
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.", "Contractor No.");
                if Vendor.FindSet then begin
                    "Contractor Name" := Vendor.Name;
                    "Vendor Address" := Vendor.Address;
                    "Vendor Address 2" := Vendor."Address 2";
                    "Vendor Post Code" := Vendor."Post Code";
                    "Vendor City" := Vendor.City;
                end;
            end;
        }
        field(8; "Contractor Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Vendor Address"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Vendor Address 2"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Vendor Post Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Vendor City"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Primary E-mail"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Contract Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Contract End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Tender Sum Inc Taxes (LCY)"; Decimal)
        {
            CalcFormula = sum("Purchase Header"."Read-out Bid Price (A)" where("No." = field("Purchase Contract ID")));
            Description = 'Award Tender Sum Inc Taxes (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "IFS Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Tender Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code";
        }
        field(21; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Road Section"."Road Section No." where ("Road Code"=field("Road Code"));

            trigger OnValidate()
            begin
                // RoadSection.Reset;
                // RoadSection.SetRange(RoadSection."Road Section No.","Road Section No.");
                // if RoadSection.FindSet then
                //   "Section Name":=RoadSection."Section Name";
            end;
        }
        field(22; "Section Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Project Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Project End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Constituency));
        }
        field(26; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(27; "Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(28; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(29; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(30; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(32; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Work Execution Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "No series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Pre Kick Off Site Handover Reg"; Code[20])
        {
            Caption = 'Pre Kick Off Site Handover Register';
            DataClassification = ToBeClassified;
            Description = 'Pre Kick Off Site Handover Register';
        }
        field(36; "Required Documents Template ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Document Template"."Template ID";
        }
    }

    keys
    {
        key(Key1; "Notice No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Notice No." = '' then begin
            RoadManagementSetup.Get;
            RoadManagementSetup.TestField("Commencement Order Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Commencement Order Nos", xRec."No series", Today, "Notice No.", "No series");
        end;

        "Document Date" := Today;
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
        Status := Status::Open;
    end;

    var
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Job: Record Job;
        InternalProjectResource: Record "Internal Project Resource";
        PCOInternalProjectTeam: Record "PCO Internal Project Team";
        //  RoadSection: Record "Road Section";
        Vendor: Record Vendor;
        ProjectStaffTemplateLine: Record "Project Staff Template Line";
        ProjectStaffAppointmentLine: Record "Project Staff Appointment Line";
        PurchaseHeader: Record "Purchase Header";


    procedure FnPopulateProjectTeam()
    begin
    end;
}

