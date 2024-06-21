#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69610 "Employment Ledger Entry"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(3;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Original Employment,Staff Promotion,Staff Transfer,Staff Exit';
            OptionMembers = "Original Employment","Staff Promotion","Staff Transfer","Staff Exit";
        }
        field(5;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Employment Contract";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }
        field(9;"Position ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(10;"Duty Station";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Duty Station";
        }
        field(11;"Job Grade";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales";
        }
        field(12;"Employee Posting Group";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(15;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(16;"Dimension Set ID";Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
    }

    keys
    {
        key(Key1;"Entry No","Employee No.","Posting Date","Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DimMgt: Codeunit DimensionManagement;

    procedure ValidateShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber,ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Employment Ledger Entry",Format("Entry No"),FieldNumber,ShortcutDimCode);
        Modify;
    end;

    procedure ShowDimensions()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.ShowDimensionSet("Dimension Set ID",StrSubstNo('%1 %2',TableCaption,"Entry No"));
    end;
}

