/// <summary>
/// Table Hr Welfare Header (ID 50208).
/// </summary>
table 50208 "Hr Welfare Header"
{
    Caption = 'Hr Welfare Header';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Welfare No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Welfare Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Application,Contribution,Benefit;
        }
        field(3;"Raised By";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.RESET;
                Employee.SETRANGE("No.","Raised By");
                IF Employee.FINDSET THEN BEGIN
                  "Raisee Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                  "Global Dimension 1 Code":=Employee."Global Dimension 1 Code";
                  "Global Dimension 2 Code":=Employee."Global Dimension 2 Code";
                END
            end;
        }
        field(4;"Raisee Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Welfare Category";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = Open,"Pending Approval",Released,Closed;
        }
        field(10;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));
        }
        field(11;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));
        }
        field(12;"Global Dimension 1";Code[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE (Code=FIELD("Global Dimension 1 Code")));
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            FieldClass = FlowField;
        }
        field(13;"Global Dimension 2";Code[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE (Code=FIELD("Global Dimension 2 Code")));
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            FieldClass = FlowField;
        }
        field(14;"No Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Total Amount";Decimal)
        {
            CalcFormula = Sum("Welfare Lines".Amount WHERE ("Welfare Header No."=FIELD("Welfare No.")));
            FieldClass = FlowField;
        }
        field(16;"Benefit Allocation";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17;"Welfare Code";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Benefits Matrix Setup"."Line No.";

            trigger OnValidate()
            begin
                BenefitsMatrixSetup.RESET;
                BenefitsMatrixSetup.SETRANGE("Line No.","Welfare Code");
                IF BenefitsMatrixSetup.FINDFIRST THEN BEGIN
                  "Welfare Description":=BenefitsMatrixSetup."Benefit Description";
                 "Welfare Category":=FORMAT(BenefitsMatrixSetup."Beneficiary Category");
                  "Benefit Allocation":=BenefitsMatrixSetup.Amount;
                END
            end;
        }
        field(18;"Welfare Description";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Welfare No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //GENERATE DOCUMENT NUMBER
        IF "Welfare Type"="Welfare Type"::Benefit THEN BEGIN
        IF "Welfare No." = '' THEN BEGIN
          HRSetup.GET;
          HRSetup.TESTFIELD(HRSetup."Legal Case Nos");
          NoSeriesMgt.InitSeries(HRSetup."Legal Case Nos",xRec."No Series",0D,"Welfare No.","No Series");
        END;END;
        IF "Welfare Type"="Welfare Type"::Application THEN BEGIN
        IF "Welfare No." = '' THEN BEGIN
          HRSetup.GET;
          HRSetup.TESTFIELD(HRSetup."Legal Case Nos");
          NoSeriesMgt.InitSeries(HRSetup."Legal Case Nos",xRec."No Series",0D,"Welfare No.","No Series");
        END;
        END;
        IF "Welfare Type"="Welfare Type"::Contribution THEN BEGIN
        IF "Welfare No." = '' THEN BEGIN
          HRSetup.GET;
          HRSetup.TESTFIELD(HRSetup."Legal Case Nos");
          NoSeriesMgt.InitSeries(HRSetup."Legal Case Nos",xRec."No Series",0D,"Welfare No.","No Series");
        END;
        END;
        /*ELSE BEGIN
          IF "Welfare Category"="Welfare Category"::"1" THEN BEGIN
            IF "Welfare No." = '' THEN BEGIN
          HRSetup.GET;
          HRSetup.TESTFIELD(HRSetup."Matanga Nos.");
          NoSeriesMgt.InitSeries(HRSetup."Matanga Nos.",xRec."No Series",0D,"Welfare No.","No Series");
        END;
          END  ELSE IF
            "Welfare Category"="Welfare Category"::"2" THEN BEGIN
              IF "Welfare No." = '' THEN BEGIN
          HRSetup.GET;
          HRSetup.TESTFIELD(HRSetup."Wedding Nos.");
          NoSeriesMgt.InitSeries(HRSetup."Wedding Nos.",xRec."No Series",0D,"Welfare No.","No Series");
        END;
            END;
              END;*/
        "Created By":=USERID;
        "Created On":=CURRENTDATETIME;

    end;

    var
        Employee: Record 5200;
        HRSetup: Record 5218;
        NoSeriesMgt: Codeunit 396;
        BenefitsMatrixSetup: Record "Benefits Matrix Setup";
}

