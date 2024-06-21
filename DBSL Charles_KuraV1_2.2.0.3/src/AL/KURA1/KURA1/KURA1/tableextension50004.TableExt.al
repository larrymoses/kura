#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50004 "tableextension50004" extends Customer
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""No."(Field 1)".

        field(50000; "Account Type"; Option)
        {
            OptionMembers = " ","Travel Advance",Partner,"Staff Advance",Others;

            trigger OnValidate()
            begin
                //Prevent Changing once entries exist
                //TestNoEntriesExist(FIELDCAPTION("Account Type"));
            end;
        }
        field(50001; "Staff No."; Code[20])
        {

            trigger OnValidate()
            begin
                /*  EmployeeRec.RESET;
                  EmployeeRec.GET("Staff No.");
                  "Job Title":= EmployeeRec."Job Title";
                  "Job Description":= EmployeeRec."Job Specification";
                  "Job Group":= EmployeeRec.Grade;
                  "Position code":= EmployeeRec."Position Code";
                  "Position Name":= EmployeeRec."Position Name";
                  */

            end;
        }
        field(50002; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Global Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50003; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Global Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                ////ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50004; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Global Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50005; "Job Title"; Code[20])
        {
        }
        field(50006; "Job Group"; Text[50])
        {
        }
        field(50007; "Job Description"; Text[50])
        {
        }
        field(50008; "Job Group Name"; Text[50])
        {
        }
        field(50009; "Position code"; Code[20])
        {
        }
        field(50010; "Position Name"; Text[30])
        {
        }
        field(50011; "Imprest Balance Amount"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" where("Customer No." = field("No."),
                                                                                 "Currency Code" = field("Currency Filter"),
                                                                                 "Document Type" = filter(Invoice)));
            FieldClass = FlowField;
        }
        field(50021; "Bank Account Number"; Code[100])
        {
        }
        field(50022; "Bank Branch"; Code[100])
        {
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Employee's Bank"));
        }
        field(50065; fred; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50088; "PIN No"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50089; "Withholding Tax No"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50090; "Default VAT Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
            //  TableRelation = Table1000050122;
        }
        field(50091; "Default Withholding Tax Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
            //TableRelation = Table1000050122;
        }
        field(50092; "Agent Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50093; "Debtor Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
            OptionMembers = " ",Normal,"Staff Advance","Car loan","Staff Medical","Car Running","Sundry Debtors",TLA,"Money Market",Property,Equity,Mortgage;
        }
        field(50094; "Institution Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
            TableRelation = Institutions;

            trigger OnValidate()
            begin
                Inst.Reset;
                Inst.SetRange(Inst.Code, "Institution Code");
                if Inst.Find('-') then begin
                    "Institution Name" := Inst.Description;
                end;
            end;
        }
        field(50095; "Institution Name"; Code[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50096; "LR No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50097; "Property Particulars"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
            OptionMembers = "Lease Hold","Free Hold";
        }
        field(50098; Location; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50099; "Date Of Acquistion"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50100; "Leasehold Period"; DateFormula)
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50101; "Real Estate Manager Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50102; "Real Estate Manager Telephone"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50103; "Name Of Beneficiary"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50104; "Beneficiary Telephone"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50105; "Beneficiary Address 1"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50106; "Beneficiary Address 2"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50107; "Mortgage Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
            OptionMembers = Commercial,Staff;
        }
        field(50108; "Mortgage Term"; DateFormula)
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50109; "Expected Repayment"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(50110; Stock; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Investment Module';
        }
        field(56000; Type; Option)
        {
            Description = 'Person/Company';
            OptionCaption = 'Person,Company';
            OptionMembers = Person,Company;
        }
        field(56001; "Customer Category"; Code[20])
        {
            Caption = 'Applicant Category';
            Description = 'Customer/Author/Publisher/Licensee';
            TableRelation = "Applicant category setup";
        }
        field(56002; "Customer Type"; Option)
        {
            Caption = 'Applicant Type';
            Description = 'Customer/Applicant';
            OptionCaption = ' ,Trade,Student,Funder,Sponsor,Normal,Annuity,Insitution,Property,IDD';
            OptionMembers = " ",Trade,Student,Funder,Sponsor,Normal,Annuity,Insitution,Property,"IDD-";
        }
        field(56003; "Company Reg No"; Code[20])
        {
        }
        field(56004; "ID. No."; Code[20])
        {
        }
        field(56005; "P.I.N"; Code[11])
        {

            trigger OnValidate()
            begin
                /*
                IF "P.I.N"<>'' THEN BEGIN
                StrPIN:=COPYSTR("P.I.N",1,11);
                
                IF STRLEN("P.I.N")<>11 THEN BEGIN
                ERROR('Invalid PIN number. Please enter the correct PIN number.');
                END;
                END;
                
                mystr:="P.I.N";
                  i := 1;
                  WHILE (mystr[i] IN ['0'..'9']) AND (i<= STRLEN(mystr)) DO
                    i := i+1;
                
                   j := 1;
                  WHILE (mystr[j] IN ['0'..'9']) AND (j<= STRLEN(mystr)) DO
                    j := j+1;
                
                
                      IF (i<>1) AND (i<>11) THEN
                  ERROR('P.I.N Must Start & End with character');
                      {IF j<>11 THEN
                  ERROR('P.I.N Must Start & End with character');}
                  */

            end;
        }
        field(56006; Title; Code[20])
        {
            TableRelation = Salutation.Code;
        }
        field(56007; Status; Option)
        {
            OptionCaption = 'Open,Pending,Approved';
            OptionMembers = Open,Pending,Approved;
        }
        field(69010; "Employee's Bank"; Code[100])
        {
            TableRelation = "Employee Bank AccountX";
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
        field(69018; Imprests; Integer)
        {
            CalcFormula = count(payments where("Document Type" = const(Imprest),
                                                "Account No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69019; Surrenders; Integer)
        {
        }
        field(69020; "First Name"; Text[50])
        {
        }
        field(69021; "Middle Name"; Text[50])
        {
        }
        field(69022; "Last Name"; Text[50])
        {
        }
        field(69023; "Physical Location"; Text[250])
        {
        }
        field(69024; "Funding Class"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Trade,Grant,Student,Others';
            OptionMembers = Trade,Grant,Student,Others;
        }
        field(69025; "No. of Funding Sources"; Integer)
        {
            CalcFormula = count("Funding Source" where("Funding Agency" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69026; "No. of Projects"; Integer)
        {
            FieldClass = Normal;
        }
        field(69027; "Advance Payment Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "No." = '' THEN BEGIN
      SalesSetup.GET;
      SalesSetup.TESTFIELD("Customer Nos.");
      NoSeriesMgt.InitSeries(SalesSetup."Customer Nos.",xRec."No. Series",0D,"No.","No. Series");
    END;

    IF "Invoice Disc. Code" = '' THEN
      "Invoice Disc. Code" := "No.";
    #9..18

    UpdateReferencedIds;
    SetLastModifiedDateTime;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF ("Funding Class"= "Funding Class"::Trade) THEN BEGIN
    #1..5
    END ELSE IF ("Funding Class"= "Funding Class"::Grant) THEN BEGIN
    IF "No." = '' THEN BEGIN
      GrantsSetup.GET;
      GrantsSetup.TESTFIELD("Grantor Nos");
      NoSeriesMgt.InitSeries(GrantsSetup."Grantor Nos",xRec."No. Series",0D,"No.","No. Series");
    END;
    END ELSE IF  ("Funding Class"= "Funding Class"::Student) THEN BEGIN
    IF "No." = '' THEN BEGIN
     { Investment.GET;
      Investment.TESTFIELD("Investment Nos");
      NoSeriesMgt.InitSeries(Investment."Investment Nos",xRec."No. Series",0D,"No.","No. Series");}
    END;
    END;

    IF "Customer Type" = "Customer Type"::Insitution THEN BEGIN
      Investment.GET;
      Investment.TESTFIELD("Investment Nos");
      NoSeriesMgt.InitSeries(Investment."Investment Nos",xRec."No. Series",0D,"No.","No. Series")
    END;
    #6..21
    */
    //end;

    var
        GrantsSetup: Record "Grants Setup";
        Inst: Record Institutions;
        Investment: Record "Investment Setup";
}

