#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80047 "Workplan Line"
{

    fields
    {
        field(1; "Workplan No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Initiative No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Primary Initiative/Activity"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Goal ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Workplan Goal"."Goal ID";
        }
        field(5; "Initiative Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Activity,Project';
            OptionMembers = Activity,Project;
        }
        field(6; "Task Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(7; Indentation; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Totaling; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Progress; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Not started,In progress,Completed';
            OptionMembers = "Not started","In progress",Completed;
        }
        field(10; "%Completed"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Priority Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Urgent,Important,Medium,Low';
            OptionMembers = Urgent,Important,Medium,Low;
        }
        field(12; "Strategy Plan ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Year Reporting Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Outcome Perfomance Indicator"; Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "KPI Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Lagging,Leading';
            OptionMembers = Lagging,Leading;
        }
        field(20; "KPI Entry Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Absolute No,Percentage';
            OptionMembers = "Absolute No",Percentage;
        }
        field(21; "Imported Annual Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Imported Ann. Budget Estimate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Q1 Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Q1 Self-Review Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Q1 Actual Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Q1 Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Q1 Actual Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Q2 Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Q2 Self-Review Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Q2 Actual Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Q2 Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Q2 Actual Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Q3 Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Q3 Self-Review Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Q3 Actual Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Q3 Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Q3 Actual Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Q4 Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Q4 Actual Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Q4 Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Q4 Actual Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Global Dimension 1 Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Global Dimension 2 Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Planning Date Filter"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Workplan No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

