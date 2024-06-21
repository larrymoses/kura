#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50008 "tableextension50008" extends Item
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 3)".


        //Unsupported feature: Property Modification (Data type) on ""Search Description"(Field 4)".


        //Unsupported feature: Property Modification (Data type) on ""Base Unit of Measure"(Field 8)".


        //Unsupported feature: Property Modification (Data type) on ""Inventory Posting Group"(Field 11)".


        //Unsupported feature: Property Insertion (NotBlank) on ""Global Dimension 1 Code"(Field 105)".


        //Unsupported feature: Code Modification on ""Base Unit of Measure"(Field 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        UpdateUnitOfMeasureId;

        IF "Base Unit of Measure" <> xRec."Base Unit of Measure" THEN BEGIN
          TestNoOpenEntriesExist(FIELDCAPTION("Base Unit of Measure"));

        #6..29
            END;
          END;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #3..32
        */
        //end;
        field(70051; "Description 3"; text[2000])
        {
            
            Caption = 'Long Description';
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
        field(50101; "Item G/L Budget Account"; Code[20])
        {
            TableRelation = "G/L Account";

            trigger OnValidate()
            begin
                // Control to prevent Modification once Entry Exist
                // TestNoEntriesExist(FIELDCAPTION("Item G/L Budget Account"));
            end;
        }
        field(57001; "Vote Item"; Code[20])
        {
            CalcFormula = lookup("General Posting Setup"."Purch. Account" where("Gen. Prod. Posting Group" = field("Gen. Prod. Posting Group")));
            FieldClass = FlowField;
            TableRelation = "G/L Account";
        }
        field(57002; "IEC Materials"; Boolean)
        {
        }
        field(70000; "Bill Item Group Code"; Code[30])
        {
            
        }
        field(70001; Quantity; Decimal)
        {
            
        }
        field(70002; "Amount Excl. VAT"; Decimal)
        {
            
        }
        field(70003; "Product Group"; Option)
        {
            
            Description = 'New field used to categorize the Items further into Goods, Works, Services and Assets. NB: In most organizations, the Works, Services and Assets shall be setup under TYPE:SERVICE';
            OptionCaption = 'Goods,Services,Works,Assets';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(70004; "Works Technology"; Code[20])
        {
            
            TableRelation = "Road Technology".Code;
        }
        field(70005; "Location Code"; Code[20])
        {
            CalcFormula = lookup("Item Ledger Entry"."Location Code" where("Item No." = field("No."),
                                                                            "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                            "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                            "Location Code" = field("Location Filter"),
                                                                            "Drop Shipment" = field("Drop Shipment Filter"),
                                                                            "Variant Code" = field("Variant Filter"),
                                                                            "Lot No." = field("Lot No. Filter"),
                                                                            "Serial No." = field("Serial No. Filter")));
            Caption = 'Location Code';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70006; "BOQ Type"; Option)
        {
            
            OptionCaption = ' ,New Construction,PBRM,Reconstruction&Rehab';
            OptionMembers = " ","New Construction",PBRM,"Reconstruction&Rehab";
        }
        field(70007; "BoQ No"; Code[20])
        {
            
        }
        field(70008; "Vendor Name"; Text[100])
        {
            Caption = 'Preffered Vendor';
            FieldClass = FlowField;
            CalcFormula = lookup("Vendor"."Name" where("No." = field("Vendor No.")));
        }
        field(70050; "Procurement Category"; Code[50])
        {
            
            TableRelation = "Procurement Category".Code;
        }
        field(70052; "Reorder Notification Sent"; Boolean)
        {
            
        }
    }
}

