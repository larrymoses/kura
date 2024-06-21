page 99519 "Work Plan Bill Items"
{
    ApplicationArea = All;
    Caption = 'Work Plan Bill Items';
    PageType = List;
    SourceTable = "Work Plan Bill Item";
    UsageCategory = Lists;
    PopulateAllFields = true;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Town Code"; Rec."Town Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                    Editable = PlanEditable;
                }
                field(Technology_Type; Rec."Technology Type")
                {
                    ApplicationArea = All;
                    Editable = PlanEditable;
                }
                field("Bill Item Category Code"; Rec."Bill Item Category Code")
                {
                    ApplicationArea = All;
                    Editable = PlanEditable;
                    ToolTip = 'Specifies the value of the Bill Item Category Code field.';
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = All;
                    Editable = PlanEditable;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Editable = PlanEditable;
                }
                field("BoQ Template Code"; Rec."BoQ Template Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                    Editable = PlanEditable;
                    ToolTip = 'Specifies the value of the BoQ Template Code field.';
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = PlanEditable;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    Editable = PlanEditable;
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                    Editable = PlanEditable;
                    ToolTip = 'Specifies the value of the Funding Source Code field.';
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                    Editable = PlanEditable;
                    ToolTip = 'Specifies the value of the Funding Source Type field.';
                }
                field("Planned Quantity"; Rec."Planned Quantity")
                {
                    ApplicationArea = All;
                    Editable = PlanEditable;
                   
                }
                field("Engineer's Rate (Unit Cost)"; Rec."Engineer's Rate (Unit Cost)")
                {
                    ApplicationArea = All;
                    Editable = PlanEditable;
                }
                field("Planned Rate (Unit Cost)"; Rec."Planned Rate (Unit Cost)")
                {
                    ApplicationArea = All;
                     Visible =false;
                    Editable = PlanEditable;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Editable = PlanEditable;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Editable = PlanEditable;
                }
                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = All;
                    Visible =false;
                    Editable = PlanEditable;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = All;
                     Visible =false;
                    Editable = PlanEditable;
                }

                field("Line Amount Excl. VAT"; Rec."Line Amount Excl. VAT")
                {
                    ApplicationArea = All;
                    Editable = PlanEditable;
                    ToolTip = 'Specifies the value of the Line Amount Excl. VAT field.';
                }
                field("Line Amount Incl. VAT"; Rec."Line Amount Incl. VAT")
                {
                    ApplicationArea = All;
                    Editable = PlanEditable;
                    ToolTip = 'Specifies the value of the Line Amount Incl. VAT field.';
                }
                field("Line Amount Inc VAT(LCY)"; Rec."Line Amount Inc VAT(LCY)")
                {
                    ApplicationArea = All;
                    Editable = PlanEditable;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        PlanEditable := false;
        //if Rec."Workplan Type" = Rec."Workplan Type"::Town then
        PlanEditable := true;
    end;

    var
        PlanEditable: Boolean;
}
