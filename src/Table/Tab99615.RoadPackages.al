table 99615 "Road Packages"
{
    Caption = 'Road Packages';
    LookupPageId="Road Packages";
    DrillDownPageId ="Road Packages";
    fields
    {
        field(1; Package; Code[20])
        {
            Caption = 'Package';
        }
        field(2; Description; Text[400])
        {
            
        }
        field(3; "Works Type"; Code[50])
        {
            TableRelation ="Works Category";
        }
        field(4; "Global Dimension 1 Code"; Code[20])
        {
                   CaptionClass = '1,1,1';
                    Caption = 'Global Dimension 1 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(5; "Global Dimension 2 Code"; Code[20])
        {

              CaptionClass = '1,1,2';
                    Caption = 'Global Dimension 2 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(6; "Shortcut Dimension 3 Code"; Code[20])
        {
              CaptionClass = '1,2,3';
                    Caption = 'Shortcut Dimension 3 Code';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(7; "Shortcut Dimension 4 Code"; Code[20])
        {
            
        }
        field(8; "Shortcut Dimension 5 Code"; Code[20])
        {
                 //CaptionClass = '1,2,3';
                    Caption = 'Town';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5)); 
        }
              field(480;"Dimension Set ID";Integer)
        {
            Caption = 'Dimension Set ID';
           
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Global Dimension 1 Code","Global Dimension 2 Code");
            end;
        }
    }
    keys
    {
        key(PK; Package)
        {
            Clustered = true;
        }
    }
    var
    DimMgt: Codeunit DimensionManagement;

    [Scope('Personalization')]
    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID",STRSUBSTNO('%1 ',Package),
            "Global Dimension 1 Code","Global Dimension 2 Code");
        
        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;
}
