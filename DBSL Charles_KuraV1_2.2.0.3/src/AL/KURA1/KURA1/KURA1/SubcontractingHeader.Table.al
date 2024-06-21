#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72302 "Subcontracting Header"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(6;"Project Code";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                if ObjJob.Get("Project Code") then begin
                  "Project Name":=ObjJob.Description;
                  "Main Contractor No.":=ObjJob."Contractor No.";
                  Validate("Main Contractor No.");
                  "Purchase Contract ID":=ObjJob."Purchase Contract ID";
                  Validate("Purchase Contract ID");
                  "Variation Order No":=ObjJob."Last Variation Request No."+1;
                  end;
            end;
        }
        field(7;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Main Contractor No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                 ObjVendor.Reset;
                 ObjVendor.SetRange(ObjVendor."No.","Main Contractor No.");
                 if ObjVendor.FindSet then
                   "Main Contractor Name":=ObjVendor.Name;
            end;
        }
        field(9;"Main Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Subcontractor No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                 ObjVendor.Reset;
                 ObjVendor.SetRange(ObjVendor."No.","Subcontractor No");
                 if ObjVendor.FindSet then
                   "Subcontractor Name":=ObjVendor.Name;


                if "Subcontractor No"="Main Contractor No." then
                  Error('Please choose a different contractor');
            end;
        }
        field(11;"Subcontractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(12;"Date Subcontracted";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Reason For Rejection";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Main Contractor,Sub Contractor,Assignee';
            OptionMembers = " ","Main Contractor","Sub Contractor",Assignee;
        }
        field(16;"Request Justification";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Business Type";Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Used to record the different Business Types based on Ownership categories such as Companies, Partnerships, Sole Ownership etc. Linked to Business Type Table';
            TableRelation = "Business Types".Code;
        }
        field(18;"Country of Incorporation";Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = ToBeClassified;
            Description = 'Country of Incorporation/Registration';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                // PostCode.CheckClearPostCodeCityCounty(City,"Post Code",County,"Country/Region Code",xRec."Country/Region Code");
                //
                // IF "Country/Region Code" <> xRec."Country/Region Code" THEN
                //  VATRegistrationValidation;
            end;
        }
        field(19;"Country of Tax Registration";Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = ToBeClassified;
            Description = 'Country of Tax Registration';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                // PostCode.CheckClearPostCodeCityCounty(City,"Post Code",County,"Country/Region Code",xRec."Country/Region Code");
                //
                // IF "Country/Region Code" <> xRec."Country/Region Code" THEN
                //  VATRegistrationValidation;
            end;
        }
        field(20;Debarred;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Debarment Voucher No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Debarment Voucher"."Document No";
        }
        field(22;"Debarment Expiry Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Ownership Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Sole Ownership,Partnership,Registered Company';
            OptionMembers = ,"Sole Ownership",Partnership,"Registered Company";
        }
        field(24;"Registration/Incorporation No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Reg/Incorporation Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Operations Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Tax PIN No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"NSSF No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(29;"NHIF No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Current Vendor Class";Code[20])
        {
            CalcFormula = lookup("Vendor Classification"."Vendor Category" where (Blocked=filter(false)));
            Description = 'Lookup field mapped to the Vendor Classification Table (For most recent entries that are Open i.e. Blocked=False';
            FieldClass = FlowField;
        }
        field(31;"Vendor Group";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Look-up field that is auto-populated when the Vendor Class field is defined';
            OptionCaption = 'General,Special';
            OptionMembers = General,Special;
        }
        field(32;"Supplier Type";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Look-up field that is auto-populated when the Vendor Class field is defined';
            OptionCaption = ' Local,Foreign';
            OptionMembers = " Local",Foreign;
        }
        field(33;"Nominal Capital LCY";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Issued Capital LCY";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(35;"Dealer Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Manufacturer,Distributor,Partner,Reseller,Other';
            OptionMembers = Manufacturer,Distributor,Partner,Reseller,Other;
        }
        field(36;"Max Value of Business";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37;"Nature of Business";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Fixed Line Tel No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(39;"Building/House No";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(40;Floor;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(41;"Plot No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(42;Street;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(43;"Authorized Signatory Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(44;"Signatory Designation";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(45;"Vision Statement";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(46;"Mission Statement";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(47;"Required Documents Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Document Template"."Template ID";
        }
        field(48;"Purchase Contract ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where ("Document Type"=filter("Blanket Order"));
        }
        field(49;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50;"Posted By";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(51;"Posted Date Time";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(52;"Variation Order No";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Document Date":=Today;
        "Created By":=UserId;
        "Created DateTime":=CreateDatetime(Today,Time);
        Status:=Status::Open;

        if "Document No"='' then begin
          RoadManagementSetup.Get();
          RoadManagementSetup.TestField("Subcontractor Nos");
          NoSeriesManagement.InitSeries(RoadManagementSetup."Subcontractor Nos",xRec."No. Series",Today,"Document No","No. Series");
          end;


        RoadManagementSetup.Get();
        "Required Documents Template ID":=RoadManagementSetup."Default Subcontracting Templat";
    end;

    var
        ObjJob: Record Job;
        ObjVendor: Record Vendor;
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ProjectDocumentTemplateLine: Record "Project Document Template Line";
        SubcontractingRequiredDoc: Record "Subcontracting Required Doc";
        ProjectDocumentTemplate: Record "Project Document Template";
}

