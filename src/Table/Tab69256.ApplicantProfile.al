#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69256 "Applicant Profile"
{
    Caption = 'Applicant Profile';
    DataCaptionFields = "No.", "First Name", "Middle Name", "Last Name";
    DrillDownPageID = "Applicant Profiles";
    LookupPageID = "Applicant Profiles";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    HumanResSetup.Get;
                    NoSeriesMgt.TestManual(HumanResSetup."Employee Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(3; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
        }
        field(4; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
        field(5; "Full Names"; Text[200])
        {
            Caption = 'Initials';

            trigger OnValidate()
            begin
                NameBreakdown;
            end;
        }
        field(8; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(9; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(10; City; Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", "County of Birth", "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", "County of Birth", "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(11; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", "County of Birth", "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", "County of Birth", "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(12; "County of Birth"; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            TableRelation = County1;
        }
        field(13; "Phone No."; Text[15])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(14; "Mobile Phone No."; Text[15])
        {
            Caption = 'Mobile Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(15; "E-Mail"; Text[70])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit Mail;
            begin
                // MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(19; Picture; Blob)
        {
            Caption = 'Picture';
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Pending;
            SubType = Bitmap;
        }
        field(20; "Birth Date"; Date)
        {
            Caption = 'Birth Date';
        }
        field(21; "Social Security No."; Text[30])
        {
            Caption = 'Social Security No.';
        }
        field(22; "Union Code"; Code[10])
        {
            Caption = 'Union Code';
            TableRelation = Union;
        }
        field(23; "Union Membership No."; Text[30])
        {
            Caption = 'Union Membership No.';
        }
        field(24; Gender; Option)
        {
            Caption = 'Gender';
            OptionCaption = ' ,Female,Male,Both';
            OptionMembers = " ",Female,Male,Both;
        }
        field(25; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", "County of Birth", "Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(31; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Active,Inactive,Terminated,Retired';
            OptionMembers = Active,Inactive,Terminated,Retired;

            trigger OnValidate()
            begin
                EmployeeQualification.SetRange("Employee No.", "No.");
                EmployeeQualification.ModifyAll("Employee Status", Status);
                Modify;
            end;
        }
        field(50; "Company E-Mail"; Text[60])
        {
            Caption = 'Company Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit Mail;
            begin
                //MailManagement.ValidateEmailAddressField("Company E-Mail");
            end;
        }
        field(51; Title; Text[30])
        {
            Caption = 'Title';
        }
        field(53; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(54; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(140; Image; Media)
        {
            Caption = 'Image';
            ExtendedDatatype = Person;
        }
        field(50032; "Passport No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50037; "N.H.I.F No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50052; "National ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50114; "Date Of Birth"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50115; Age; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50116; "Applicant Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Staff,Non-Staff';
            OptionMembers = Staff,"Non-Staff";
        }
        field(50117; "Staff No."; Code[10])
        {
            Caption = 'Staff No.';
            DataClassification = ToBeClassified;
            TableRelation = if ("Applicant Type" = const(Staff)) Employee;

            trigger OnValidate()
            begin
                if EmpNo.Get("Staff No.") then begin
                    "First Name" := EmpNo."First Name";
                    "Middle Name" := EmpNo."Middle Name";
                    "Last Name" := EmpNo."Middle Name";
                    Religion := EmpNo.Religion;
                    "P.I.N No" := EmpNo."PIN Number";
                    "Date Of Birth" := EmpNo."Date Of Birth";
                    Validate("Date Of Birth");
                    Religion := EmpNo.Religion;
                    "N.H.I.F No" := EmpNo."NHIF No.";
                end;
            end;
        }
        field(50118; "P.I.N No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50119; Religion; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50120; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50121; "Disability Certificate No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50122; "Disability Summary"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(50123; "Residence County"; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            DataClassification = ToBeClassified;
            TableRelation = County1;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; Status, "Union Code")
        {
        }
        key(Key3; "Last Name", "First Name", "Middle Name")
        {
        }
    }

    fieldgroups
    {
        // fieldgroup(DropDown;"No.","First Name","Last Name","Full Names",Field6)
        // {
        // }
        // fieldgroup(Brick;"Last Name","First Name",Field6,Image)
        // {
        // }
    }

    trigger OnDelete()
    begin
        AlternativeAddr.SetRange("Employee No.", "No.");
        AlternativeAddr.DeleteAll;

        EmployeeQualification.SetRange("Employee No.", "No.");
        EmployeeQualification.DeleteAll;

        Relative.SetRange("Employee No.", "No.");
        Relative.DeleteAll;

        EmployeeAbsence.SetRange("Employee No.", "No.");
        EmployeeAbsence.DeleteAll;

        MiscArticleInformation.SetRange("Employee No.", "No.");
        MiscArticleInformation.DeleteAll;

        ConfidentialInformation.SetRange("Employee No.", "No.");
        ConfidentialInformation.DeleteAll;

        HumanResComment.SetRange("No.", "No.");
        HumanResComment.DeleteAll;

        DimMgt.DeleteDefaultDim(Database::Employee, "No.");
    end;

    trigger OnInsert()
    begin
        "Last Modified Date Time" := CurrentDatetime;
        if "No." = '' then begin
            HumanResSetup.Get;
            HumanResSetup.TestField("Employee Nos.");
            NoSeriesMgt.InitSeries(HumanResSetup."Employee Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin
        /*"Last Modified Date Time" := CURRENTDATETIME;
        "Last Date Modified" := TODAY;
        IF Res.READPERMISSION THEN
          EmployeeResUpdate.HumanResToRes(xRec,Rec);
        IF SalespersonPurchaser.READPERMISSION THEN
          EmployeeSalespersonUpdate.HumanResToSalesPerson(xRec,Rec);
        UpdateSearchName;*/

    end;

    trigger OnRename()
    begin
        DimMgt.RenameDefaultDim(Database::Employee, xRec."No.", "No.");
        "Last Modified Date Time" := CurrentDatetime;

        UpdateSearchName;
    end;

    var
        HumanResSetup: Record "Human Resources Setup";
        Res: Record Resource;
        PostCode: Record "Post Code";
        AlternativeAddr: Record "Alternative Address";
        EmployeeQualification: Record "Employee Qualification";
        Relative: Record "Employee Relative";
        EmployeeAbsence: Record "Employee Absence";
        MiscArticleInformation: Record "Misc. Article Information";
        ConfidentialInformation: Record "Confidential Information";
        HumanResComment: Record "Human Resource Comment Line";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmployeeResUpdate: Codeunit "Employee/Resource Update";
        EmployeeSalespersonUpdate: Codeunit "Employee/Salesperson Update";
        DimMgt: Codeunit DimensionManagement;
        Text000: label 'Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.';
        CauseOfAbsence: Record "Cause of Absence";
        Dates: Codeunit "HR Dates";
        SalPointer: Record "Salary Pointers";
        Scale: Record "Salary Scales";
        DateInt: Integer;
        Earnings: Record EarningsX;
        AssMatrix: Record "Assignment Matrix-X";
        Ded: Record DeductionsX;
        PayPeriod: Record "Payroll PeriodX";
        ScaleBenefits: Record "Scale Benefits";
        PeriodStartDate: Date;
        Begindate: Date;
        Payroll: Record Employee;
        OK: Boolean;
        "....added by daudi....": Integer;
        UserMgt: Codeunit "User Management";
        BlockedEmplForJnrlErr: label 'You cannot create this document because employee %1 is blocked due to privacy.', Comment = '%1 = employee no.';
        BlockedEmplForJnrlPostingErr: label 'You cannot post this document because employee %1 is blocked due to privacy.', Comment = '%1 = employee no.';
        EmployeeLinkedToResourceErr: label 'You cannot link multiple employees to the same resource. Employee %1 is already linked to that resource.', Comment = '%1 = employee no.';
        GTermination: Record "Grounds for Termination";
        EthnicBackground: Record "Ethnic Background";
        EmployeeBank: Record "Employee Bank AccountX";
        EmpNo: Record Employee;

    procedure AssistEdit(): Boolean
    begin
        HumanResSetup.Get;
        HumanResSetup.TestField("Employee Nos.");
        if NoSeriesMgt.SelectSeries(HumanResSetup."Employee Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            exit(true);
        end;
    end;

    procedure FullName(): Text[100]
    var
        NewFullName: Text[100];
        Handled: Boolean;
    begin
        /*OnBeforeGetFullName(Rec,NewFullName,Handled);
        IF Handled THEN
          EXIT(NewFullName);
        
        IF "Middle Name" = '' THEN
          EXIT("First Name" + ' ' + "Last Name");
        
        EXIT("First Name" + ' ' + "Middle Name" + ' ' + "Last Name");*/

    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::Employee, "No.", FieldNumber, ShortcutDimCode);
        Modify;
    end;

    procedure DisplayMap()
    var
        MapPoint: Record "Online Map Setup";
        MapMgt: Codeunit "Online Map Management";
    begin
        if MapPoint.FindFirst then
            MapMgt.MakeSelection(Database::Employee, GetPosition)
        else
            Message(Text000);
    end;


    procedure GetPayPeriod()
    begin
        PayPeriod.Reset;
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            //PayPeriodtext:=PayPeriod.Name;
            Begindate := PayPeriod."Starting Date";
            //MESSAGE('%1',Begindate);
        end;
    end;


    procedure CreateResource(): Boolean
    var
        ResourceRec: Record Resource;
        ResourceGroup: Record "Resource Group";
    begin
        /*IF NOT ResourceRec.GET("No.") THEN
        BEGIN
         ResourceRec."No.":="No.";
         ResourceRec.Name:="First Name"+' '+"Middle Name"+' '+"Last Name";
         ResourceRec."Job Title":="Job Title";
         ResourceRec.Type:=ResourceRec.Type::Person;
         {IF NOT ResourceGroup.GET("Salary Scale") THEN
           ERROR(Text000,"Salary Scale");}
         ResourceRec."Resource Group No.":="Salary Scale";
         ResourceRec.INSERT;
         EXIT(TRUE)
        END ELSE
        EXIT(FALSE);*/

    end;


    procedure CreateCustomer(): Boolean
    var
        CustRec: Record Customer;
        CashMgtSetup: Record "Cash Management Setup";
    begin
        if not CustRec.Get("No.") then begin
            CashMgtSetup.Get;
            CashMgtSetup.TestField("Imprest Posting Group");
            CustRec."No." := "No.";
            CustRec.Name := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            CustRec."Customer Posting Group" := CashMgtSetup."Imprest Posting Group";
            CustRec.Insert;
            exit(true)
        end else
            exit(false);
    end;

    local procedure UpdateSearchName()
    var
        PrevSearchName: Code[250];
    begin
    end;

    local procedure SetSearchNameToFullnameAndInitials(): Code[250]
    begin
    end;

    procedure GetBankAccountNo(): Text
    begin
    end;

    procedure CheckBlockedEmployeeOnJnls(IsPosting: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetFullName(Employee: Record Employee; var NewFullName: Text[100]; var Handled: Boolean)
    begin
    end;

    local procedure CheckIfAnEmployeeIsLinkedToTheResource(ResourceNo: Code[20])
    var
        Employee: Record Employee;
    begin
    end;

    local procedure NameBreakdown()
    var
        NamePart: array[30] of Text[100];
        TempName: Text[250];
        FirstName250: Text[250];
        i: Integer;
        NoOfParts: Integer;
    begin
        TempName := "Full Names";
        while StrPos(TempName, ' ') > 0 do begin
            if StrPos(TempName, ' ') > 1 then begin
                i := i + 1;
                NamePart[i] := CopyStr(TempName, 1, StrPos(TempName, ' ') - 1);
            end;
            TempName := CopyStr(TempName, StrPos(TempName, ' ') + 1);
        end;
        i := i + 1;
        NamePart[i] := CopyStr(TempName, 1, MaxStrLen(NamePart[i]));
        NoOfParts := i;

        "First Name" := '';
        "Middle Name" := '';
        "Last Name" := '';
        for i := 1 to NoOfParts do
            if (i = NoOfParts) and (NoOfParts > 1) then
                "Last Name" := CopyStr(NamePart[i], 1, MaxStrLen("Last Name"))
            else
                if (i = NoOfParts - 1) and (NoOfParts > 2) then
                    "Middle Name" := CopyStr(NamePart[i], 1, MaxStrLen("Middle Name"))
                else begin
                    FirstName250 := DelChr("First Name" + ' ' + NamePart[i], '<', ' ');
                    "First Name" := CopyStr(FirstName250, 1, MaxStrLen("First Name"));
                end;
    end;
}

