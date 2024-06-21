page 60018 "Roadworks Budget Ceilings"
{
    ApplicationArea = All;
    Caption = 'Roadworks Budget Ceilings';
    PageType = List;
    SourceTable = "Road Works Budget Ceilings";
    UsageCategory = Lists;
    CardPageId = "Road works budget Ceiling";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Doc Reference No"; Rec."Doc Reference No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Doc Reference No field.';
                }
                field("Allocated Amount"; Rec."Allocated Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allocated Amount field.';
                }
                field("Assign To"; Rec."Assign To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Assign To field.';
                }
                field("Assignment Remarks"; Rec."Assignment Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Assignment Remarks field.';
                }
                field("Budget Ceiling Amount"; Rec."Budget Ceiling Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Ceiling Amount field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Financier Code"; Rec."Financier Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Financier Code field.';
                }
                field("Financier Name"; Rec."Financier Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Financier Name field.';
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Funding Source Type field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Includes HQ"; Rec."Includes HQ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Includes HQ field.';
                }
            }
            
         
        }
    }
}
