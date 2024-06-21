#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72185 "WEP Contractor Team"
{
    DataCaptionFields = "Document Type","Document No","Contractor No.","Contractor Staff No.",Name;
    DrillDownPageID = "WEP Contractor Teams List";
    LookupPageID = "WEP Contractor Teams List";

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Site Agent Nomination,Contractor Personnel Appointment,Contractor Equipment Register';
            OptionMembers = " ","Site Agent Nomination","Contractor Personnel Appointment","Contractor Equipment Register";
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Contractor No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(4;"Contractor Staff No.";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                VendorProfessionalStaff.Reset;
                VendorProfessionalStaff.SetRange(VendorProfessionalStaff."Staff Number","Contractor Staff No.");
                if VendorProfessionalStaff.FindSet then begin
                  Name:=VendorProfessionalStaff."Staff Name";
                  Address:=VendorProfessionalStaff."Address 2";
                  "Address 2":=VendorProfessionalStaff."Address 2";
                  City :=VendorProfessionalStaff.City;
                  "Post Code":=VendorProfessionalStaff."Post Code";
                  "Country/Region Code":=VendorProfessionalStaff."Country/Region Code";
                  "Staff Category":=VendorProfessionalStaff."Staff Category";
                  Designation:=VendorProfessionalStaff."Current Designation";
                  Email:=VendorProfessionalStaff."E-Mail";
                  Telephone:=VendorProfessionalStaff."Phone No.";

                  end;
            end;
        }
        field(5;Name;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Address;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Address 2";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;City;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Post Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Country/Region Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Email;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12;Telephone;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Role Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where ("Team Type"=filter(Contractor),
                                                                               Blocked=filter(false));

            trigger OnValidate()
            begin
                ProjectStaffRoleCode.Reset;
                ProjectStaffRoleCode.SetRange(ProjectStaffRoleCode."Staff Role Code","Role Code");
                if ProjectStaffRoleCode.FindSet(true) then begin
                  Designation:=ProjectStaffRoleCode.Designation;
                  "Staff Category":=ProjectStaffRoleCode."Staff Category";
                end;
            end;
        }
        field(14;Designation;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Staff Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '  ,Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Others';
            OptionMembers = "  ","Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Others;
        }
        field(16;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Expiry Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(19;"Project ID";Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"ID Number";Code[20])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = None;
            NotBlank = true;
            Numeric = true;

            trigger OnValidate()
            begin
                ProjectStaffRoleCode.Reset;
                ProjectStaffRoleCode.SetRange(ProjectStaffRoleCode."Staff Role Code","Role Code");
                ProjectStaffRoleCode.SetRange(ProjectStaffRoleCode."Multiple Projects",false);
                if ProjectStaffRoleCode.FindSet then
                begin
                  WEPContractorTeam.Reset;
                  WEPContractorTeam.SetRange(WEPContractorTeam."ID Number","ID Number");
                  WEPContractorTeam.SetRange(WEPContractorTeam."Contractor No.","Contractor No.");
                  if WEPContractorTeam.FindSet then
                    begin
                      Error('Staff Role %1 has not been allowed to work on multiple projects. Please select another.',"Role Code");
                    end;
                end;
            end;
        }
        field(21;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Disengaement Details";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Disengament Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Contractor No.","Contractor Staff No.","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
         WEPContractorSubmission.Reset;
         WEPContractorSubmission.SetRange(WEPContractorSubmission."Document No","Document No");
         if WEPContractorSubmission.FindSet then begin
         "Project ID":=WEPContractorSubmission."Project No";
         "Contractor No.":=WEPContractorSubmission."Contractor No";
         end;
    end;

    var
        VendorProfessionalStaff: Record "Vendor Professional Staff";
        ProjectStaffRoleCode: Record "Project Staff Role Code";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        WEPContractorTeam: Record "WEP Contractor Team";
}

