#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72194 "Road Program G/L budget"
{

    fields
    {
        field(1; "Road Work Program"; Code[10])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Road Work Program".Code;

            trigger OnValidate()
            begin
                //       RoadProgam.Reset;
                //  RoadProgam.SetRange(Code,"Road Work Program");
                //   if RoadProgam.FindSet then
                //       "G/L Budget ID" := RoadProgam."Financial Budget ID";
            end;
        }
        field(2; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No." where("Account Type" = const(Posting));
        }
        field(3; "Budget Name"; Code[10])
        {
            Caption = 'Budget Name';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(4; "Road Project Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Studies and Surveys,Construction Works,Maitenance Works';
            OptionMembers = ,"Studies and Surveys","Construction Works","Maitenance Works";
        }
        field(5; "Budgeted Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("G/L Budget Entry".Amount where("G/L Account No." = field("G/L Account No."),
                                                               "Budget Name" = field("G/L Budget ID")));
            Caption = 'Budgeted Amount';
            FieldClass = FlowField;
        }
        field(6; "G/L Budget ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name".Name;
        }
    }

    keys
    {
        key(Key1; "Road Work Program", "G/L Account No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
    //RoadProgam: Record "Road Work Program";
}

