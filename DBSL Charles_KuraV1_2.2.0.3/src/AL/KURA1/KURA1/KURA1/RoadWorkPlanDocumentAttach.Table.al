#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72304 "Road WorkPlan Document Attach"
{

    fields
    {
        field(1; "Road Work Program ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Budget Entry No"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // RoadWorkProgram.RESET;
                // RoadWorkProgram.SETRANGE(RoadWorkProgram.Code,"Road Work Program ID");
                // IF RoadWorkProgram.FINDSET THEN BEGIN
                // NewRoadWorkProgramPackage.RESET;
                // NewRoadWorkProgramPackage.SETRANGE("Road Work Program ID",RoadWorkProgram."Gloabal Budget Book ID");
                // NewRoadWorkProgramPackage.SETRANGE(NewRoadWorkProgramPackage."Package No.","Package No.");
                // IF NewRoadWorkProgramPackage.FINDSET THEN
                //  BEGIN
                // //  REPEAT
                //       INIT;
                //       "Road Work Program ID":=RoadWorkProgram.Code;
                //       "Package No.":=NewRoadWorkProgramPackage."Package No.";
                //       "Package Name":=NewRoadWorkProgramPackage."Package Name";
                //       "Road Code":=NewRoadWorkProgramPackage."Road Code";
                //       "Global Budget ID":="Global Budget ID";
                //       VALIDATE("Road Code");
                //       "Road Section No.":=NewRoadWorkProgramPackage."Road Section No.";
                //       VALIDATE("Road Section No.");
                //       "Entry No":=COUNT+100;
                //      "Section Name":=NewRoadWorkProgramPackage."Section Name";
                //      "Road Works Category":=NewRoadWorkProgramPackage."Road Works Category";
                //      "Road Project Category":=NewRoadWorkProgramPackage."Road Project Category";
                //      "Pavement Surface Type":=NewRoadWorkProgramPackage."Pavement Surface Type";
                //      "Funding Source ID":=NewRoadWorkProgramPackage."Funding Source ID";
                //      VALIDATE("Funding Source ID");
                //      "BoQ Template Code":=NewRoadWorkProgramPackage."BoQ Template Code";
                //      "Directorate ID":=NewRoadWorkProgramPackage."Directorate ID";
                //      "Department ID":=NewRoadWorkProgramPackage."Department ID";
                //      "Region ID":=NewRoadWorkProgramPackage."Region ID";
                //      "VAT Bus. Posting Group":=NewRoadWorkProgramPackage."VAT Bus. Posting Group";
                //      "VAT Prod. Posting Group":=NewRoadWorkProgramPackage."VAT Prod. Posting Group";
                //      "Budget (Cost) Excl. VAT":=NewRoadWorkProgramPackage."Budget (Cost) Excl. VAT";
                //      VALIDATE("Budget (Cost) Excl. VAT");
                //      "Total Budget Cost":=NewRoadWorkProgramPackage."Total Budget Cost";
                //      VALIDATE("Total Budget Cost");
                //      INSERT(TRUE);
                //      COMMIT;
                //  END;
                //  END;
            end;
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;
        }
        field(4; "Project No"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "KeRRA Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Document Link"; Text[2048])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(7; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Tender Instructions,Project Special Specs,Standard Specs,General Contract Conditions,Drawings,Evaluation Criteria,Tender Data Sheet,Special Conditions of Contract';
            OptionMembers = " ","Tender Instructions","Project Special Specs","Standard Specs","General Contract Conditions",Drawings,"Evaluation Criteria","Tender Data Sheet","Special Conditions of Contract";
        }
        field(8; Attached; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Road Work Program ID", "Budget Entry No", "Project No", "KeRRA Budget Code", "Entry No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // "Directorate ID":=RoadWorkProgram."Directorate Code";
        // "Department ID":=RoadWorkProgram."Department Code";
        // //"Region ID":=RoadWorkProgram."Region ID";
        //
        // RoadWorkProgram.RESET;
        // RoadWorkProgram.SETRANGE(RoadWorkProgram.Code,"Road Work Program ID");
        // RoadWorkProgram.SETRANGE(RoadWorkProgram."Document Type",RoadWorkProgram."Document Type"::"Road Work Plan");
        // IF RoadWorkProgram.FINDSET THEN BEGIN
        //  "VAT Bus. Posting Group":=RoadWorkProgram."VAT Bus. Posting Group";
        //  "VAT Prod. Posting Group":=RoadWorkProgram."VAT Prod. Posting Group";
        //  "Road Project Category":=RoadWorkProgram."Road Project Category";
        //  VALIDATE("Road Project Category");
        //  "Document Type":=RoadWorkProgram."Document Type";
        //  "Global Budget ID":=RoadWorkProgram."Gloabal Budget Book ID";
        //  "Road Project Category":=RoadWorkProgram."Road Project Category";
        //  END;
    end;

    var
        RoadSection: Record "Road Section";
        RoadWorkProgram: Record "Road Work Program";
        // //   Constituency: Record Constituency;
        // WorksCategory: Record "Works Category";
        //  FundingSource: Record "Funding Source";
        VATProductPostingGroup: Record "VAT Product Posting Group";
        VATPostingSetup: Record "VAT Posting Setup";
        // NewRoadWorkProgramPackage: Record "New Road Work Program Package";
        RoadInventory: Record "Road Inventory";
}

