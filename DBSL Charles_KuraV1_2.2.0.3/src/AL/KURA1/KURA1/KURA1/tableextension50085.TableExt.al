#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50085 "tableextension50085" extends "Job Task"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Job No."(Field 1)".


        //Unsupported feature: Property Modification (Editable) on ""Job No."(Field 1)".


        //Unsupported feature: Property Modification (Data type) on ""Job Task No."(Field 2)".


        //Unsupported feature: Property Modification (Data type) on "Description(Field 3)".


        //Unsupported feature: Property Modification (Data type) on ""Global Dimension 1 Code"(Field 60)".


        //Unsupported feature: Property Modification (Data type) on ""Global Dimension 2 Code"(Field 61)".


        //Unsupported feature: Code Insertion on ""Job No."(Field 1)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        IF Job.GET("Job No.") THEN BEGIN
          "Road Code":=Job."Road Code";
          VALIDATE("Road Section No",Job."Road Section No");
          //"Road Project Category":=Job."Road Project Category";
          END;
        */
        //end;
        field(50020; "Shortcut Dimension 3 Code"; Code[40])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[40])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[40])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50023; "LPO Commitments"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50024; "PRN Commitments"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Transaction Codes"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; Commitments; Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where(Job = field("Job No."),
                                                                  "Job Task No" = field("Job Task No."),
                                                                  Type = const(Committed)));
            FieldClass = FlowField;
        }
        field(70021; "Start Point(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70022; "End Point(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70023; "Funding Source"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source";
        }
        field(70024; "Procurement Method"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Method";
        }
        field(70025; "Surface Types"; Code[30])
        {
            DataClassification = ToBeClassified;
            //TableRelation = Table50003.Field1;
        }
        field(70026; "Road Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Good,Poor,Excellent';
            OptionMembers = Good,Poor,Excellent;
        }
        field(70028; "Completed Length(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70029; "Roads Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Works Category";
        }
        field(70030; "Fund Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fund Type";
        }
        field(70031; "Execution Method"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Work Execution Method";
        }
        field(70032; "Road Section ID"; Code[20])
        {
            DataClassification = ToBeClassified;

            // trigger OnValidate()
            // begin
            //     RoadSection.Reset;
            //     RoadSection.SetRange(RoadSection."Road Section No .","Road Section ID");
            //     if RoadSection.FindSet then
            //      "Road Section  Name" := ":=RoadSection."Section Name";
            // end;
        }
        field(70033; "Road Section  Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70034; "Measured Qunatity"; Decimal)
        {
            CalcFormula = sum("Measurement & Payment Entry"."Measured Quantity" where("Job No." = field("Job No."),
                                                                                       "Job Task No." = field("Job Task No."),
                                                                                       Reversed = const(false)));
            DecimalPlaces = 5 : 5;
            FieldClass = FlowField;
        }
        field(72000; "Road Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Road Inventory"."Road Code";
        }
        field(72001; "Road Section No"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Road Section"."Road Section No." whe("Road Code" = "=field("Road Code"));

            // trigger OnValidate()
            // begin
            //     RoadSection.Reset;
            //     RoadSection.SetRange(RoadSection."Road Section No .","Road Section No");
            // //     if RoadSection.FindSet t begin
            //         "Constituency ID" := ":=RoadSection."Primary Constituency I
            //         ;
            //         "County ID" := RoadSection."Primary County ID";
            //         "Region ID" := RoadSection."Primary Region ID";

            //         end;
            // end;
        }
        field(72002; "Constituency ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code;
        }
        field(72003; "County ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code;
        }
        field(72004; "Region ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code;
        }
        field(72005; "Road Project Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Studies and Surveys,Construction Works,Maitenance Works';
            OptionMembers = ,"Studies and Surveys","Construction Works","Maitenance Works";
        }
        field(72006; Location; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Added to track the Project Location';
            TableRelation = Location;

            trigger OnValidate()
            begin
                JobLedgerEntries.Reset;
                JobLedgerEntries.SetRange(JobLedgerEntries."Job No.", "Job No.");
                JobLedgerEntries.SetRange(JobLedgerEntries."Job Task No.", "Job Task No.");
                if not JobLedgerEntries.IsEmpty then begin
                    //Error(CannotChangeAssociatedEntriesEr r,FieldCaption(Location ),Description);
                end;
            end;
        }
    }

    //Unsupported feature: Insertion (FieldGroupCollection) on "(FieldGroup: Brick)".


    //Unsupported feature: Property Modification (Length) on "ValidateShortcutDimCode(PROCEDURE 29).ShortcutDimCode(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "ApplyPurchaseLineFilters(PROCEDURE 4).JobNo(Parameter 1002)".


    //Unsupported feature: Property Modification (Length) on "ApplyPurchaseLineFilters(PROCEDURE 4).JobTaskNo(Parameter 1001)".


    var
        // RoadSection: Record "Road Section";
        // RoadInventory: Record "Road Inventory";
        JobLedgerEntries: Record "Job Ledger Entry";
}

