#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 99455 "Impact on Residents"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Audit Plan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Audit Plan,Project Audit Plan';
            OptionMembers = " ","Internal Audit Plan","Project Audit Plan";
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code".Code;

            trigger OnValidate()
            begin
                FinancialYearCode.Reset;
                FinancialYearCode.SetRange(Code, "Year Code");
                if FinancialYearCode.FindSet then begin
                    "Planning Start Date" := FinancialYearCode."Starting Date";
                    "Planning End Date" := FinancialYearCode."Ending Date";
                end;
                Description := UpperCase(COMPANYNAME) + ' ' + "Year Code" + ' ' + 'Monitoring Period';
            end;
        }
        field(5; "Planning Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Planning End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Corporate Strategic Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(8; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange("No.", "Project ID");
                if Job.FindSet then begin
                    "Project Name" := Job.Description;
                end;
            end;
        }
        field(9; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Overall Purpose"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Internal Audit Charter ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Internal Audit Charter".Code;
        }
        field(13; "Chief Audit Executive ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));
        }
        field(14; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "No. Of Budgeted New Audit Proj"; Integer)
        {
            CalcFormula = count("Audit Plan Line" where("Engagement Category" = filter("New Audit")));
            Description = 'No. of Budgeted New Audit Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "No. Of Budgeted WIP Audit Proj"; Integer)
        {
            CalcFormula = count("Audit Plan Line" where("Engagement Category" = filter("Work In Process")));
            Description = 'No. of Budgeted WIP Audit Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "No. Of Budgeted Audit Follow-u"; Integer)
        {
            CalcFormula = count("Audit Plan Line" where("Engagement Category" = filter("Audit Follow-up")));
            Description = 'No. of Budgeted  Audit Follow-up Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(19; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Created Datetime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Project Start Date:"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Project End Date:"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Road Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code";

            trigger OnValidate()
            begin
                road.Reset;
                //road.SETRANGE("Road Code",road."Road Code");
                if road.Get("Road Code") then begin
                    "Road Description" := road."Link Name";
                end;
            end;
        }
        field(26; "Road Description"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Intervention Type"; Code[500])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Intervention Type Setup".Code;

            trigger OnValidate()
            begin
                inter.Reset;
                if inter.Get("Intervention Type") then begin "Intervention Description" := inter."Intervention Description"; end;
            end;
        }
        field(28; "Intervention Description"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Respondent Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Pedestrian,Cyclist,Motorist,Bodaboda,Matatu Driver,Shopkeeper,Truck Driver,Trader,Health Facility,Resident,Education Facility,Goverment Institution';
            OptionMembers = ,Pedestrian,Cyclist,Motorist,Bodaboda,"Matatu Driver",Shopkeeper,"Truck Driver",Trader,"Health Facility",Resident,"Education Facility","Goverment Institution";
        }
        field(30; "Extent Of Agrrement Measure"; code[50])
        {
            DataClassification = ToBeClassified;
            // OptionCaption = ',Provision of Access to adjacent properties,Enhanced pedestrian safety by installation of safety signs along the Project road,Enhanced motorist’s safety when undertaking the project,Control of dust along the Project road,Control against water pollution,Drainage and control of flooding along the Project road,Control of noise and vibration on site,Uninterrupted passage of traffic through the site,Enhanced security measures,Employment opportunities for the local youth,Employment opportunities for the women,Business opportunities for the local community,HIV/AIDS and Covid-19 issues';
            // OptionMembers = ,"Provision of Access to adjacent properties","Enhanced pedestrian safety by installation of safety signs along the Project road","Enhanced motorist’s safety when undertaking the project","Control of dust along the Project road","Control against water pollution","Drainage and control of flooding along the Project road","Control of noise and vibration on site","Uninterrupted passage of traffic through the site","Enhanced security measures","Employment opportunities for the local youth","Employment opportunities for the women","Business opportunities for the local community","HIV/AIDS and Covid-19 issues";
            TableRelation = ExtentOfAgreementMeasureSetup.Code;
            trigger OnValidate()
            begin
                if extent.get("Extent Of Agrrement Measure") then
                    "Extent Description" := extent.ExtentOfAgreementMeasureSetup;

            end;
        }
        field(31; "Respondent Answer"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Don''t Know,Strongly Don''t Agree,Dont Agree,Agree,Strongly Agree';
            OptionMembers = ,"Don't Know","Strongly Don't Agree","Dont Agree",Agree,"Strongly Agree";
            trigger OnValidate()
            begin
                if "Respondent Answer" = "Respondent Answer"::Agree
                then
                    "Measure Value" := 4;
                if "Respondent Answer" = "Respondent Answer"::"Strongly Agree"
                then
                    "Measure Value" := 5;
                if "Respondent Answer" = "Respondent Answer"::"Dont Agree"
                then
                    "Measure Value" := 3;
                if "Respondent Answer" = "Respondent Answer"::"Strongly Don't Agree"
                then
                    "Measure Value" := 2;
                if "Respondent Answer" = "Respondent Answer"::"Don't Know"
                then
                    "Measure Value" := 1;
            end;
        }
        field(32; "Measure Value"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(33; Comments; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Extent Of Agrrement Measure2"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "M&E Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',On-Going,Completed';
            OptionMembers = ,"On-Going",Completed;
        }
        field(36; Region; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(40; "Extent Description"; text[250]) { DataClassification = ToBeClassified; }
    }

    keys
    {
        key(Key1; "Line No", "Document No.")
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
        "Created Datetime" := CreateDatetime(Today, Time);


        // IF "Document No."='' THEN BEGIN
        //  //IF "Audit Plan Type"="Audit Plan Type"::"Internal Audit Plan" THEN BEGIN
        //  AuditAssuranceSetup.GET;
        //  AuditAssuranceSetup.TESTFIELD("Audit Plan Nos.");
        //  NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Plan Nos.",xRec."No. Series",TODAY,"Document No.","No. Series");
        //  END;
        // END;

        // IF "Document No."='' THEN BEGIN
        //  IF "Audit Plan Type"="Audit Plan Type"::"Project Audit Plan" THEN BEGIN
        //  AuditAssuranceSetup.GET;
        //  AuditAssuranceSetup.TESTFIELD("Audit Plan Nos.");
        //  NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Plan Nos.",xRec."No. Series",TODAY,"Document No.","No. Series");
        //  END;
        //  END;
    end;

    var
        FinancialYearCode: Record "Financial Year Code";
        Job: Record Job;
        AuditAssuranceSetup: Record "Audit & Assurance Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        road: Record "Road Inventory";
        inter: Record 99453;
        respondant: Record "Respondent Category Setup";
        extent: Record ExtentOfAgreementMeasureSetup;
}

