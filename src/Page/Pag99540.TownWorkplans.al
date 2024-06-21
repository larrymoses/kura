page 99540 "Town Workplans"
{
    ApplicationArea = All;
    Caption = 'Urban Area Workplans';
    PageType = List;
    SourceTable = "RAM Workplan Header";
    UsageCategory = Lists;
    InsertAllowed = false;
    CardPageId= "Town Workplan Card";
      SourceTableView = WHERE("Workplan Type" = CONST(Town),
                            Consolidated = CONST(false)
                           // ,"Submission Status" = FILTER(Draft)
                            );
    
    layout
    {
        area(content)
        {
            repeater(General)
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
                field("Shortcut Dimension 5 Code";Rec."Shortcut Dimension 5 Code")
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
}
