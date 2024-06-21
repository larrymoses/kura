#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72358 "Equipment Repair Tracking"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ',Repair and Maintainance,Request For Service';
            OptionMembers = ,"Repair and Maintainance","Request For Service";
        }
        field(3;"Contract ID";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where ("Document Type"=filter("Blanket Order"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.","Contract ID");
                if PurchaseHeader.FindSet then begin
                 "IFS Code":=PurchaseHeader."IFS Code";
                  "Bid Response No":=PurchaseHeader."Awarded Bid No";
                  end;
            end;
        }
        field(4;"Project No";Code[40])
        {
            DataClassification = ToBeClassified;
          //  TableRelation = Job."No." where (Status=filter("Completed/Under DLP"));

            trigger OnValidate()
            begin
                if Job.Get("Project No") then begin
                "Project No":=Job."No.";
                "Project Name":=Job.Description;
                "Contract ID":=Job."Purchase Contract ID";
                Validate("Contract ID");
                "Contractor No":=Job."Contractor No.";
                Validate("Contractor No");
                "Contractor Name":=Job."Contractor Name";
                "Work Execution Plan":=Job."Work Execution Plan ID";
                Description:=Format("Document Type")+'- '+"Project Name"+' '+"Contractor Name";
                end;

                WEPContractorSubmission.Reset;
                WEPContractorSubmission.SetRange(WEPContractorSubmission."Project No","Project No");
                if WEPContractorSubmission.FindSet then begin
                  "Site Agent Staff No":=WEPContractorSubmission."Site Agent Staff No";
                  Validate("Site Agent Staff No");
                  "Site Agent Name":=WEPContractorSubmission."Site Agent Name";
                  end;
            end;
        }
        field(5;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.","Contractor No");
                if Vendor.FindSet then begin
                  "Contractor Name":=Vendor.Name;
                  "Contractor Address":=Vendor.Address;
                  "Contractor Address 2":=Vendor."Address 2";
                  "Contractor Email Address":=Vendor."E-Mail";
                  "Contractor City":=Vendor.City;
                  end;
            end;
        }
        field(6;"Contractor Name";Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Project Name";Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Work Execution Plan";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where ("Document Type"=filter("Work Execution Programme"));
        }
        field(9;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(13;"Site Agent Staff No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WEP Contractor Submission"."Site Agent Staff No" where ("Project No"=field("Project No"),
                                                                                     "Contractor No"=field("Contractor No"),
                                                                                     Status=filter(Released));

            trigger OnValidate()
            begin
                WEPContractorSubmission.Reset;
                WEPContractorSubmission.SetRange(WEPContractorSubmission."Site Agent Staff No","Site Agent Staff No");
                if WEPContractorSubmission.FindSet then
                  "Site Agent Name":=WEPContractorSubmission."Site Agent Name";
            end;
        }
        field(14;"Site Agent Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Telephone No";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"E-mail";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17;Address;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Address 2";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19;City;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"No Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"IFS Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Bid Response No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Approval Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Approved,Temporary Approval,Rejected';
            OptionMembers = " ",Approved,"Temporary Approval",Rejected;

            trigger OnValidate()
            begin
                // IF "Approval Type"="Approval Type"::"Temporary Approval" THEN BEGIN
                //    DIALOG.MESSAGE('Please specify the Validity Period');
                //  END;
            end;
        }
        field(24;"Validity Period";DateFormula)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //"Expiry Date":=CALCDATE("Validity Period","Document Date");
            end;
        }
        field(25;"Expiry Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26;"Appointment Voucher No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WEP Contractor Submission"."Document No" where ("Document Type"=filter("Contractor Personnel Appointment"),
                                                                             "Project No"=field("Project No"));
        }
        field(27;"Portal Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Draft,Submitted';
            OptionMembers = " ",Draft,Submitted;
        }
        field(28;"Contractor Email Address";Code[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(29;"Contractor Address";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Contractor Address 2";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Contractor City";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Resident Engineer No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange(Resource."No.","Resident Engineer No.");
                if Resource.FindSet then begin
                  "Resident Engineer Email":=Resource.Email;
                  "Resident Engineer Name":=Resource.Name;
                end;
            end;
        }
        field(33;"Resident Engineer Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(34;"Resident Engineer Email";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(35;"No. Of Equipment On Repair";Integer)
        {
            CalcFormula = count("Equipment Repair Line" where ("Document Type"=field("Document Type"),
                                                               "Document No."=field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(36;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(37;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(38;"Posted By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39;"Posted DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(40;"Assigned To:";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(41;"Rejection Remarks";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(42;"Rejected By";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(43;Rejected;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

         if "Document No"='' then begin
           RoadManagementSetup.Get();
           RoadManagementSetup.TestField("Equipment Repair Tracking");
           NoSeriesManagement.InitSeries(RoadManagementSetup."Equipment Repair Tracking",xRec."No Series",Today,"Document No",xRec."No Series");
         end;

        "Created By":=UserId;
        "Created DateTime":=CurrentDatetime;
        "Document Date":=Today;
        Status:=Status::Open;
        "Portal Status":="portal status"::Draft;
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        Job: Record Job;
        PurchaseHeader: Record "Purchase Header";
        WEPContractorTeam: Record "WEP Contractor Team";
        ContrStaffDisengagementLine: Record "Contr Staff Disengagement Line";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        Vendor: Record Vendor;
        Resource: Record Resource;
}

