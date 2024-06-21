#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57025 "Inter Bank Transfer Line"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,InterBank Requisition Voucher,AIE Funds Transfer';
            OptionMembers = " ","InterBank Requisition Voucher","AIE Funds Transfer";
        }
        field(4;"Bank Account No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                if BankAccount.Get("Bank Account No") then
                  "Bank Account Name":=BankAccount.Name;


                //Start Autopopulate the Receivables Account
                ObjBankAccount.Reset;
                ObjBankAccount.SetRange(ObjBankAccount."No.","Bank Account No");
                if ObjBankAccount.FindSet then
                  "Receivable Account(Region)":=ObjBankAccount."AIE Receivables Account";
                 //End Autopopulate the Receivables Account
            end;
        }
        field(5;Amount;Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ObjInterBank.Reset;
                ObjInterBank.SetRange("Document No",Rec."Document No");
                ObjInterBank.SetRange("Document Type",Rec."Document Type");
                if ObjInterBank.FindSet then begin
                   if ObjInterBank."Currency Code"='' then begin
                     "Amount(LCY)":=Amount;
                     end;
                  end;
            end;
        }
        field(6;"Payment Reference";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Amount(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Bank Account Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Shortcut Dimension 1 Code";Code[20])
        {
            Caption = 'Region Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1),
                                                          Blocked=const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");

                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Shortcut Dimension 1 Code");
                if ResponsibilityCenter.FindSet then
                  "Region Name":=ResponsibilityCenter.Name;
            end;
        }
        field(11;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2),
                                                          Blocked=const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(12;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Responsibility Center";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(14;Selected;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Receivable Account(Region)";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(16;"Funding Source";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2),
                                                          Blocked=const(false));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(17;"Department Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(5),
                                                          Blocked=const(false));
        }
        field(18;"Acknowledged By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Acknowledgement Datetime";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(20;Acknowledged;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21;Suggested;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Shortcut Dimension 3 Code";Code[20])
        {
            Caption = 'Constituency Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=filter(3),
                                                          Blocked=filter(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(23;"Activity Description";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Region Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Project ID";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(6),
                                                          Blocked=const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6,"Project ID");
            end;
        }
    }

    keys
    {
        key(Key1;"Line No","Document No","Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        // UserSetup.TESTFIELD(UserSetup."Purchase Resp. Ctr. Filter");
        // "Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
        // IF Emp.GET(UserSetup."Employee No.") THEN BEGIN
        //  "Shortcut Dimension 1 Code":=Emp."Global Dimension 1 Code";
        //  //VALIDATE("Region Code");
        //  "Shortcut Dimension 2 Code":=Emp."Global Dimension 2 Code";
        //  //VALIDATE("Constituency Code");
        //  END;
        // END;
        
        //Insert RC
        /*ObjInterBank.RESET;
        ObjInterBank.SETRANGE(ObjInterBank."Document No","Document No");
        IF ObjInterBank.FINDSET THEN BEGIN
          "Responsibility Center":=ObjInterBank."Responsibility Center";
          IF "Document Type" = "Document Type"::"AIE Funds Transfer" THEN BEGIN
          "Shortcut Dimension 1 Code":=ObjInterBank."Region Code";
            VALIDATE("Shortcut Dimension 1 Code");
            "Shortcut Dimension 2 Code":=ObjInterBank."Constituency Code";*///////
            //VALIDATE("Shortcut Dimension 2 Code");
            UserSetup.Reset;
            UserSetup.SetRange("User ID",UserId);
            if UserSetup.FindSet then begin
              Emp.Reset;
              Emp.SetRange(Emp."No.",UserSetup."Employee No.");
              "Department Code":=Emp.Department;
              //MESSAGE("Department Code");
              if Emp.FindSet then begin
                end;
              end;
            //END;
          //END;
        
        //Autopopulate the FSC
        ObjInterBank.Reset;
        ObjInterBank.SetRange(ObjInterBank."Document No","Document No");
        if ObjInterBank.FindSet then begin
        //"Funding Source":=ObjInterBank."Funding Source Code";
        end;

    end;

    var
        ObjInterBank: Record "Inter Bank Transfer";
        BankAccount: Record "Bank Account";
        UserSetup: Record "User Setup";
        Emp: Record Employee;
        BankListAll: Page "Bank List All";
        ObjBankAccount: Record "Bank Account";
        DimMgt: Codeunit DimensionManagement;
        ResponsibilityCenter: Record "Responsibility Center";

    procedure ValidateShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
        //VerifyItemLineDim;
    end;

    procedure LookupShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    begin
        DimMgt.LookupDimValueCode(FieldNumber,ShortcutDimCode);
        ValidateShortcutDimCode(FieldNumber,ShortcutDimCode);
    end;

    procedure ShowShortcutDimCode(var ShortcutDimCode: array [8] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID",ShortcutDimCode);
    end;

    procedure ShowDimensions() IsChanged: Boolean
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID",StrSubstNo('%1 %2 %3',"Document Type","Document No","Line No"));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        IsChanged := OldDimSetID <> "Dimension Set ID";
    end;
}

