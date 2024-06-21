#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50087 "tableextension50087" extends "Job Planning Line"
{
    fields
    {


        modify("Unit of Measure Code")
        {

            //Unsupported feature: Property Modification (Data type) on ""Unit of Measure Code"(Field 17)".

            TableRelation = if (Type = const(Item)) "Unit of Measure".Code
            else
            if (Type = const(Resource)) "Resource Unit of Measure".Code where("Resource No." = field("No."))
            else
            "Unit of Measure";
        }
       

        //Unsupported feature: Code Modification on ""No."(Field 7).OnValidate".

        //trigger "(Field 7)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateModification(xRec."No." <> "No.");

        CheckUsageLinkRelations;
        #4..45
              "Description 2" := Item."Description 2";
              IF Job."Language Code" <> '' THEN
                GetItemTranslation;
              "Gen. Prod. Posting Group" := Item."Gen. Prod. Posting Group";
              VALIDATE("Unit of Measure Code",Item."Base Unit of Measure");
              IF "Usage Link" THEN
                IF Item.Reserve = Item.Reserve::Optional THEN
                  Reserve := Job.Reserve
        #54..76

        IF Type <> Type::Text THEN
          VALIDATE(Quantity);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..48
              "Road Activity Categories":=Item."Item Category Code";
              "Gen. Prod. Posting Group" := Item."Gen. Prod. Posting Group";
             // VALIDATE("Unit of Measure Code",Item."Base Unit of Measure");
        #51..79
        */
        //end;


        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Field 17).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateModification(xRec."Unit of Measure Code" <> "Unit of Measure Code");

        GetGLSetup;
        CASE Type OF
        #5..30
        CheckItemAvailable(FIELDNO("Unit of Measure Code"));
        UpdateReservation(FIELDNO("Unit of Measure Code"));
        VALIDATE(Quantity);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {ValidateModification(xRec."Unit of Measure Code" <> "Unit of Measure Code");
        #2..33
        }
        */
        //end;
        field(89; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            
            TableRelation = "VAT Business Posting Group";

            trigger OnValidate()
            begin
                Validate("VAT Prod. Posting Group");
            end;
        }
        field(90; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                if VATPostingSetup.Get("VAT Bus. Posting Group", "VAT Prod. Posting Group") then begin
                    "VAT %" := VATPostingSetup."VAT %";
                    "Total Cost Incl. VAT" := "Unit Cost Inc VAT" * Quantity;
                    "Unit Cost Inc VAT" :=("Unit Cost" *VATPostingSetup."VAT %"/100)+"Unit Cost";
                end;
            end;
        }
        field(56023; "Vendor No"; Code[20])
        {
            
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if Vend.Get("Vendor No") then
                    "Vendor Name" := Vend.Name;
            end;
        }
        field(56024; "Vendor Name"; Text[60])
        {
            
            Editable = false;
        }
        field(56025; "Default Resource Cost Account"; Code[20])
        {
            
            TableRelation = "G/L Account"."No.";
        }
        field(56026; "Media Order"; Code[30])
        {
            
            TableRelation = "Purchase Header"."No." where("Document Type" = filter(Order));
        }
        field(56027; Select; Boolean)
        {
            

            trigger OnValidate()
            begin
                //IF Ordered=TRUE THEN
                //ERROR('It has already been ordered');
                CalcFields("Qty. Ordered");
                //cc// if Quantity > "Qty. Ordered" then
                //  cc//  "Qty. to Order" := Quantity - "Qty. Ordered";
            end;
        }
        field(56028; Ordered; Boolean)
        {
            
            Editable = true;
        }
        field(56029; "Qty. to Order"; Decimal)
        {
            ////
            
            DecimalPlaces = 5;

            trigger OnValidate()
            begin
                CalcFields("Qty. Ordered");
                //  cc to be returned       //if "Qty. to Order" > (Quantity - "Qty. Ordered") then
                //  Error('Qty. to Order should not exceed Quantity %1', (Quantity - "Qty. Ordered"))
            end;
        }
        field(56030; "Remaining Qty"; Decimal)
        {
            
        }
        field(56031; "Header No."; Code[20])
        {
            
        }
        field(56032; "Agency Commision %"; Decimal)
        {
            
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Agency Commision Amount" := "Unit Cost" * "Agency Commision %" / 100;
                "Net Amount" := "Unit Cost" - "Agency Commision Amount";
            end;
        }
        field(56033; "Agency Commision Amount"; Decimal)
        {
            
        }
        field(56034; "Qty. Ordered"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry".Quantity where("Job No." = field("Job No."),
                                                                 "Job Task No." = field("Job Task No."),
                                                                 "Entry Type" = const(Usage)));
            FieldClass = FlowField;
        }
        field(56035; "Station No"; Code[20])
        {
            
            TableRelation = Contact."No." where(TEST = field("Vendor No"));

            trigger OnValidate()
            begin
                if Cont.Get("Station No") then
                    "Station Name" := Cont.Name;
            end;
        }
        field(56036; "Station Name"; Text[50])
        {
            
            Editable = false;
        }
        field(56037; "Net Amount"; Decimal)
        {
            
        }
        field(56038; Instruction; Text[50])
        {
            
            Editable = true;
        }
        field(56039; "Instruction Code"; Code[10])
        {
            
            TableRelation = "Reason Code";

            trigger OnValidate()
            begin
                if instruction1.Get("Instruction Code") then
                    Instruction := instruction1.Description;
            end;
        }
        field(65001; "Budget Type"; Option)
        {
            
            Description = 'Added for Project Procurement Plan';
            OptionCaption = 'Original,Revised,Suplementary';
            OptionMembers = Original,Revised,Suplementary;
        }
        field(65002; "Job Budget Templates"; Code[100])
        {
            
            Description = 'Added for Project Procurement Plan';
            TableRelation = "Job Budget Templates";
        }
        field(70014; "Department Code"; Code[30])
        {
            
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; "Road Activity Categories"; Code[50])
        {
            
            TableRelation = "Item Category".Code where(Indentation = filter(2));
        }
        field(70021; "Road Activity Sub-Category"; Code[50])
        {
            
            TableRelation = "Road Activities";
        }
        field(70022; "Unit of Measure"; Code[50])
        {
            
            TableRelation = "Unit of Measure".Code;
        }
        field(70023; "Planned Rate Amount"; Decimal)
        {
            
        }
        field(70024; "Bid Amount"; Decimal)
        {
            
        }
        field(70025; "Bid Quantity"; Integer)
        {
            
        }
        field(70026; "Bid Rate"; Decimal)
        {
            
        }
        field(70027; "Labour (%)"; Integer)
        {
            
        }
        field(70028; "Bill Item No"; Code[30])
        {
            
            TableRelation = "BoQ Template Line"."No." where("BoQ Template ID" = field("Road Activity Categories"));

            trigger OnValidate()
            begin
                BoQTemplateLine.Reset;
                BoQTemplateLine.SetRange(BoQTemplateLine."No.", "Bill Item No");
                if BoQTemplateLine.FindSet then begin
                    Quantity := BoQTemplateLine.Quantity;
                    "Unit Cost" := BoQTemplateLine."Amount Excl. VAT";
                    Description := BoQTemplateLine.Description;
                    "Unit of Measure" := BoQTemplateLine."Unit of Measure";
                    "Road Technology" := BoQTemplateLine."Technology Code";
                    Validate("Road Technology");

                end;
            end;
        }
        field(70029; "Road Technology"; Code[30])
        {
            
            TableRelation = "Road Technology".Code;

            trigger OnValidate()
            begin
                RoadTechnology.Reset;
                RoadTechnology.SetRange(RoadTechnology.Code, "Road Technology");
                if RoadTechnology.FindSet then begin
                    "Labour (%)" := RoadTechnology."Labour Percentage";
                end;
            end;
        }
        field(70030; "Measured Quantity"; Decimal)
        {
            CalcFormula = sum("Measurement & Payment Entry"."Measured Quantity" where("Job No." = field("Job No."),
                                                                                       "No." = field("No."),
                                                                                       Reversed = filter(false),
                                                                                       "Bill Item Category Code" = field("Road Activity Categories")));
            DecimalPlaces = 5 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(70031; "Total Cost Incl. VAT"; Decimal)
        {
            
        }
        field(72000; "Road Code"; Code[30])
        {
            
            //  TableRelation = "Road Inventory"."Road Code";
            TableRelation = "Project Road Link"."Road Code" where("Global Budget Book Code" = field("Job No."));
        }
        field(72001; "Road Section No"; Code[20])
        {
            
            // TableRelation = "Road Section"."Road Section No." whe("Road Code" = "=field("Road Code"));

            trigger OnValidate()
            begin
                /*RoadSection.RESET;
                RoadSection.SETRANGE(RoadSection."Road Section No.","Road Section No");
                IF RoadSection.FINDSET THEN
                  BEGIN
                    "Constituency ID":=RoadSection."Primary Constituency ID";;
                    "County ID":=RoadSection."Primary County ID";
                    "Region ID":=RoadSection."Primary Region ID";
                
                    END;*/

            end;
        }
        field(72002; "Constituency ID"; Code[30])
        {
            
            TableRelation = Constituency.Code;
        }
        field(72003; "County ID"; Code[40])
        {
            
            TableRelation = County.Code;
        }
        field(72004; "Region ID"; Code[40])
        {
            
            TableRelation = County.Code;
        }
        field(72005; Text; Code[20])
        {
            
        }
        field(72006; "Last Proj Variation Order No."; Code[20])
        {
            
            Description = 'Last Proj Variation Order No.';
        }
        field(72007; "Contract Type"; Option)
        {
            
            OptionCaption = ' ,Construction,PBRM';
            OptionMembers = " ",Construction,PBRM;
        }
        field(72008; Active; Boolean)
        {
            
            Editable = false;
        }
        field(72009; "Reversion Type"; Option)
        {
            
            OptionCaption = 'To Contractor,To Authority';
            OptionMembers = "To Contractor","To Authority";
        }
        field(72010; "Bill Item"; Code[20])
        {
            
        }
        field(72011; "Certified Quantity To Date"; Decimal)
        {
            
            DecimalPlaces = 5;
        }
        field(72012; "Unit Cost Inc VAT"; Decimal)
        {
            
        }
        field(72013; "Total Cost Incl. VAT LCY";Decimal)
        {
            
        }
        field(72014; "Detailed Description"; Text[300])
        {
            
        }
        field(72015; "Road Project Category"; Enum "Road Project Category")
        {
            
        }
      
    }
    

    //Unsupported feature: Insertion (FieldGroupCollection) on "(FieldGroup: DropDown)".


    var
        BoQTemplateLine: Record "BoQ Template Line";
        RoadTechnology: Record "Road Technology";
        Vend: Record Vendor;
        Cont: Record Contact;
        instruction1: Record "Reason Code";
        VATPostingSetup: Record "VAT Posting Setup";
}

