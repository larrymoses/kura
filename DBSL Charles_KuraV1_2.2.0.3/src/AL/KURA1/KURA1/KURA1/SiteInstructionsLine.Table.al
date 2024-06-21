#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72343 "Site Instructions Line"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            var
                SiteinstructionHeader: Record "Site Instructions Header";
            begin
                SiteinstructionHeader.Reset();
                SiteinstructionHeader.SetRange("Document No.", Rec."Document No.");
                if SiteinstructionHeader.FindFirst() then
                    Rec.Validate("Project ID", SiteinstructionHeader."Project ID");
            end;
        }
        field(2;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(4;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Contract No";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // PurchaseHeader.RESET;
                // PurchaseHeader.SETRANGE("No.","Contract No");
                // IF PurchaseHeader.FINDSET THEN BEGIN
                //  "Contractor No.":=PurchaseHeader."Buy-from Vendor No."
                // END;
            end;
        }
        field(6;"Contractor No.";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // Vendor.RESET;
                // Vendor.SETRANGE("No.","Contractor No.");
                // IF Vendor.FINDSET THEN BEGIN
                //
                //  "Contractor Name":=Vendor.Name;
                //  END;
            end;
        }
        field(7;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Chainage Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Works Instructions(Descriptio)";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Region ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));

            trigger OnValidate()
            begin
                // ResponsibilityCenter.RESET;
                // ResponsibilityCenter.SETRANGE(Code,"Region ID");
                // IF ResponsibilityCenter.FINDSET THEN
                //  "Region Name":=ResponsibilityCenter.Name;
            end;
        }
        field(13;"Region Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"Directorate ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Directorate));

            trigger OnValidate()
            begin
                // ResponsibilityCenter.RESET;
                // ResponsibilityCenter.SETRANGE(Code,"Directorate ID");
                // IF ResponsibilityCenter.FINDSET THEN
                //  "Directorate Name":=ResponsibilityCenter.Name;
            end;
        }
        field(15;"Directorate Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;"Department ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter("Department/Center"));

            trigger OnValidate()
            begin
                // ResponsibilityCenter.RESET;
                // ResponsibilityCenter.SETRANGE(Code,"Department ID");
                // IF ResponsibilityCenter.FINDSET THEN
                //  "Department Name":=ResponsibilityCenter.Name;
            end;
        }
        field(17;"Department Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21;"Site Agent No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WEP Contractor Submission"."Site Agent Staff No" where ("Contractor No"=field("Contractor No."),
                                                                                     "Project No"=field("Project ID"));

            trigger OnValidate()
            begin
                // WEPContractorSubmission.RESET;
                // WEPContractorSubmission.SETRANGE(WEPContractorSubmission."Project No","Project ID");
                // WEPContractorSubmission.SETRANGE(WEPContractorSubmission."Contractor No","Contractor No.");
                // IF WEPContractorSubmission.FINDSET THEN
                // "Site Agent Name":=WEPContractorSubmission."Site Agent Name";
            end;
        }
        field(22;"Site Agent Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Appoved,Rejected';
            OptionMembers = " ",Open,"Pending Approval",Appoved,Rejected;
        }
        field(24;"Portal Status";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Draft,Submitted';
            OptionMembers = " ",Draft,Submitted;
        }
        field(25;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27;"BoQ Category Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field("Project ID"));

            trigger OnValidate()
            begin
                JobTask.Reset;
                JobTask.SetRange(JobTask."Job No.","Project ID");
                JobTask.SetRange(JobTask."Job Task No.","BoQ Category Code");
                if JobTask.FindSet then
                  "BoQ Category Description":=JobTask.Description;
            end;
        }
        field(28;"BoQ Item Line No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Planning Line"."Line No." where ("Job No."=field("Project ID"),
                                                                  "Job Task No."=field("BoQ Category Code"));

            trigger OnValidate()
            var
            LineNo: Integer;
            begin
                Evaluate(LineNo,"BoQ Item Line No.");
                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.","Project ID");
                JobPlanningLine.SetRange(JobPlanningLine."Job Task No.","BoQ Category Code");
                JobPlanningLine.SetRange(JobPlanningLine."Line No.",LineNo);
                if JobPlanningLine.FindFirst() then
                  begin
                  Description:=JobPlanningLine.Description;
                  "BoQ Item No.":=JobPlanningLine."No.";
                  Quantity:=JobPlanningLine.Quantity;
                  Amount:=JobPlanningLine."Unit Cost";
                  "Total Amount":=JobPlanningLine."Total Cost Incl. VAT";
                  end;
            end;
        }
        field(29;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(30;Quantity;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Total Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33;"BoQ Category Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(34;"BoQ Item No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        SiteInstructionsHeader.Reset;
        SiteInstructionsHeader.SetRange(SiteInstructionsHeader."Document No.","Document No.");
        if SiteInstructionsHeader.FindSet then begin
          "Project ID":=SiteInstructionsHeader."Project ID";
          "Project Name":=SiteInstructionsHeader."Project Name";
          "Contract No":=SiteInstructionsHeader."Contract No";
          "Contractor No.":=SiteInstructionsHeader."Contractor No.";
          "Contractor Name":=SiteInstructionsHeader."Contractor Name";
          end;
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        Job: Record Job;
        Vendor: Record Vendor;
        ResponsibilityCenter: Record "Responsibility Center";
        PurchaseHeader: Record "Purchase Header";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        JobTask: Record "Job Task";
        JobPlanningLine: Record "Job Planning Line";
        SiteInstructionsHeader: Record "Site Instructions Header";
}

