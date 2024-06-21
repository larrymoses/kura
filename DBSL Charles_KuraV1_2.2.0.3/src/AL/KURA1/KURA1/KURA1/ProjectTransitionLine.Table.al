#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72345 "Project Transition Line"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                // Job.RESET;
                // Job.SETRANGE(Job."No.","Project ID");
                // IF Job.FINDSET THEN BEGIN
                //  "Project Name":=Job.Description;
                //  "Purchase Contract ID":=Job."Purchase Contract ID";
                //  VALIDATE("Purchase Contract ID");
                //  "Contractor No.":=Job."Contractor No.";
                //  VALIDATE("Contractor No.");
                //
                //  END;
            end;
        }
        field(3;"Purchase Contract ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where ("Document Type"=filter("Blanket Order"));

            trigger OnValidate()
            begin
                // PurchaseHeader.RESET;
                // PurchaseHeader.SETRANGE(PurchaseHeader."No.","Purchase Contract ID");
                // IF PurchaseHeader.FINDSET THEN BEGIN
                //  "Contractor No.":=PurchaseHeader."Buy-from Vendor No.";
                //  VALIDATE("Contractor No.");
                //
                //  END;
            end;
        }
        field(4;"Contractor No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                // Vendor.RESET;
                // Vendor.SETRANGE(Vendor."No.","Contractor No.");
                // IF Vendor.FINDSET THEN BEGIN
                //  "Contractor Name":=Vendor.Name;
                //  "Contractor Address":=Vendor.Address;
                //  "Contractor Email":=Vendor."E-Mail";
                //  END;
            end;
        }
        field(5;"PBRM BoQ Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code where (Blocked=filter(false));
        }
        field(6;"Line No.";Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(7;Type;Option)
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)";

            trigger OnValidate()
            var
                OldType: Integer;
            begin
                // OldType := Type;
                // INIT;
                // Type := OldType;
            end;
        }
        field(8;"No.";Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            TableRelation = if (Type=const(" ")) "Standard Text"
                            else if (Type=const("G/L Account")) "G/L Account"
                            else if (Type=const(Item)) Item where (Blocked=const(false))
                            else if (Type=const("Fixed Asset")) "Fixed Asset"
                            else if (Type=const("Charge (Item)")) "Item Charge";

            trigger OnValidate()
            var
                GLAcc: Record "G/L Account";
                Item: Record Item;
                ItemCharge: Record "Item Charge";
                FA: Record "Fixed Asset";
                StdTxt: Record "Standard Text";
                StdPurchCode: Record "Standard Purchase Code";
            begin
                /* Quantity := 0;
                 "Amount Excl. VAT" := 0;
                 "Unit of Measure" := '';
                 Description := '';
                 IF "No." = '' THEN
                  EXIT;
                 //StdPurchCode.GET("Standard Purchase Code");
                 CASE Type OF
                  Type::" ":
                    BEGIN
                      StdTxt.GET("No.");
                      Description := StdTxt.Description;
                    END;
                  Type::"G/L Account":
                    BEGIN
                      GLAcc.GET("No.");
                      GLAcc.CheckGLAcc;
                      GLAcc.TESTFIELD("Direct Posting",TRUE);
                      Description := GLAcc.Name;
                      //OnAfterValidateGLAccountNo(Rec,GLAcc);
                    END;
                  Type::Item:
                    BEGIN
                      Item.GET("No.");
                      Item.TESTFIELD(Blocked,FALSE);
                      //Item.TESTFIELD("Gen. Prod. Posting Group");
                      IF Item.Type = Item.Type::Inventory THEN
                        //Item.TESTFIELD("Inventory Posting Group");
                     "Unit of Measure":= Item."Purch. Unit of Measure";
                      Description := Item.Description;
                      "Variant Code" := '';
                    END;
                  3:
                    ERROR(Text001);
                  Type::"Fixed Asset":
                    BEGIN
                      FA.GET("No.");
                      FA.TESTFIELD(Inactive,FALSE);
                      FA.TESTFIELD(Blocked,FALSE);
                      Description := FA.Description;
                    END;
                  Type::"Charge (Item)":
                    BEGIN
                      ItemCharge.GET("No.");
                      Description := ItemCharge.Description;
                    END;
                 END;*/

            end;
        }
        field(9;Description;Text[300])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(10;Quantity;Decimal)
        {
            BlankZero = true;
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;

            trigger OnValidate()
            begin
                //TESTFIELD(Type);
            end;
        }
        field(11;"Amount Excl. VAT";Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Amount Excl. VAT';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF (Type <> Type::"G/L Account") AND (Type <> Type::"Charge (Item)") THEN
                //  ERROR(Text002,FIELDCAPTION(Type),Type);
            end;
        }
        field(12;"Unit of Measure";Code[20])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";

            trigger OnValidate()
            begin
                //TESTFIELD(Type);
            end;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ProjectTransitionHeader.Reset;
        ProjectTransitionHeader.SetRange(ProjectTransitionHeader."Document No.","Document No.");
        if ProjectTransitionHeader.FindSet then
          begin
            "Project ID":=ProjectTransitionHeader."Project ID";
            "Contractor No.":=ProjectTransitionHeader."Contractor No.";
            "Purchase Contract ID":=ProjectTransitionHeader."Purchase Contract ID";
            "PBRM BoQ Template ID":=ProjectTransitionHeader."PBRM BoQ Template ID";
            end;
    end;

    var
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Job: Record Job;
        Vendor: Record Vendor;
        PurchaseHeader: Record "Purchase Header";
        ProjectTransitionHeader: Record "Project Transition Header";
}

