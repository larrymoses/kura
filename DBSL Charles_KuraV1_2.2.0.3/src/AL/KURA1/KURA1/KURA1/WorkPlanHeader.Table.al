#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72315 "Work Plan Header"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Daily,Weekly,Monthly';
            OptionMembers = " ",Daily,Weekly,Monthly;
        }
        field(3;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.","Project ID");
                if ObjJob.FindSet then begin
                  "Project Name":=ObjJob.Description;
                  "Resident Engineer ID":=ObjJob."Project Manager";
                  "Resident Engineer Name":=ObjJob."Project Manager";
                  "Purchase Contract ID":=ObjJob."Purchase Contract ID";
                   Validate("Purchase Contract ID");
                  end;

                WEPContractorSubmission.Reset;
                WEPContractorSubmission.SetCurrentkey("Document Type",Status,"Project No");
                WEPContractorSubmission.SetRange(WEPContractorSubmission."Project No","Project ID");
                WEPContractorSubmission.SetRange(WEPContractorSubmission."Document Type",WEPContractorSubmission."document type"::"Site Agent Nomination");
                WEPContractorSubmission.SetRange(WEPContractorSubmission.Status,WEPContractorSubmission.Status::Released);
                if WEPContractorSubmission.FindSet then begin
                   "Site Agent ID":=WEPContractorSubmission."Site Agent Staff No";
                   "Site Agent Name":=WEPContractorSubmission."Site Agent Name";
                  end;
            end;
        }
        field(4;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Purchase Contract ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where ("Document Type"=filter("Blanket Order"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.","Purchase Contract ID");
                if PurchaseHeader.FindSet then begin
                  "Contract Name":=PurchaseHeader."Tender Name";
                   "Contractor No.":=PurchaseHeader."Buy-from Vendor No.";
                   Validate("Contractor No.");
                   //"Project ID":=PurchaseHeader."Project No";
                  // VALIDATE("Project ID");

                  end;
            end;
        }
        field(6;"Contract Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Day/Week/Month From";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Day/Week/Month To";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Approved';
            OptionMembers = " ",Open,"Pending Approval",Approved;
        }
        field(11;"Portal Status";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Draft,Submitted';
            OptionMembers = " ",Draft,Submitted;
        }
        field(12;"Site Agent ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Site Agent Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"Resident Engineer ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Resident Engineer Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;"Contractor No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.","Contractor No.");
                if Vendor.FindSet then begin
                  "Contractor Name":=Vendor.Name;
                  end;
            end;
        }
        field(17;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18;"Prepared By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20;"Confirmed By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21;"Received By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1),
                                                          Blocked=const(false));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(25;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2),
                                                          Blocked=const(false));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
    }

    keys
    {
        key(Key1;"Document No.","Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Document No.","Document Type","Project ID","Document Date","Day/Week/Month From","Day/Week/Month To")
        {
        }
        fieldgroup(Brick;"Document No.","Document Type","Document Date","Day/Week/Month From","Day/Week/Month To")
        {
        }
    }

    trigger OnInsert()
    begin
        Status:=Status::Open;
        "Portal Status":="portal status"::Draft;
        "Prepared By":=UserId;
        "Created By":=UserId;
        "Document Date":=Today;
        "Created DateTime":=CreateDatetime(Today,Time);

        if "Document Type"="document type"::Daily then
          begin
            "Day/Week/Month From":=Today;
            "Day/Week/Month To":=Today;
         end;

        if "Document Type"="document type"::Weekly then
          begin
            "Day/Week/Month From":=Today;
            "Day/Week/Month To":=CalcDate('5D+CD',Today);
            end;

        if "Document Type"="document type"::Monthly then
          begin
            "Day/Week/Month From":=Today;
            "Day/Week/Month To":=CalcDate('1M+CM',Today);
            end;


        //Daily Workplan
        if "Document No."='' then begin
          if "Document Type"="document type"::Daily then begin
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("Daily WorkPlan Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Daily WorkPlan Nos",xRec."No. Series",Today,"Document No.","No. Series");
            end;
          end;
        //Weekly Workplan
        if "Document No."='' then begin
          if "Document Type"="document type"::Weekly then begin
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("Weekly Workplan Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Weekly Workplan Nos",xRec."No. Series",Today,"Document No.","No. Series");
            end;
          end;

        //Monthly Workplan
        if "Document No."='' then begin
          if "Document Type"="document type"::Monthly then begin
            RoadManagementSetup.Get();
            RoadManagementSetup.TestField("Monthly Workplan Nos");
            NoSeriesManagement.InitSeries(RoadManagementSetup."Monthly Workplan Nos",xRec."No. Series",Today,"Document No.","No. Series");
            end;
          end;
    end;

    var
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ObjJob: Record Job;
        PurchaseHeader: Record "Purchase Header";
        Vendor: Record Vendor;
        WEPContractorSubmission: Record "WEP Contractor Submission";
}

