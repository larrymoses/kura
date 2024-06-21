#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69070 "Temporary Employee"
{
    Caption = 'Temporary Employee';
    DataCaptionFields = "No.", "First Name", "Middle Name", "Last Name";
    DrillDownPageID = "Temporary Employees List";
    LookupPageID = "Temporary Employees List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    HumanResSetup.Get;
                    NoSeriesMgt.TestManual(HumanResSetup."Temporary Employee Nos");
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
        field(5; Initials; Text[30])
        {
            Caption = 'Initials';
            TableRelation = Salutation;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Initials)) or ("Search Name" = '') then
                    "Search Name" := Initials;
            end;
        }
        field(6; "Job Title"; Text[250])
        {
            CalcFormula = lookup(Positions."Job Title" where("Position ID" = field("Job ID")));
            Caption = 'Job Title';
            Editable = true;
            FieldClass = FlowField;
        }
        field(7; "Search Name"; Code[250])
        {
            Caption = 'Search Name';

            trigger OnValidate()
            begin
                if "Search Name" = '' then
                    "Search Name" := SetSearchNameToFullnameAndInitials;
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
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
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
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(12; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
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
        field(16; "Alt. Address Code"; Code[10])
        {
            Caption = 'Alt. Address Code';
            TableRelation = "Alternative Address".Code where("Employee No." = field("No."));
        }
        field(17; "Alt. Address Start Date"; Date)
        {
            Caption = 'Alt. Address Start Date';
        }
        field(18; "Alt. Address End Date"; Date)
        {
            Caption = 'Alt. Address End Date';
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
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(26; "Manager No."; Code[10])
        {
            Caption = 'Manager No.';
            TableRelation = Employee;
        }
        field(27; "Emplymt. Contract Code"; Code[10])
        {
            Caption = 'Emplymt. Contract Code';
            TableRelation = "Employment Contract";
        }
        field(28; "Statistics Group Code"; Code[10])
        {
            Caption = 'Statistics Group Code';
            TableRelation = "Employee Statistics Group";
        }
        field(29; "Employment Date"; Date)
        {
            Caption = 'Employment Date';
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
        field(32; "Inactive Date"; Date)
        {
            Caption = 'Inactive Date';
        }
        field(33; "Cause of Inactivity Code"; Code[10])
        {
            Caption = 'Cause of Inactivity Code';
            TableRelation = "Cause of Inactivity";
        }
        field(34; "Termination Date"; Date)
        {
            Caption = 'Termination Date';
        }
        field(35; "Reason for termination Code"; Code[10])
        {
            Caption = 'Grounds for Term. Code';
            TableRelation = "Grounds for Termination";

            trigger OnValidate()
            begin
                if GTermination.Get("Reason for termination Code") then
                    "Reason for termination" := GTermination.Description;
            end;
        }
        field(36; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(37; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(38; "Resource No."; Code[20])
        {
            Caption = 'Resource No.';
            TableRelation = Resource where(Type = const(Person));

            trigger OnValidate()
            begin
                if ("Resource No." <> '') and Res.WritePermission then begin
                    CheckIfAnEmployeeIsLinkedToTheResource("Resource No.");
                    //EmployeeResUpdate.ResUpdate(Rec);
                end;
            end;
        }
        field(39; Comment; Boolean)
        {
            CalcFormula = exist("Human Resource Comment Line" where("Table Name" = const(Employee),
                                                                     "No." = field("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(41; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(42; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(43; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(44; "Cause of Absence Filter"; Code[10])
        {
            Caption = 'Cause of Absence Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cause of Absence";
        }
        field(45; "Total Absence (Base)"; Decimal)
        {
            CalcFormula = sum("Employee Absence"."Quantity (Base)" where("Employee No." = field("No."),
                                                                          "Cause of Absence Code" = field("Cause of Absence Filter"),
                                                                          "From Date" = field("Date Filter")));
            Caption = 'Total Absence (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(46; Extension; Text[30])
        {
            Caption = 'Extension';
        }
        field(47; "Employee No. Filter"; Code[20])
        {
            Caption = 'Employee No. Filter';
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(48; Pager; Text[30])
        {
            Caption = 'Pager';
        }
        field(49; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
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
        field(52; "Salespers./Purch. Code"; Code[20])
        {
            Caption = 'Salespers./Purch. Code';
            TableRelation = "Salesperson/Purchaser";
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
        field(55; "Employee Posting Group"; Code[20])
        {
            Caption = 'Employee Posting Group';
            TableRelation = "Employee Posting Group";
        }
        field(56; "Bank Branch No."; Text[20])
        {
            Caption = 'Bank Branch No.';
        }
        field(57; "Bank Account No."; Text[30])
        {
            Caption = 'Bank Account No.';
        }
        field(58; Iban; Code[40])
        {
            Caption = 'IBAN';

            trigger OnValidate()
            var
                CompanyInfo: Record "Company Information";
            begin
                CompanyInfo.CheckIBAN(Iban);
            end;
        }
        field(59; Balance; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Employee Ledger Entry".Amount where("Employee No." = field("No."),
                                                                              "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                              "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                              "Posting Date" = field("Date Filter")));
            Caption = 'Balance';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60; "SWIFT Code"; Code[20])
        {
            Caption = 'SWIFT Code';
            TableRelation = "SWIFT Code";
            ValidateTableRelation = false;
        }
        field(80; "Application Method"; Option)
        {
            Caption = 'Application Method';
            OptionCaption = 'Manual,Apply to Oldest';
            OptionMembers = Manual,"Apply to Oldest";
        }
        field(140; Image; Media)
        {
            Caption = 'Image';
            ExtendedDatatype = Person;
        }
        field(150; "Privacy Blocked"; Boolean)
        {
            Caption = 'Privacy Blocked';
        }
        field(1100; "Cost Center Code"; Code[15])
        {
            Caption = 'Cost Center Code';
            TableRelation = "Cost Center";
        }
        field(1101; "Cost Object Code"; Code[20])
        {
            Caption = 'Cost Object Code';
            TableRelation = "Cost Object";
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
        field(50000; "Payroll Number"; Code[20])
        {
        }
        field(50001; Rank; Option)
        {
            OptionCaption = 'ADMIN';
            OptionMembers = ADMIN;
        }
        field(50002; Branch; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('BRANCH')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                CalcFields(Branch);
            end;
        }
        field(50003; "Registration Code"; Code[10])
        {
            Caption = 'Registration Code';
            TableRelation = "Cause of Absence";

            trigger OnValidate()
            begin
                if CauseOfAbsence.Get("Registration Code") then
                    //Description := CauseOfAbsence.Description;

                    if "Registration Code" <> '' then begin
                        //VALIDATE("Unit of Measure Code",CauseOfAbsence."Unit of Measure Code");
                        // "Quantity (Base)":=1;
                        //VALIDATE("Quantity (Base)");
                    end;


                if "Registration Code" = 'D' then
                    Shift := Shift::DAY;
                if "Registration Code" = 'N' then
                    Shift := Shift::NIGHT;
                if "Registration Code" = 'RD' then
                    Shift := Shift::DAY;
                if "Registration Code" = 'RN' then
                    Shift := Shift::NIGHT;
                if "Registration Code" = 'POD' then
                    Shift := Shift::DAY;
                if "Registration Code" = 'PON' then
                    Shift := Shift::NIGHT;


                /*
               IF "Registration Code"='O' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;
               IF "Registration Code"='L' THEN BEGIN
               Shift:=Shift::DAY;
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;
               IF "Registration Code"='AB' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='P' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='UL' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               END;

               IF "Registration Code"='SB' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='SBH' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;


               IF "Registration Code"='SUP' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='T' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='SC' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='S' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='M' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='COD' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='CON' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;


               IF "Registration Code"='' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;
                */

            end;
        }
        field(50004; Shift; Option)
        {
            OptionCaption = ' ,DAY,NIGHT';
            OptionMembers = " ",DAY,NIGHT;
        }
        field(50005; "Starting Date"; Date)
        {
        }
        field(50006; "Ending Date"; Date)
        {
        }
        field(50007; DaysDeployed; Integer)
        {
            CalcFormula = count("Employee Absence" where("Employee No." = field("No."),
                                                          Checked = filter(true)));
            FieldClass = FlowField;
        }
        field(50008; Paypoint; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('PAYPOINT')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                CalcFields(Branch);
            end;
        }
        field(50009; "Country Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('COUNTRY'));
        }
        field(50010; "Staffing Group"; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('STAFFINGGRP')));
            FieldClass = FlowField;
        }
        field(50011; Department; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('DEPARTMENT')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50012; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
        }
        field(50013; "Region Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('REGION'));
        }
        field(50014; "Projects Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('PROJECTS'));
        }
        field(50015; "Total Allowances"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where(Type = const(Payment),
                                                                         "Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         "Non-Cash Benefit" = const(false),
                                                                         "Normal Earnings" = const(true),
                                                                         "Pay Mode" = field("Pay Mode Filter"),
                                                                         "Responsibility Center" = field("ResponsibilityCtr Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Total Deductions"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where(Type = filter(Deduction | Loan),
                                                                         "Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         "Responsibility Center" = field("ResponsibilityCtr Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; Payment; Code[10])
        {
            // TableRelation = "Bracket Tablesx";
        }
        field(50018; Deduction; Code[10])
        {
            TableRelation = "Assignment Matrix-X Temp-E";
        }
        field(50019; "Posting Group"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Employee Posting GroupX Temp".Code;
        }
        field(50020; "Total Savings"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where("Employee No" = field("No."),
                                                                         Type = const("Saving Scheme"),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         Honoraria = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50021; "Bank Account Number"; Code[100])
        {
        }
        field(50022; "Bank Branch"; Code[100])
        {
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Employee's Bank"));

            trigger OnValidate()
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(EmployeeBank.Code, "Employee's Bank");
                EmployeeBank.SetRange(EmployeeBank."Bank Branch No.", "Bank Branch");
                if EmployeeBank.FindSet() then begin
                    "Bank Branch Name" := EmployeeBank."Branch Name";
                end;
            end;
        }
        field(50023; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodXT"."Starting Date";
        }
        field(50024; MobileBills; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                     Closed = const(false),
                                                                     Code = const('E003'),
                                                                     "Employee No" = field("No.")));
            FieldClass = FlowField;
        }
        field(50025; "Opening PAYE"; Decimal)
        {
        }
        field(50026; "Tax Deductible to Date"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where("Tax Deductible" = const(true),
                                                                         "Employee No" = field("No."),
                                                                         "Payroll Period" = field(upperlimit("Pay Period Filter"))));
            FieldClass = FlowField;
        }
        field(50027; "SSF Employer to Date"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E"."Employer Amount" where("Tax Deductible" = const(true),
                                                                                    "Employee No" = field("No."),
                                                                                    "Payroll Period" = field(upperlimit("Pay Period Filter"))));
            FieldClass = FlowField;
        }
        field(50028; "Opening Employer SSF"; Decimal)
        {
        }
        field(50029; "Cumm. Basic Pay"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E"."Basic Pay" where("Payroll Period" = field("Pay Period Filter"),
                                                                              "Employee No" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; "Tax Relief Amount"; Decimal)
        {
        }
        field(50031; "P.I.N"; Code[20])
        {
        }
        field(50032; "Passport No."; Code[20])
        {
        }
        field(50033; "Cumm. PAYE"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where("Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         Paye = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50034; "Cumm. Net Pay"; Decimal)
        {
            Editable = false;
        }
        field(50037; "N.H.I.F No"; Code[20])
        {
        }
        field(50038; "Hourly Rate"; Decimal)
        {
        }
        field(50039; "Daily Rate"; Decimal)
        {
        }
        field(50040; "Pays N.H.I.F"; Boolean)
        {
        }
        field(50041; "Last Modified By"; Code[20])
        {
            Editable = false;
        }
        field(50042; "Gross Cash"; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X Temp-E".Amount where(Type = const(Payment),
                                                                            Closed = const(false),
                                                                            Code = const('E001'),
                                                                            "Employee No" = field("No.")));
            FieldClass = FlowField;
        }
        field(50043; "Debtor Code"; Code[10])
        {
            TableRelation = Customer;
        }
        field(50045; "Benefits-Non Cash"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where("Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         "Non-Cash Benefit" = const(true),
                                                                         Type = const(Payment),
                                                                         Taxable = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50046; "Pay Mode"; Option)
        {
            OptionMembers = Bank,Cash,Cheque,"Bank Transfer";
        }
        field(50047; Housing; Option)
        {
            OptionMembers = Agricultural,Directors,Ordinary;
        }
        field(50048; "Home Savings"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Type = const(Deduction),
                                                                  "Tax Deductible" = const(true),
                                                                  Retirement = const(false)));
            FieldClass = FlowField;
        }
        field(50049; "Retirement Contribution"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where("Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         "Tax Deductible" = const(true),
                                                                         Retirement = const(true)));
            FieldClass = FlowField;
        }
        field(50050; "Home Ownership Status"; Option)
        {
            OptionMembers = "None","Owner Occupier","Home Savings";
        }
        field(50051; "Owner Occupier"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Type = const(Payment),
                                                                  "Tax Deductible" = const(true)));
            FieldClass = FlowField;
        }
        field(50052; "National ID"; Code[20])
        {
        }
        field(50053; "House Rent"; Decimal)
        {
        }
        field(50054; "Employer Rent"; Boolean)
        {
        }
        field(50055; "Total Quarters"; Decimal)
        {
        }
        field(50056; "Cumulative Quarters"; Decimal)
        {
            CalcFormula = sum("Employee Ledger EntryX".Quarters where(Employee = field("No."),
                                                                       "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(50057; BfMpr; Decimal)
        {
            CalcFormula = sum("Employee Ledger EntryX".BfMpr where(Employee = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(50058; PensionNo; Code[10])
        {
        }
        field(50059; "Salary Scheme Category"; Code[20])
        {
            // TableRelation = Categoryx;
        }
        field(50060; "Salary Steps"; Code[20])
        {

            trigger OnValidate()
            begin
                /*IF Employee.GET("No.") THEN
                IF Status=Employee.Status::Active THEN
                BEGIN
                // populate the basic salary based on the steps
                IF SalaryStep.GET("Salary Steps",SalaryStep.Level::"Level 1","Salary Scheme Category") THEN BEGIN
                 "Basic Pay":=SalaryStep."Basic amount";
                "Gross pay":=SalaryStep."Gross pay";
                END;
                // Get first open pay period
                PayPeriod.RESET;
                PayPeriod.SETRANGE(PayPeriod.Closed,FALSE);
                IF PayPeriod.FIND('-') THEN
                CurrentMonth:=PayPeriod."Starting Date";
                //House all
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."House All. Code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."House allowance";
                  AssMatrix.MODIFY;
                END; */
                /*
                //std allowance
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Standard Overtime code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Standard overtime";
                  AssMatrix.MODIFY;
                END;
                //duty allowance
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Duty Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Duty allowance";
                  AssMatrix.MODIFY;
                END;
                //personal allow
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Personal Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Personal allowance";
                  AssMatrix.MODIFY;
                END;
                // performance
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Performance Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Perfomance allowance";
                  AssMatrix.MODIFY;
                END;
                //Standard Allowance
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Std Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Std Allowance";
                  AssMatrix.MODIFY;
                END;
                // Dog handler
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Dog handlers allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Dog handlers allowance";
                  AssMatrix.MODIFY;
                END;
                
                // Public holiday
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Public holiday allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Public holiday allowance";
                  AssMatrix.MODIFY;
                END;
                
                // Insert
                
                //House all
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."House All. Code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."House All. Code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."House All. Code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."House allowance";
                  IF AssMatrix.Amount<>0 THEN
                    AssMatrix.INSERT;
                END;
                //std allowance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Standard Overtime code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Standard Overtime code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Standard Overtime code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Standard overtime";
                 IF AssMatrix.Amount<>0 THEN
                  AssMatrix.INSERT;
                END;
                //duty allowance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Duty Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Duty Allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Duty Allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Duty allowance";
                  IF AssMatrix.Amount<>0 THEN
                   AssMatrix.INSERT;
                END;
                //personal allow
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Personal Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Personal Allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Personal Allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Personal allowance";
                  IF AssMatrix.Amount<>0 THEN
                  AssMatrix.INSERT;
                END;
                //Standard allowance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Std Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Std Allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Personal Allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Std Allowance";
                  IF AssMatrix.Amount<>0 THEN
                  AssMatrix.INSERT;
                END;
                // Dog handler
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Dog handlers allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Dog handlers allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Dog handlers allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Dog handlers allowance";
                  IF AssMatrix.Amount<>0 THEN
                  AssMatrix.INSERT;
                END;
                
                // performance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Performance Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Performance Allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Performance Allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix.Amount:=SalaryStep."Perfomance allowance";
                  IF AssMatrix.Amount<>0 THEN
                   AssMatrix.INSERT;
                END;
                
                // Public holiday allowance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Public holiday allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Public holiday allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Public holiday allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix.Amount:=SalaryStep."Public holiday allowance";
                  IF AssMatrix.Amount<>0 THEN
                   AssMatrix.INSERT;
                
                
                END;
                END ELSE
                ERROR('Employee not active');  */

            end;
        }
        field(50061; Level; Option)
        {
            OptionMembers = "Level 1","Level 2";
        }
        field(50065; "Share Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  Shares = const(true)));
            Caption = 'coop skg fund';
            FieldClass = FlowField;
        }
        field(50066; TRelief; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                     Closed = const(false),
                                                                     Code = const('E002'),
                                                                     "Employee No" = field("No.")));
            FieldClass = FlowField;
        }
        field(50067; Overtime; Decimal)
        {
            Editable = false;
        }
        field(50068; Absence; Decimal)
        {
        }
        field(50069; "Other allowances"; Decimal)
        {
        }
        field(50070; "Total earnings"; Decimal)
        {
        }
        field(50071; PAYE; Decimal)
        {
        }
        field(50072; NHIF; Decimal)
        {
        }
        field(50073; NSSF; Code[50])
        {
        }
        field(50074; Advance; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Deduction),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Code = field("Advance Code Filter")));
            FieldClass = FlowField;
        }
        field(50075; Loans; Decimal)
        {
        }
        field(50076; COOP; Decimal)
        {
        }
        field(50077; "Other deductions"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where("Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         Paye = const(false)));
            FieldClass = FlowField;
        }
        field(50079; "Net pay"; Decimal)
        {
        }
        field(50080; "Advance Code Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = DeductionsX.Code;
        }
        field(50081; "Gross pay"; Decimal)
        {
        }
        field(50082; interest; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Interest Amount" where("Employee No" = field("No."),
                                                                             "Payroll Period" = field("Pay Period Filter"),
                                                                             Type = filter(Deduction)));
            FieldClass = FlowField;
        }
        field(50083; "Working Hours"; Decimal)
        {

            trigger OnValidate()
            begin
                "Hourly Rate" := "Daily Rate" / "Working Hours";
            end;
        }
        field(50084; "No. Of Days Worked"; Decimal)
        {
            Editable = false;
        }
        field(50085; "No. of Hours"; Decimal)
        {
            Editable = false;
        }
        field(50086; "No. Of Hours Weekend"; Decimal)
        {
            Editable = false;
        }
        field(50087; Basic; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where(Type = const(Payment),
                                                                         "Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         "Basic Salary Code" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50088; ECode; Code[10])
        {
        }
        field(50089; SKey; Code[20])
        {
        }
        field(50090; Employer; Code[20])
        {
        }
        field(50091; "Taxable Income"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where("Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         Taxable = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50092; "Job ID"; Code[20])
        {
            TableRelation = Positions;
        }
        field(50094; "Home Phone Number"; Text[15])
        {
        }
        field(50095; "Cellular Phone Number"; Text[15])
        {
        }
        field(50096; "Work Phone Number"; Text[15])
        {
        }
        field(50097; "Ext."; Text[7])
        {
        }
        field(50098; "ID Number"; Text[30])
        {
            trigger OnValidate()
            begin
                ValidateIDNumber(Rec."No.",Rec."ID Number");
            end;
        }
        field(50099; Gender1; Option)
        {
            OptionMembers = Female,Male;
        }
        field(50100; "Fax Number"; Text[30])
        {
        }
        field(50104; "Known As"; Text[30])
        {

            trigger OnValidate()
            begin
                /*IF (("Known As" <> xRec."Known As") AND  (xRec."Known As" <> ''))  THEN BEGIN
                       CareerEvent.SetMessage('Changing First Name in Career History');
                       CareerEvent.RUNMODAL;
                       OK:= CareerEvent.ReturnResult;
                        IF OK THEN BEGIN
                           CareerHistory.INIT;
                           IF NOT CareerHistory.FIND('-') THEN
                            CareerHistory."Line No.":=1
                          ELSE BEGIN
                            CareerHistory.FIND('+');
                            CareerHistory."Line No.":=CareerHistory."Line No."+1;
                          END;
                
                           CareerHistory.Reason := CareerEvent.ReturnReason;
                           CareerHistory."Employee No.":= "No.";
                           CareerHistory."Date Of Event":= WORKDATE;
                           CareerHistory."Career Event":= 'Surname Changed';
                           CareerHistory."Last Name":= "Last Name";
                           CareerHistory."Employee First Name":= "Known As";
                           CareerHistory."Employee Last Name":= "Last Name";
                
                           CareerHistory.INSERT;
                        END;
                    END;
                  */

            end;
        }
        field(50105; Position; Text[30])
        {
            // TableRelation = "ManPower Planning Lines";

            trigger OnValidate()
            begin
                /*IF Jobs.GET(Position) THEN
                    "Job Title":=Jobs."Job Description";
                
                
                    IF ((Position <> xRec.Position) AND (xRec.Position <> '')) THEN BEGIN
                        Jobs.RESET;
                        Jobs.SETRANGE(Jobs."Job ID",Position);
                        IF Jobs.FIND('-') THEN BEGIN
                        "Job Title":=Jobs."Job Description";
                
                            Payroll.RESET;
                            Payroll.SETRANGE(Payroll."No.","No.");
                            IF Payroll.FIND('-') THEN BEGIN
                                Payroll."Salary Scheme Category":=Jobs.Category;
                                Payroll."Salary Steps":=Jobs.Grade;
                                Payroll.VALIDATE(Payroll."Salary Steps");
                                Payroll.MODIFY;
                            END
                        END;
                */

                /*

                  CareerEvent.SetMessage('Job Title Changed');
                  CareerEvent.RUNMODAL;
                  OK:= CareerEvent.ReturnResult;
                   IF OK THEN BEGIN
                      CareerHistory.INIT;
                      IF NOT CareerHistory.FIND('-') THEN
                       CareerHistory."Line No.":=1
                     ELSE BEGIN
                       CareerHistory.FIND('+');
                       CareerHistory."Line No.":=CareerHistory."Line No."+1;
                     END;

                      CareerHistory."Employee No.":= "No.";
                      CareerHistory."Date Of Event":= WORKDATE;
                      CareerHistory."Career Event":= 'Job Title Changed';
                      CareerHistory."Job Title":= "Job Title";
                      CareerHistory."Employee First Name":= "Known As";
                      CareerHistory."Employee Last Name":= "Last Name";
                      CareerHistory.INSERT;
                   END;
                  */

                // END;

            end;
        }
        field(50106; "Full / Part Time"; Option)
        {
            OptionMembers = "Full Time"," Part Time";

            trigger OnValidate()
            begin
                /*IF ("Full / Part Time" <> xRec."Full / Part Time") THEN BEGIN
                   CareerEvent.SetMessage('Full / Part Time Changed');
                   CareerEvent.RUNMODAL;
                   OK:= CareerEvent.ReturnResult;
                    IF OK THEN BEGIN
                       CareerHistory.INIT;
                       IF NOT CareerHistory.FIND('-') THEN
                        CareerHistory."Line No.":=1
                      ELSE BEGIN
                        CareerHistory.FIND('+');
                        CareerHistory."Line No.":=CareerHistory."Line No."+1;
                      END;

                       CareerHistory."Employee No.":= "No.";
                       CareerHistory."Date Of Event":= WORKDATE;
                       CareerHistory."Career Event":= 'Full / Part Time Changed';
                       CareerHistory."Full/Part Time":= "Full / Part Time";
                       CareerHistory."Employee First Name":= "Known As";
                       CareerHistory."Employee Last Name":= "Last Name";
                       CareerHistory.INSERT;
                    END;
                END;
               */

            end;
        }
        field(50107; "Contract Type"; Code[20])
        {
        }
        field(50108; "Contract End Date"; Date)
        {
        }
        field(50109; "Notice Period"; Code[10])
        {
        }
        field(50110; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;

            trigger OnValidate()
            begin
                /* IF ("Marital Status" <> xRec."Marital Status") THEN BEGIN
                    CareerEvent.SetMessage('Marital Status Changed');
                    CareerEvent.RUNMODAL;
                    OK:= CareerEvent.ReturnResult;
                     IF OK THEN BEGIN
                        CareerHistory.INIT;
                        IF NOT CareerHistory.FIND('-') THEN
                         CareerHistory."Line No.":=1
                       ELSE BEGIN
                         CareerHistory.FIND('+');
                         CareerHistory."Line No.":=CareerHistory."Line No."+1;
                       END;

                        CareerHistory."Employee No.":= "No.";
                        CareerHistory."Date Of Event":= WORKDATE;
                        CareerHistory."Career Event":= 'Marital Status Changed';
                        CareerHistory."Marital Status":= "Marital Status";
                        CareerHistory."Employee First Name":= "Known As";
                        CareerHistory."Employee Last Name":= "Last Name";
                        CareerHistory.INSERT;
                     END;
                 END;
                 */

            end;
        }
        field(50111; "Ethnic Origin"; Text[50])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Ethnic Background"."Ethnic group";
        }
        field(50112; "First Language (R/W/S)"; Code[10])
        {
            // TableRelation = "ManPower Planning Lines";
        }
        field(50113; "Driving Licence"; Code[20])
        {
        }
        field(50114; "Date Of Birth"; Date)
        {
        }
        field(50115; Age; Text[80])
        {
        }
        field(50116; "Date Of Join"; Date)
        {

            trigger OnValidate()
            begin
                /*HumanResSetup.GET;
                DateInt:=DATE2DMY("Date Of Join",1);
                "Pro-Rata on Joining":=HumanResSetup."No. Of Days in Month"-DateInt+1;
                
                */

            end;
        }
        field(50117; "Length Of Service"; Text[80])
        {
        }
        field(50118; "End Of Probation Date"; Date)
        {
        }
        field(50119; "Pension Scheme Join"; Date)
        {

            trigger OnValidate()
            begin
                if ("Date Of Leaving" <> 0D) and ("Pension Scheme Join" <> 0D) then
                    "Time Pension Scheme" := Dates.DetermineAge("Pension Scheme Join", "Date Of Leaving");
            end;
        }
        field(50120; "Time Pension Scheme"; Text[70])
        {
        }
        field(50121; "Medical Scheme Join"; Date)
        {

            trigger OnValidate()
            begin
                /*  IF  ("Date Of Leaving" <> 0D) AND ("Medical Scheme Join" <> 0D) THEN
                   "Time Medical Scheme":= Dates.DetermineAge("Medical Scheme Join","Date Of Leaving");
                */

            end;
        }
        field(50122; "Time Medical Scheme"; Text[70])
        {
            //This property is currently not supported
            //TestTableRelation = true;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = true;
        }
        field(50123; "Date Of Leaving"; Date)
        {

            trigger OnValidate()
            begin
                /*  IF ("Date Of Join" <> 0D) AND ("Date Of Leaving" <> 0D) THEN
                   "Length Of Service":= Dates.DetermineAge("Date Of Join","Date Of Leaving");
                  IF ("Pension Scheme Join" <> 0D) AND ("Date Of Leaving" <> 0D) THEN
                   "Time Pension Scheme":= Dates.DetermineAge("Pension Scheme Join","Date Of Leaving");
                  IF ("Medical Scheme Join" <> 0D) AND ("Date Of Leaving" <> 0D) THEN
                   "Time Medical Scheme":= Dates.DetermineAge("Medical Scheme Join","Date Of Leaving");


                  IF ("Date Of Leaving" <> 0D) AND ("Date Of Leaving" <> xRec."Date Of Leaving") THEN BEGIN
                     ExitInterviews.SETRANGE("Employee No.","No.");
                     OK:= ExitInterviews.FIND('-');
                     IF OK THEN BEGIN
                       ExitInterviews."Date Of Leaving":= "Date Of Leaving";
                       ExitInterviews.MODIFY;
                     END;
                     COMMIT();
                  END;


                 IF ("Date Of Leaving" <> 0D) AND ("Date Of Leaving" <> xRec."Date Of Leaving") THEN BEGIN
                    CareerEvent.SetMessage('Left The Company');
                    CareerEvent.RUNMODAL;
                    OK:= CareerEvent.ReturnResult;
                     IF OK THEN BEGIN
                        CareerHistory.INIT;
                        IF NOT CareerHistory.FIND('-') THEN
                         CareerHistory."Line No.":=1
                       ELSE BEGIN
                         CareerHistory.FIND('+');
                         CareerHistory."Line No.":=CareerHistory."Line No."+1;
                       END;

                        CareerHistory."Employee No.":= "No.";
                        CareerHistory."Date Of Event":= "Date Of Leaving";
                        CareerHistory."Career Event":= 'Left The Company';
                        CareerHistory."Employee First Name":= "Known As";
                        CareerHistory."Employee Last Name":= "Last Name";

                        CareerHistory.INSERT;
                     END;
                 END;
               */

            end;
        }
        field(50124; "Second Language (R/W/S)"; Code[10])
        {
        }
        field(50125; "Additional Language"; Code[10])
        {
        }
        field(50126; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;

            trigger OnValidate()
            var
                "Lrec Resource": Record Resource;
                OK: Boolean;
            begin
                //**Added by ACR 12/08/2002
                //**Block resource if Terminated

                if "Resource No." <> '' then begin
                    OK := "Lrec Resource".Get("Resource No.");
                    "Lrec Resource".Blocked := true;
                    "Lrec Resource".Modify;
                end;

                //**
            end;
        }
        field(50127; "Department:"; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
        }
        field(50129; Citizenship; Code[10])
        {
        }
        field(50130; "Passport Number"; Text[20])
        {
        }
        field(50137; "PIN Number"; Code[20])
        {
        }
        field(50138; "NSSF No."; Code[20])
        {
        }
        field(50139; "NHIF No."; Code[20])
        {
        }
        field(50142; "HELB No"; Text[30])
        {
        }
        field(50143; "Co-Operative No"; Text[30])
        {
        }
        field(50144; "Position To Succeed"; Code[20])
        {
            // TableRelation = "ManPower Planning Lines"."Entry No";

            trigger OnValidate()
            begin
                /*SuccessionGap.RESET;
                SuccessionGap.SETRANGE(SuccessionGap."Employee No","No.");
                IF SuccessionGap.FIND('-') THEN
                SuccessionGap.DELETEALL;
                
                JobReq.RESET;
                JobReq.SETRANGE(JobReq."Job Id","Position To Succeed");
                IF JobReq.FIND('-') THEN
                BEGIN
                REPEAT
                IF NOT EmpQualification.GET("No.",JobReq."Qualification Code") THEN
                BEGIN
                SuccessionGap.INIT;
                SuccessionGap."Employee No":="No.";
                SuccessionGap."Job Id":=JobReq."Job Id";
                SuccessionGap."Qualification Type":=JobReq."Qualification Type";
                SuccessionGap."Qualification Code":=JobReq."Qualification Code";
                SuccessionGap.Qualification:=JobReq.Qualification;
                SuccessionGap.Priority:=JobReq.Priority;
                SuccessionGap.INSERT;
                END;
                UNTIL JobReq.NEXT = 0;
                END;
                */

            end;
        }
        field(50145; "Succesion Date"; Date)
        {
        }
        field(50146; "Send Alert to"; Code[80])
        {
        }
        field(50147; Religion; Code[20])
        {
        }
        field(50149; "Served Notice Period"; Boolean)
        {
        }
        field(50150; "Exit Interview Date"; Date)
        {
        }
        field(50151; "Exit Interview Done by"; Code[100])
        {
            TableRelation = "User Setup";
        }
        field(50152; "Allow Re-Employment In Future"; Boolean)
        {
        }
        field(50153; "Postal Address"; Text[80])
        {
        }
        field(50154; "Residential Address"; Text[80])
        {
        }
        field(50155; "Postal Address2"; Text[30])
        {
        }
        field(50156; "Postal Address3"; Text[20])
        {
        }
        field(50157; "Residential Address2"; Text[30])
        {
        }
        field(50158; "Residential Address3"; Text[20])
        {
        }
        field(50159; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(50160; "Incremental Month"; Text[30])
        {
        }
        field(50161; "Current Date"; Date)
        {
        }
        field(50162; Present; Code[30])
        {
            // TableRelation = "Salary Pointers2"."Salary Pointer";
            TableRelation = "Scale Benefits"."Salary Pointer";

            trigger OnValidate()
            begin
                GetPayPeriod;

                ScaleBenefits.Reset;
                ScaleBenefits.SetRange(ScaleBenefits."Salary Scale", "Salary Scale");
                ScaleBenefits.SetRange(ScaleBenefits."Salary Pointer", Present);
                if ScaleBenefits.Find('-') then
                    repeat
                        AssMatrix.Init;

                        AssMatrix."Employee No" := "No.";
                        AssMatrix.Validate(AssMatrix."Employee No");
                        AssMatrix.Type := AssMatrix.Type::Payment;
                        AssMatrix.Code := ScaleBenefits."ED Code";
                        AssMatrix.Validate(AssMatrix.Code);
                        //MESSAGE('Payroll period %1',Begindate);
                        AssMatrix."Payroll Period" := Begindate;
                        AssMatrix.Amount := ScaleBenefits.Amount;
                        if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period",
                        AssMatrix."Reference No") then
                            AssMatrix.Insert;

                    until ScaleBenefits.Next = 0;
            end;
        }
        field(50163; Previous; Code[30])
        {
            Editable = false;
            TableRelation = "Salary Pointers"."Salary Pointer";
        }
        field(50164; Halt; Code[30])
        {
            Editable = false;
        }
        field(50165; "Salary Scale"; Code[30])
        {
            TableRelation = "Salary Scales".Scale where("Temporary Scale" = const(true));

            trigger OnValidate()
            begin
                if Scale.Get("Salary Scale") then
                    Halt := Scale."Maximum Pointer";
            end;
        }
        field(50166; Insurance; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where("Employee No" = field("No."),
                                                                         Type = filter(Deduction),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         "Insurance Code" = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50167; "days worked"; Decimal)
        {
        }
        field(50168; "Pro-Rata on Joining"; Decimal)
        {
        }
        field(50169; "Pro-rata on Leaving"; Decimal)
        {
        }
        field(50170; "Date OfJoining Payroll"; Date)
        {
        }
        field(50171; "PAYE Diff"; Decimal)
        {
        }
        field(50172; "Pro-Rata Calculated"; Boolean)
        {
        }
        field(50173; "Half Pay"; Boolean)
        {
        }
        field(50174; "Basic Arrears"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where(Type = const(Payment),
                                                                         "Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         "Basic Pay Arrears" = const(true)));
            FieldClass = FlowField;
        }
        field(50175; "Relief Amount"; Decimal)
        {
            CalcFormula = - sum("Assignment Matrix-X Temp-E".Amount where("Employee No" = field("No."),
                                                                          "Payroll Period" = field("Pay Period Filter"),
                                                                          "Non-Cash Benefit" = const(true),
                                                                          Type = const(Payment),
                                                                          "Tax Deductible" = const(true),
                                                                          "Tax Relief" = const(false)));
            FieldClass = FlowField;
        }
        field(50176; "Employee Qty"; Integer)
        {
            CalcFormula = count(Employee);
            FieldClass = FlowField;
        }
        field(50177; "Employee Act. Qty"; Integer)
        {
            CalcFormula = count(Employee where(Status = const(Active)));
            FieldClass = FlowField;
        }
        field(50178; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = count(Employee where(Status = filter(Inactive | Terminated)));
            FieldClass = FlowField;
        }
        field(50179; "Other Language Read"; Boolean)
        {
        }
        field(50180; "Other Language Write"; Boolean)
        {
        }
        field(50181; "Other Language Speak"; Boolean)
        {
        }
        field(50182; "Employee Job Type"; Option)
        {
            OptionCaption = '  ,Driver';
            OptionMembers = "  ",Driver;
        }
        field(50183; cumul; Integer)
        {
        }
        field(50184; Country; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('COUNTRY')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                CalcFields(Branch);
            end;
        }
        field(50185; Region; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('REGION')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                CalcFields(Branch);
            end;
        }
        field(50186; Projects; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('PROJECTS')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                CalcFields(Branch);
            end;
        }
        field(57006; "Responsibility Center"; Code[30])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(69000; "Pays SSF?"; Boolean)
        {
        }
        field(69001; "Pays tax?"; Boolean)
        {
        }
        field(69002; "Section/Location"; Code[10])
        {

            trigger OnValidate()
            begin
                //IF SalaryGrade.GET("Salary Grade") THEN
                //"Basic Pay":=SalaryGrade."Minimum salary";
                //MaximumPay:=SalaryGrade."Maximum Salary";
            end;
        }
        field(69003; "Basic Pay"; Decimal)
        {
        }
        field(69004; "Salary Type"; Code[10])
        {
        }
        field(69005; "Paid Overtime?"; Boolean)
        {
        }
        field(69006; "Tax Relief"; Boolean)
        {
        }
        field(69007; "Overtime taxed"; Boolean)
        {
        }
        field(69008; "Agency Car"; Boolean)
        {
        }
        field(69009; "Housed by Employer"; Boolean)
        {
        }
        field(69010; "Employee's Bank"; Code[80])
        {
            TableRelation = "Employee Bank AccountX";

            trigger OnValidate()
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(EmployeeBank.Code, "Employee's Bank");
                if EmployeeBank.FindSet() then begin
                    "Bank Name" := EmployeeBank."Bank Name";
                    //"Bank Branch Name" := EmployeeBank."Branch Name";
                    //"Bank Branch" := EmployeeBank."Bank Branch No.";
                end;
            end;
        }
        field(69011; "Paying Bank Code"; Code[10])
        {
            TableRelation = "Bank Account";
        }
        field(69012; "Taxable Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where(Taxable = const(true),
                                                                         "Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         "Responsibility Center" = field("Responsibility Center")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69013; "Tax Deductible Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where("Tax Deductible" = const(true),
                                                                         "Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         "Non-Cash Benefit" = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69014; "Employee Type"; Code[10])
        {
        }
        field(69015; "Total Allowances1"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where(Type = const(Payment),
                                                                         "Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         "Non-Cash Benefit" = const(false),
                                                                         "Normal Earnings" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69016; "Bank Name"; Text[100])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Bank Name" where(Code = field("Employee's Bank"),
                                                                             "Bank Branch No." = field("Bank Branch")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69017; "Bank Branch Name"; Text[100])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Branch Name" where("Bank Branch No." = field("Bank Branch"),
                                                                               Code = field("Employee's Bank")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69019; "Terminal Dues"; Boolean)
        {
        }
        field(69020; "Normal Working Days"; Integer)
        {
            CalcFormula = count("Employee Absence" where("Cause of Absence Code" = filter('D' | 'N' | 'RD' | 'RN' | 'T' | 'SUP' | 'SB' | 'IND' | 'U'),
                                                          Checked = const(true),
                                                          "Employee No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69021; "Public Holiday Days"; Integer)
        {
            Editable = false;
        }
        field(69022; "Absent Days"; Integer)
        {
            Editable = false;
        }
        field(69023; "Pay Wages"; Boolean)
        {
        }
        field(69024; "Payroll Group"; Option)
        {
            CalcFormula = lookup("Employee Posting GroupX"."Payroll Group" where(Code = field("Posting Group")));
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = ' ,Guards,Admin,Management';
            OptionMembers = " ",Guards,Admin,Management;
        }
        field(69025; "Payroll Period"; Date)
        {
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
        field(69026; "Exempt Job Book OT/LD"; Boolean)
        {
        }
        field(69027; "Night Allowance Days"; Integer)
        {
            Editable = false;
        }
        field(69028; "Unpaid Leave Days"; Integer)
        {
            Editable = false;
        }
        field(69029; "Total Statutory"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  Type = const(Deduction),
                                                                  Description = filter('PAYE' | 'NHIF' | 'NSSF'),
                                                                  "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(69030; "Send Payslip By E-mail?"; Boolean)
        {
        }
        field(69046; "House Allowance1"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(HouseAllowance)));
            FieldClass = FlowField;
        }
        field(69047; "Transport Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(TransportAllowance)));
            FieldClass = FlowField;
        }
        field(69048; "Basic Salary"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where(Type = const(Payment),
                                                                         "Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         "KRA Classification" = const(Basic),
                                                                         "Responsibility Center" = field("Responsibility Center")));
            FieldClass = FlowField;
        }
        field(69049; Classification; Code[20])
        {
            // TableRelation = Table0;
        }
        field(69050; "Leave Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(Leave)));
            FieldClass = FlowField;
        }
        field(69051; "Overtime Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(OT)));
            FieldClass = FlowField;
        }
        field(69052; "Directors Fees"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(DirectorsFees)));
            FieldClass = FlowField;
        }
        field(69053; "Lump Sum"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(LumpSum)));
            FieldClass = FlowField;
        }
        field(69054; "Other Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where("Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         Type = filter(Payment),
                                                                         "KRA Classification" = filter(Others)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69055; "Non Cash Benefit"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where(Type = const(Payment),
                                                                         "Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         "KRA Classification" = const(NonCashBenefit)));
            FieldClass = FlowField;
        }
        field(69056; MPR; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(MPR)));
            FieldClass = FlowField;
        }
        field(69057; "Insurance Relief"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X Temp-E".Amount where(Type = const(Payment),
                                                                         "Employee No" = field("No."),
                                                                         "Payroll Period" = field("Pay Period Filter"),
                                                                         "KRA Classification" = const(InsuranceRelief)));
            FieldClass = FlowField;
        }
        field(69058; "Days Worked per week"; Integer)
        {
            Editable = false;
        }
        field(69059; "Total Leave Days"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = filter('ANNUAL' | 'MATERNITY' | 'PATENITY' | 'STUDY' | 'TIMEOFF'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69060; "Annual Leave Days"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('ANNUAL'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69061; "Compassionate Leave Days"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('COMPASSIONATE'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69062; "Maternity Leave Days"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('MATERNITY'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69063; "Paternity Leave Days"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('PATERNITY'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69064; "Study Leave Days"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('STUDY'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69065; "Unpaid Leave"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('UNPAID'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69066; "Sick Leave"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('SICK'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69068; "Non-Fluctuating Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Taxable = const(true),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Non-Fluctuating" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69069; "Leave Status"; Option)
        {
            OptionCaption = ' ,On Leave,Resumed';
            OptionMembers = " ","On Leave",Resumed;
        }
        field(69070; "User ID"; Code[50])
        {
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = true;

            trigger OnLookup()
            begin
                // UserMgt.LookupUserID("User ID");
            end;

            trigger OnValidate()
            begin
                // UserMgt.ValidateUserID("User ID");
            end;
        }
        field(69071; "Leave Type Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HR Leave Types".Code;
        }
        field(69072; "Allocated Leave Days"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No.")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                CalcFields("Total Leave Taken");
                "Total (Leave Days)" := "Allocated Leave Days" + "Reimbursed Leave Days";
                //SUM UP LEAVE LEDGER ENTRIES
                "Leave Balance" := "Total (Leave Days)" + "Total Leave Taken";
                //TotalDaysVal := Rec."Total Leave Taken";
            end;
        }
        field(69073; "End of Contract Date"; Date)
        {
        }
        field(69074; "Leave Period Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HR Leave Periods 2"."Starting Date" where("New Fiscal Year" = const(false));
        }
        field(69075; "Annual Leave Account"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Leave Type" = const('ANNUAL'),
                                                                             "Staff No." = field("No."),
                                                                             "Leave Entry Type" = filter(<> Reimbursement)));
            FieldClass = FlowField;
        }
        field(69076; "Compassionate Leave Acc."; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Leave Type" = const('COMPASSIONATE'),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69077; "Maternity Leave Acc."; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Leave Type" = const('MATERNITY'),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69078; "Paternity Leave Acc."; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Leave Type" = const('PATERNITY'),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69079; "Sick Leave Acc."; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Leave Type" = const('SICK'),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69080; "Study Leave Acc"; Decimal)
        {
        }
        field(69081; "Total Leave Taken"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             "Leave Entry Type" = const(Negative),
                                                                             Closed = const(false),
                                                                             "Leave Type" = const('ANNUAL')));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
        }
        field(69082; "Total (Leave Days)"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(69083; "Cash - Leave Earned"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(69084; "Reimbursed Leave Days"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             "Leave Entry Type" = const(Reimbursement),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             Closed = const(false)));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                Validate("Allocated Leave Days");
            end;
        }
        field(69085; "Cash per Leave Day"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(69086; "Leave Balance"; Decimal)
        {
        }
        field(69087; "Leave Outstanding Bal"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             Closed = filter(false),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             "Leave Type" = const('ANNUAL')));
            FieldClass = FlowField;
        }
        field(69088; "Acrued Leave Days"; Decimal)
        {
        }
        field(69089; "On Leave"; Boolean)
        {
        }
        field(69090; "Total Gratuity Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Gratuity Amount" where("Employee No" = field("No."),
                                                                             "Payroll Period" = field("Pay Period Filter"),
                                                                             "Basic Salary Code" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69091; "Research Center"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Center" where("Research Center?" = const(true));
        }
        field(70000; "Overtime1.5"; Integer)
        {
            CalcFormula = lookup("Assignment Matrix-X"."Hours 1.5" where("Employee No" = field("No."),
                                                                          Code = const('E007'),
                                                                          "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(70001; "Overtime2.0"; Integer)
        {
            CalcFormula = lookup("Assignment Matrix-X"."Hours 2.0" where("Employee No" = field("No."),
                                                                          Code = const('E009'),
                                                                          "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(70003; Leave; Integer)
        {
            CalcFormula = lookup("Assignment Matrix-X"."Leave Days" where("Employee No" = field("No."),
                                                                           Closed = filter(false),
                                                                           Code = const('E008')));
            FieldClass = FlowField;
        }
        field(70004; LostDays; Integer)
        {
            CalcFormula = lookup("Assignment Matrix-X".Lostdays where("Employee No" = field("No."),
                                                                       Closed = filter(false),
                                                                       Code = const('E014')));
            FieldClass = FlowField;
        }
        field(70005; "Emp F L"; Text[20])
        {
        }
        field(70006; "Payroll Pay Mode"; Code[20])
        {
            TableRelation = "Payroll Pay Mode";
        }
        field(70007; "Pay Mode Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll Pay Mode";
        }
        field(70008; "Department Name"; Code[70])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70009; "Employement Terms"; Option)
        {
            OptionMembers = Contract,"Permenanent and Pensionable",Seconded;
        }
        field(70010; Position1; Code[20])
        {
        }
        field(70011; HOD; Boolean)
        {
        }
        field(70012; HR; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70013; "Medical Scheme Join Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"),
            //                                                "Direct Reports To"=field("Directorate Code"));
        }
        field(70015; "Claim Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70016; "Reason for termination"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70017; "Exit Interview Conducted"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Division/Section"),
            //    "Direct Reports To"=field("Department Code"));
        }
        field(70020; "Date Joined DC"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70021; "Date Joined DB"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70022; Supervisor; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = true;

            trigger OnLookup()
            begin
                // UserMgt.LookupUserID("User ID");
            end;

            trigger OnValidate()
            begin
                // UserMgt.ValidateUserID("User ID");
            end;
        }
        field(70023; "Job No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(70024; "Job Task No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No"));
        }
        field(70025; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70026; "Disability Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70027; "Disability No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70028; "Regional Manager"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70029; "Employee's Bank 2"; Code[80])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX";

            trigger OnValidate()
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(EmployeeBank.Code, "Employee's Bank 2");
                if EmployeeBank.FindSet() then begin
                    "Bank Name 2" := EmployeeBank."Bank Name";
                    "Bank Branch Name 2" := EmployeeBank."Branch Name";
                    "Bank Branch 2" := EmployeeBank."Bank Branch No.";
                end;
            end;
        }
        field(70030; "Bank Branch 2"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Employee's Bank"));

            trigger OnValidate()
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(EmployeeBank."Bank Branch No.", "Bank Branch 2");
                if EmployeeBank.FindSet() then begin
                    "Bank Branch Name 2" := EmployeeBank."Branch Name";
                end;
            end;
        }
        field(70031; "Bank Account No. 2"; Text[30])
        {
            Caption = 'Bank Account No.';
            DataClassification = ToBeClassified;
        }
        field(70032; "Bank Name 2"; Text[100])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Bank Name" where(Code = field("Employee's Bank"),
                                                                             "Bank Branch No." = field("Bank Branch")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70033; "Bank Branch Name 2"; Text[100])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Branch Name" where("Bank Branch No." = field("Bank Branch"),
                                                                               Code = field("Employee's Bank")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70034; "Primary Bank %"; Decimal)
        {
            DataClassification = ToBeClassified;
            InitValue = 100;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Bank 2 %" := 100 - "Primary Bank %";
            end;
        }
        field(70035; "Bank 2 %"; Decimal)
        {
            DataClassification = ToBeClassified;
            InitValue = 0;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Primary Bank %" := 100 - "Bank 2 %";
            end;
        }
        field(70036; "Retirement Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70037; "Disciplinary status"; Code[30])
        {
            // CalcFormula = max("HR Disciplinary Cases"."Disciplinary status" where ("Employee No"=field("No.")));
            FieldClass = Normal;
        }
        field(70038; "ResponsibilityCtr Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Responsibility Center";
        }
        field(70039; "Urban Area"; Code[20])
        {
            TableRelation = Towns where("Region Code"=field("Global Dimension 1 Code"));
            trigger OnValidate()
            var
            Town: Record Towns;
            begin

            end;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }
        key(Key3; Status, "Union Code")
        {
        }
        key(Key4; Status, "Emplymt. Contract Code")
        {
        }
        key(Key5; "Last Name", "First Name", "Middle Name")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "First Name", "Last Name", Initials, "Job Title")
        {
        }
        fieldgroup(Brick; "Last Name", "First Name", "Job Title", Image)
        {
        }
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

        DimMgt.DeleteDefaultDim(Database::"Temporary Employee", "No.");
    end;

    trigger OnInsert()
    begin
        "Last Modified Date Time" := CurrentDatetime;
        if "No." = '' then begin
            HumanResSetup.Get;
            HumanResSetup.TestField("Temporary Employee Nos");
            NoSeriesMgt.InitSeries(HumanResSetup."Temporary Employee Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        DimMgt.UpdateDefaultDim(
          Database::"Temporary Employee", "No.",
          "Global Dimension 1 Code", "Global Dimension 2 Code");
        UpdateSearchName;
    end;

    trigger OnModify()
    begin
        "Last Modified Date Time" := CurrentDatetime;
        "Last Date Modified" := Today;
        //IF Res.READPERMISSION THEN
        //EmployeeResUpdate.HumanResToRes(xRec,Rec);
        //IF SalespersonPurchaser.READPERMISSION THEN
        //EmployeeSalespersonUpdate.HumanResToSalesPerson(xRec,Rec);
        UpdateSearchName;
    end;

    trigger OnRename()
    begin
        DimMgt.RenameDefaultDim(Database::"Temporary Employee", xRec."No.", "No.");
        "Last Modified Date Time" := CurrentDatetime;
        "Last Date Modified" := Today;
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
        Earnings: Record "EarningsX Temp-E";
        AssMatrix: Record "Assignment Matrix-X Temp-E";
        Ded: Record "DeductionsX Temp-E";
        PayPeriod: Record "Payroll PeriodXT";
        ScaleBenefits: Record "Scale Benefits";
        PeriodStartDate: Date;
        Begindate: Date;
        Payroll: Record "Temporary Employee";
        OK: Boolean;
        "....added by daudi....": Integer;
        UserMgt: Codeunit "User Management";
        BlockedEmplForJnrlErr: label 'You cannot create this document because employee %1 is blocked due to privacy.', Comment = '%1 = employee no.';
        BlockedEmplForJnrlPostingErr: label 'You cannot post this document because employee %1 is blocked due to privacy.', Comment = '%1 = employee no.';
        EmployeeLinkedToResourceErr: label 'You cannot link multiple employees to the same resource. Employee %1 is already linked to that resource.', Comment = '%1 = employee no.';
        GTermination: Record "Grounds for Termination";
        EthnicBackground: Record "Ethnic Background";
        EmployeeBank: Record "Employee Bank AccountX";

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
        OnBeforeGetFullName(Rec, NewFullName, Handled);
        if Handled then
            exit(NewFullName);

        if "Middle Name" = '' then
            exit("First Name" + ' ' + "Last Name");

        exit("First Name" + ' ' + "Middle Name" + ' ' + "Last Name");
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Temporary Employee", "No.", FieldNumber, ShortcutDimCode);
        Modify;
    end;

    procedure DisplayMap()
    var
        MapPoint: Record "Online Map Setup";
        MapMgt: Codeunit "Online Map Management";
    begin
        if MapPoint.FindFirst then
            MapMgt.MakeSelection(Database::"Temporary Employee", GetPosition)
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
        if not ResourceRec.Get("No.") then begin
            ResourceRec."No." := "No.";
            ResourceRec.Name := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            ResourceRec."Job Title" := "Job Title";
            ResourceRec.Type := ResourceRec.Type::Person;
            /*IF NOT ResourceGroup.GET("Salary Scale") THEN
              ERROR(Text000,"Salary Scale");*/
            ResourceRec."Resource Group No." := "Salary Scale";
            ResourceRec.Insert;
            exit(true)
        end else
            exit(false);

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
        PrevSearchName := xRec.FullName + ' ' + xRec.Initials;
        if ((("First Name" <> xRec."First Name") or ("Middle Name" <> xRec."Middle Name") or ("Last Name" <> xRec."Last Name") or
             (Initials <> xRec.Initials)) and ("Search Name" = PrevSearchName))
        then
            "Search Name" := SetSearchNameToFullnameAndInitials;
    end;

    local procedure SetSearchNameToFullnameAndInitials(): Code[250]
    begin
        exit(FullName + ' ' + Initials);
    end;

    procedure GetBankAccountNo(): Text
    begin
        if Iban <> '' then
            exit(DelChr(Iban, '=<>'));

        if "Bank Account No." <> '' then
            exit("Bank Account No.");
    end;

    procedure CheckBlockedEmployeeOnJnls(IsPosting: Boolean)
    begin
        if "Privacy Blocked" then begin
            if IsPosting then
                Error(BlockedEmplForJnrlPostingErr, "No.");
            Error(BlockedEmplForJnrlErr, "No.")
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetFullName(Employee: Record "Temporary Employee"; var NewFullName: Text[100]; var Handled: Boolean)
    begin
    end;

    local procedure CheckIfAnEmployeeIsLinkedToTheResource(ResourceNo: Code[20])
    var
        Employee: Record "Temporary Employee";
    begin
        Employee.SetFilter("No.", '<>%1', "No.");
        Employee.SetRange("Resource No.", ResourceNo);
        if Employee.FindFirst then
            Error(EmployeeLinkedToResourceErr, Employee."No.");
    end;

    Local Procedure ValidateIDNumber(EmpNo: Code[20]; ID: Text[30])
    var
        TempEmp: Record "Temporary Employee";
    begin
        TempEmp.Reset();
        TempEmp.SetRange("ID Number", ID);
        TempEmp.SetFilter("No.", '<>%1', EmpNo);
        if TempEmp.FindFirst() then
            error('An employee with the same Id No %1 already exists',ID);
    end;
}

