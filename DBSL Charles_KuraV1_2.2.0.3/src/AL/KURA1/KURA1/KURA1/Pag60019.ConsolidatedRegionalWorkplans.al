
page 60019 "Consolidated RegionalWorkplans"
{
    Caption = 'Consolidated Regional Workplan';
    CardPageID = "Consolidated Regional Workplan";
    InsertAllowed = false;
    PageType = List;
     Editable =false;
    SourceTable = "RAM Workplan Header";
    SourceTableView = WHERE("Workplan Type" = CONST(Consolidated)//,
                            //Consolidated = CONST(true),
                           // "Submission Status" = FILTER(Submitted)
                            );

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = All;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = All;
                }
                field("Budget Ceiling Amount"; Rec."Budget Ceiling Amount")
                {
                    ApplicationArea = All;
                }
                field("Total Workplan Amount"; Rec."Total Workplan Amount")
                {
                    ApplicationArea = All;
                }
                field("No of Projects"; Rec."No of Projects")
                {
                    ApplicationArea = All;
                }
                field("Submission Status"; Rec."Submission Status")
                {
                    ApplicationArea = All;
                }
                field(Consolidated; Rec.Consolidated)
                {
                    ApplicationArea = All;
                }
                field("Workplan Type"; Rec."Workplan Type")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}



