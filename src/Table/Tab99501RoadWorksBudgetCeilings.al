/// <summary>
/// Table Road Works Budget Ceilings (ID 99462).
/// </summary>
table 99501 "Road Works Budget Ceilings"
{
    DrillDownPageID = 72041;
    LookupPageID = 72041;

    fields
    {
        field(1;"Document No";Code[20])
        {
            
            Editable = false;
            TableRelation = "Road Work Program".Code;
        }
        field(2;"Document Date";Date)
        {
            
            Editable = false;
        }
        field(3;"Doc Reference No";Code[40])
        {
            
        }
        field(4;"Global Dimension 2 Code";Code[30])
        {
            
            CaptionClass = '1,2,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
            trigger OnValidate()
            begin
                DimensionValue.RESET;
                DimensionValue.SETRANGE(DimensionValue.Code,"Global Dimension 2 Code");
                IF DimensionValue.FINDSET THEN BEGIN
                  "Global Dimension 2 Name":=DimensionValue.Name;
                  END;
            end;
        }
        field(5;"Global Dimension 2 Name";Text[100])
        {
            
            Editable = false;
        }
        field(6;"Financier Code";Code[20])
        {
            TableRelation = Customer."No." WHERE ("Customer Posting Group"=FIELD("Financier Posting Group Filter"));

            trigger OnValidate()
            begin
                Customer.RESET;
                Customer.SETRANGE(Customer."No.","Financier Code");
                IF Customer.FindFirst() THEN BEGIN
                  "Financier Name":=Customer.Name;
                  END;
            end;
        }
        field(7;"Financier Name";Text[300])
        {
            
            Editable = false;
        }
        field(8;"Funding Source Type";Option)
        {
            
            OptionCaption = ' ,Regular,Savings';
            OptionMembers = " ",Regular,Savings;
        }
        field(9;"Applicable To";Option)
        {
            
            OptionCaption = ' ,All Regions,Specific Regions';
            OptionMembers = " ","All Regions","Specific Regions";
        }
        field(10;"Financial Year Code";Code[30])
        {
            
            TableRelation = "G/L Budget Name".Name;

            trigger OnValidate()
            begin
                FinancialYearCode.RESET;
                FinancialYearCode.SETRANGE(Name,"Financial Year Code");
                IF FinancialYearCode.FindFirst() THEN BEGIN
                  "Start Date":=FinancialYearCode."Start Date";
                  "End Date":=FinancialYearCode."End Date";
                END;
            end;
        }
        field(11;"Start Date";Date)
        {
            
            Editable = false;
        }
        field(12;"End Date";Date)
        {
            
            Editable = false;
        }
        field(13;"AIE No";Code[30])
        {
            
            TableRelation = "Inter Bank Transfer Line"."Document No" WHERE ("Shortcut Dimension 1 Code"=FIELD("Region Code"),
                                                                            "Shortcut Dimension 2 Code"=FIELD("Global Dimension 2 Code"),
                                                                            Selected=CONST(true));

            trigger OnValidate()
            begin
                InterBankTransferLine.RESET;
                InterBankTransferLine.SETRANGE(InterBankTransferLine."Document No","AIE No");
                IF InterBankTransferLine.FINDSET THEN BEGIN
                  "Budget Ceiling Amount":=InterBankTransferLine.Amount;
                  END;
            end;
        }
        field(14;"Budget Ceiling Amount";Decimal)
        {
            
        }
        field(15;"Allocated Amount";Decimal)
        {
            CalcFormula = Sum("RoadWorks Ceiling DetailedLine"."Town Allocation(KES)" WHERE ("Document No"=FIELD("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16;"Created By";Code[50])
        {
            
            Editable = false;
        }
        field(17;"Created Date/Time";DateTime)
        {
            
            Editable = false;
        }
        field(18;Status;Option)
        {
            
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Approved;
        }
        field(19;Posted;Boolean)
        {
            
            Editable = false;
        }
        field(20;"Linked to AIE";Boolean)
        {
            
        }
        field(21;"No. Series";Code[50])
        {
            
        }
        field(22;"Includes HQ";Boolean)
        {
            
        }
        field(23;"Constituency Allocation Method";Option)
        {
            
            OptionCaption = 'Equal,Varied';
            OptionMembers = Equal,Varied;
        }
        field(24;"Region Code";Code[20])
        {
            
        }
        field(25;"Employee No";Code[20])
        {
            
        }
        field(26;"Employee Name";Text[300])
        {
            
        }
        field(27;"Assign To";Code[100])
        {
            
            TableRelation = "User Setup"."User ID";
        }
        field(28;"Assignment Remarks";Text[1500])
        {
            
        }
        field(29;"AIE Line No";Integer)
        {
            
        }
        field(30; "Financier Posting Group Filter"; Code[20])
        {
            FieldClass =FlowField;
            CalcFormula = lookup("Road Management Setup"."Financier's Posting Group" where("Primary Key"=const('')));
        }
    }

    keys
    {
        key(Key1;"Document No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
         IF "Document No"='' THEN BEGIN
           RoadManagementSetup.GET;
           RoadManagementSetup.TESTFIELD("Roadworks Budget Ceiling Nos");
           NoSeriesManagement.InitSeries(RoadManagementSetup."Roadworks Budget Ceiling Nos",xRec."No. Series",TODAY,"Document No","No. Series");
         END;

        "Created By":=USERID;
        "Created Date/Time":=CURRENTDATETIME;
        "Document Date":=TODAY;

        UserSetup.RESET;
        UserSetup.SETRANGE(UserSetup."User ID","Created By");
        IF UserSetup.FINDSET THEN BEGIN
          "Employee No":=UserSetup."Employee No.";
          "Employee Name":=UserSetup."Employee Name";
          "Region Code":=UserSetup."Region Code";
          END;
    end;

    trigger OnModify()
    begin
        IF USERID<>"Created By" THEN
          ERROR('You are not allowed to edit this document.Please consult the document creator %1',"Created By");
    end;

    var
        RoadProgam: Record "Road Work Program";
        DimensionValue: Record "Dimension Value";
        Customer: Record Customer;
        InterBankTransfer: Record "Inter Bank Transfer";
        InterBankTransferLine: Record "Inter Bank Transfer Line";
        RoadManagementSetup: Record "Road Management Setup";
        NoSeries: Record "No. Series";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        FinancialYearCode: Record "G/L Budget Name";
        Employee: Record Employee;
        UserSetup: Record "User Setup";
        RMSManagement: Codeunit "RMS Management";
}

