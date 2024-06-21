#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80231 "Workplan Lines Revision"
{

    fields
    {
        field(1;No;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Strategy Plan ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(3;"Activity ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Initiative".Code where ("Strategic Plan ID"=field("Strategy Plan ID"));

            trigger OnValidate()
            begin
                /*StrategicInt.RESET;
                StrategicInt.SETRANGE(Code,"Activity ID");
                IF StrategicInt.FIND('-') THEN BEGIN
                  Description:=StrategicInt.Description;
                  END;*/
                StrategyWorkplanLines.Reset;
                StrategyWorkplanLines.SetRange("Strategic Plan ID","Strategy Plan ID");
                StrategyWorkplanLines.SetRange(Code,"Activity ID");
                if StrategyWorkplanLines.FindFirst then begin
                     Description:=StrategyWorkplanLines.Description;
                    "Imported Annual Target Qty":=StrategyWorkplanLines."Collective target";
                    "Imported Annual Budget Est.":=StrategyWorkplanLines."Collective Budget";
                    "Primary Directorate":=StrategyWorkplanLines."Primary Directorate";
                    "Primary Department":=StrategyWorkplanLines."Primary Department";
                    "Unit of Measure":=StrategyWorkplanLines."Unit of Measure";
                    "Source Of Fund":=StrategyWorkplanLines."Source Of Fund";
                    "Perfomance Indicator":=StrategyWorkplanLines."Perfomance Indicator";
                    "Desired Perfomance Direction":=StrategyWorkplanLines."Desired Perfomance Direction";
                    "Framework Perspective":=StrategyWorkplanLines."Framework Perspective";
                end;

            end;
        }
        field(4;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Imported Annual Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Imported Annual Target Qty"<>0 then begin
                Remainder:=ROUND("Imported Annual Target Qty" MOD 4,1,'=');
                 "Q1 Target":=("Imported Annual Target Qty"-Remainder)/4+Remainder;
                 "Q2 Target":=("Imported Annual Target Qty"-Remainder)/4;
                 "Q3 Target":=("Imported Annual Target Qty"-Remainder)/4;
                 "Q4 Target":=("Imported Annual Target Qty"-Remainder)/4;
                end;
            end;
        }
        field(6;"Imported Annual Budget Est.";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                 if ("Imported Annual Budget Est."<>0) then begin
                  "Q1 Budget":=ROUND("Imported Annual Budget Est."*("Q1 Target"/"Imported Annual Target Qty"),0.01,'=');
                  "Q2 Budget":=ROUND("Imported Annual Budget Est."*("Q2 Target"/"Imported Annual Target Qty"),0.01,'=');
                  "Q3 Budget":=ROUND("Imported Annual Budget Est."*("Q3 Target"/"Imported Annual Target Qty"),0.01,'=');
                  "Q4 Budget":=ROUND("Imported Annual Budget Est."*("Q4 Target"/"Imported Annual Target Qty"),0.01,'=');
                end;
            end;
        }
        field(7;"Primary Directorate";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(8;"Primary Department";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"),
                                                           "Direct Reports To"=field("Primary Directorate"));
        }
        field(9;"Q1 Target";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Q1 Budget";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Q2 Target";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Q2 Budget";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Q3 Target";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Q3 Budget";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Q4 Target";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Q4 Budget";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Entry Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Planned,Actual';
            OptionMembers = Planned,Actual;
        }
        field(18;"Year Reporting Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code;
        }
        field(19;"Perfomance Indicator";Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Performance Indicator";
        }
        field(20;"Source Of Fund";Code[50])
        {
            Caption = 'Source Of Fund';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(21;"Unit of Measure";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Desired Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(23;"Framework Perspective";Code[255])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework Perspective".Code where ("Strategy Framework"=field("Strategy Framework"));
        }
        field(24;"Strategy Framework";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework";
        }
        field(25;"Annual Workplan";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan".No;
        }
        field(26;"New Description";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(27;"New Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Imported Annual Target Qty"<>0 then begin
                Remainder:=ROUND("Imported Annual Target Qty" MOD 4,1,'=');
                 "Q1 Target":=("Imported Annual Target Qty"-Remainder)/4+Remainder;
                 "Q2 Target":=("Imported Annual Target Qty"-Remainder)/4;
                 "Q3 Target":=("Imported Annual Target Qty"-Remainder)/4;
                 "Q4 Target":=("Imported Annual Target Qty"-Remainder)/4;
                end;
            end;
        }
        field(28;"New Budget Est.";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                 if ("Imported Annual Budget Est."<>0) then begin
                  "Q1 Budget":=ROUND("Imported Annual Budget Est."*("Q1 Target"/"Imported Annual Target Qty"),0.01,'=');
                  "Q2 Budget":=ROUND("Imported Annual Budget Est."*("Q2 Target"/"Imported Annual Target Qty"),0.01,'=');
                  "Q3 Budget":=ROUND("Imported Annual Budget Est."*("Q3 Target"/"Imported Annual Target Qty"),0.01,'=');
                  "Q4 Budget":=ROUND("Imported Annual Budget Est."*("Q4 Target"/"Imported Annual Target Qty"),0.01,'=');
                end;
            end;
        }
        field(29;"New Primary Directorate";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(30;"New Primary Department";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"),
                                                           "Direct Reports To"=field("Primary Directorate"));
        }
        field(31;"New Perfomance Indicator";Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Performance Indicator";
        }
        field(32;"New Source Of Fund";Code[50])
        {
            Caption = 'Source Of Fund';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(33;"New Unit of Measure";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(34;"New Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(35;"New Framework Perspective";Code[255])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework Perspective".Code where ("Strategy Framework"=field("Strategy Framework"));
        }
        field(36;"New Strategy Framework";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework";
        }
        field(37;"Revision Workplan";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan".No;
        }
    }

    keys
    {
        key(Key1;No,"Strategy Plan ID","Activity ID","Revision Workplan")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        StrategicInt: Record "Strategic Initiative";
        QQuantity: Integer;
        Remainder: Integer;
        StrategyWorkplanLines: Record "Strategic Initiative";
}

