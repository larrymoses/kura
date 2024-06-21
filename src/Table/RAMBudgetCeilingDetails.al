table 99601 "RAM Budget Ceiling Details"
{
    Caption = 'RAM  Budget Ceiling Details';

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Global Dimension 2 Code";Code[40])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Global Dimension 2 Name";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Region Code";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Region Name";Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Workplan Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Regional,Consolidated';
            OptionMembers = " ",Regional,Consolidated;
        }
        field(8;"Constituency Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code WHERE (
                                                     "Region Code"=FIELD("Region Code"));

            trigger OnValidate()
            begin
                Constituency.RESET;
                Constituency.SETRANGE(Constituency.Code,"Constituency Code");
                IF Constituency.FINDSET THEN
                  "Constituency Name":=Constituency.Description;
            end;
        }
        field(9;"Constituency Name";Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Allocation Percentage";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                RoadGLbudgetSetup.RESET;
                //RoadGLbudgetSetup.SETRANGE(RoadGLbudgetSetup."Document No","Document No");
                RoadGLbudgetSetup.SETRANGE(RoadGLbudgetSetup."Entry no","Line No");
                IF RoadGLbudgetSetup.FINDSET THEN BEGIN
                "Allocation Amount":=(("Allocation Percentage"/100)*RoadGLbudgetSetup.Amount);
                END;

                // RAMBudgetCeilingDetails.RESET;
                // RAMBudgetCeilingDetails.SETRANGE(RAMBudgetCeilingDetails."Document No","Document No");
                // RAMBudgetCeilingDetails.SETRANGE(RAMBudgetCeilingDetails."Line No","Line No");
                // IF RAMBudgetCeilingDetails.FINDLAST THEN
                  //"Cummulative Amount":=RAMBudgetCeilingDetails."Cummulative Amount";
                 //"Cummulative Amount":=RAMBudgetCeilingDetails."Cummulative Amount"+"Allocation Amount";
            end;
        }
        field(12;"Allocation Amount";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 9:3;

            trigger OnValidate()
            begin
                RoadGLbudgetSetup.RESET;
               // RoadGLbudgetSetup.SETRANGE(RoadGLbudgetSetup."Document No","Document No");
                RoadGLbudgetSetup.SETRANGE(RoadGLbudgetSetup."Entry no","Line No");
                IF RoadGLbudgetSetup.FINDSET THEN BEGIN
                  IF "Allocation Amount">RoadGLbudgetSetup.Amount THEN
                  ERROR('Allocation Amount cannot be greater than budget ceiling amount');
                "Allocation Percentage":=(("Allocation Amount"/RoadGLbudgetSetup.Amount)*100);
                "Cummulative Amount":="Cummulative Amount"+"Allocation Amount";
                END;

                RoadGLbudgetSetup.RESET;
                //RoadGLbudgetSetup.SETRANGE(RoadGLbudgetSetup."Document No","Document No");
                RoadGLbudgetSetup.SETRANGE(RoadGLbudgetSetup."Entry no","Line No");
                IF RoadGLbudgetSetup.FINDSET THEN BEGIN
                  IF "Cummulative Amount">RoadGLbudgetSetup.Amount THEN
                  ERROR('Total allocation amount cannot be greater than budget ceiling amount');
                  END;
            end;
        }
        field(13;"Cummulative Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Regional WorkPlan No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Regional Ref No";Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Workplan Type","Global Dimension 2 Code","Line No","Entry No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //RAMBudgetCeilingDetails.RESET;
        // RAMBudgetCeilingDetails.SETRANGE(RAMBudgetCeilingDetails."Document No","Document No");
        // RAMBudgetCeilingDetails.SETRANGE(RAMBudgetCeilingDetails."Line No","Line No");
        // IF RAMBudgetCeilingDetails.FINDLAST THEN
        //  "Cummulative Amount":=RAMBudgetCeilingDetails."Cummulative Amount";
    end;

    trigger OnInsert()
    begin
          IF "Workplan Type"="Workplan Type"::Regional THEN BEGIN
          RoadGLbudgetSetup.RESET;
         // RoadGLbudgetSetup.SETRANGE(RoadGLbudgetSetup."Document No","Document No");
          RoadGLbudgetSetup.SETRANGE(RoadGLbudgetSetup."Entry no","Line No");
          IF RoadGLbudgetSetup.FINDSET THEN BEGIN
           "Region Code":=RoadGLbudgetSetup."Region Code";
           END;
        END;
        RAMBudgetCeilingDetails.RESET;
        RAMBudgetCeilingDetails.SETRANGE(RAMBudgetCeilingDetails."Document No","Document No");
        RAMBudgetCeilingDetails.SETRANGE(RAMBudgetCeilingDetails."Line No","Line No");
        IF RAMBudgetCeilingDetails.FINDLAST THEN
          "Cummulative Amount":=RAMBudgetCeilingDetails."Cummulative Amount";
    end;

    var
        RAMWorkplanHeader: Record "RAM Workplan Header";
        Constituency: Record Constituency;
        RoadGLbudgetSetup: Record "Road G/L budget Setup";
        RAMBudgetCeilingDetails: Record "RAM Budget Ceiling Details";
}

