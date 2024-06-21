tableextension 50077 StandardSalesLineExt extends "Standard Sales Line"
{
    fields
    {
        field(50000; "Method of Disposal"; Option)
        {
            Caption = 'Method of Disposal';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Transfer to Public Entity,Sale by Public Tender,Sale by Public Auction,Trade-in,Waste Disposal Management';
            OptionMembers = "Transfer to Public Entity","Sale by Public Tender","Sale by Public Auction","Trade-in","Waste Disposal Management";
        }
        field(50001; "Sell To Customer No"; Code[100])
        {
            Caption = 'Sell To Customer No';
            DataClassification = ToBeClassified;
        }
        field(50002; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
        }
        field(50003; "Actual Unit Cost(LCY)"; Decimal)
        {
            Caption = 'Actual Unit Cost';
            DataClassification = ToBeClassified;
        }
        field(50004; "Actual Total Cost(LCY)"; Decimal)
        {
            Caption = 'Actual Total Cost(LCY)(LCY)';
            DataClassification = ToBeClassified;
        }
        field(50005; "Trade-In Asset No"; Code[100])
        {
            Caption = 'Trade-In Asset No';
            DataClassification = ToBeClassified;
        }
        field(50007; "Trade-In Asset Description"; Text[100])
        {
            Caption = 'Trade-In Asset Description';
            DataClassification = ToBeClassified;
        }
        field(50006; "Disposal Type"; Code[100])
        {
            Caption = 'Disposal Type';
            DataClassification = ToBeClassified;
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
    }
}
