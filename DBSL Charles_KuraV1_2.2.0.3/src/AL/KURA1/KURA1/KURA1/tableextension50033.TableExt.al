#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50033 "tableextension50033" extends "Standard Purchase Line"
{



    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""Standard Purchase Code"(Field 1)".


        //Unsupported feature: Property Modification (Editable) on ""Line No."(Field 2)".


        //Unsupported feature: Property Modification (Data type) on "Description(Field 5)".


        //Unsupported feature: Code Modification on ""No."(Field 4).OnValidate".

        //trigger "(Field 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Quantity := 0;
        "Amount Excl. VAT" := 0;
        "Unit of Measure Code" := '';
        Description := '';
        #5..44
              Description := ItemCharge.Description;
            END;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {Quantity := 0;
        #2..47
        }
        */
        //end;

        field(12; "Item Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code;
        }
        field(74; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Business Posting Group";
        }
        field(75; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group";
        }
        field(87; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            DataClassification = ToBeClassified;
            TableRelation = "Tax Group";
        }
        field(89; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "VAT Business Posting Group";
        }
        field(90; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "VAT Product Posting Group";
        }
        field(91; "Posting Group"; Code[20])
        {
            Caption = 'Posting Group';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = if (Type = const(Item)) "Inventory Posting Group"
            else
            if (Type = const("Fixed Asset")) "FA Posting Group";
        }
        field(5600; "FA Posting Date"; Date)
        {
            Caption = 'FA Posting Date';
            DataClassification = ToBeClassified;
        }
        field(5601; "FA Posting Type"; Option)
        {
            AccessByPermission = TableData "Fixed Asset" = R;
            Caption = 'FA Posting Type';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Acquisition Cost,Maintenance,,Appreciation';
            OptionMembers = " ","Acquisition Cost",Maintenance,,Appreciation;

            trigger OnValidate()
            begin
                if Type = Type::"Fixed Asset" then begin
                    //  TESTFIELD("Job No.",'');
                    if "FA Posting Type" = "fa posting type"::" " then
                        "FA Posting Type" := "fa posting type"::"Acquisition Cost";
                    GetFAPostingGroup;
                end else begin
                    "Depreciation Book Code" := '';
                    "FA Posting Date" := 0D;


                    "Maintenance Code" := '';


                end;
            end;
        }
        field(5602; "Depreciation Book Code"; Code[10])
        {
            Caption = 'Depreciation Book Code';
            DataClassification = ToBeClassified;
            TableRelation = "Depreciation Book";

            trigger OnValidate()
            begin
                GetFAPostingGroup;
            end;
        }
        field(5609; "Maintenance Code"; Code[10])
        {
            Caption = 'Maintenance Code';
            DataClassification = ToBeClassified;
            TableRelation = Maintenance;
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
        field(70036; "Procurement Plan ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code;
        }
        field(70037; "Procurement Plan Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            //    TableRelation = "Procurement Plan Entry"."Entry No." where ("Procurement Plan ID"=field("Procurement Plan Entry No"));

            trigger OnValidate()
            begin
                /* PlanItem.RESET;
                 PlanItem.SETRANGE("Plan Item No","Procurement Plan Item");
                 IF PlanItem.FIND('-') THEN
                   "Procurement Plan Item Descript":=PlanItem."Item Description";*/

            end;
        }
        field(70038; "Technical Specifications"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(70044; "Contract Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Construction,PBRM';
            OptionMembers = " ",Construction,PBRM;
        }

    }

    local procedure GetFAPostingGroup()
    var
        LocalGLAcc: Record "G/L Account";
        FAPostingGr: Record "FA Posting Group";
        FADeprBook: Record "FA Depreciation Book";
        FASetup: Record "FA Setup";
    begin
        if (Type <> Type::"Fixed Asset") or ("No." = '') then
            exit;
        if "Depreciation Book Code" = '' then begin
            FASetup.Get;
            "Depreciation Book Code" := FASetup."Default Depr. Book";
            if not FADeprBook.Get("No.", "Depreciation Book Code") then
                "Depreciation Book Code" := '';
            if "Depreciation Book Code" = '' then
                exit;
        end;
        if "FA Posting Type" = "fa posting type"::" " then
            "FA Posting Type" := "fa posting type"::"Acquisition Cost";
        FADeprBook.Get("No.", "Depreciation Book Code");
        FADeprBook.TestField("FA Posting Group");
        FAPostingGr.Get(FADeprBook."FA Posting Group");
        case "FA Posting Type" of
            "fa posting type"::"Acquisition Cost":
                LocalGLAcc.Get(FAPostingGr.GetAcquisitionCostAccount);
            "fa posting type"::Appreciation:
                LocalGLAcc.Get(FAPostingGr.GetAppreciationAccount);
            "fa posting type"::Maintenance:
                LocalGLAcc.Get(FAPostingGr.GetMaintenanceExpenseAccount);
        end;
        LocalGLAcc.CheckGLAcc;
        LocalGLAcc.TestField("Gen. Prod. Posting Group");
        "Posting Group" := FADeprBook."FA Posting Group";
        "Gen. Prod. Posting Group" := LocalGLAcc."Gen. Prod. Posting Group";
        "Tax Group Code" := LocalGLAcc."Tax Group Code";
        Validate("VAT Prod. Posting Group", LocalGLAcc."VAT Prod. Posting Group");
    end;

    trigger OnInsert()
    var
        StdPurchCode: Record 173;

    begin
        StdPurchCode.GET("Standard Purchase Code");
    end;
}

