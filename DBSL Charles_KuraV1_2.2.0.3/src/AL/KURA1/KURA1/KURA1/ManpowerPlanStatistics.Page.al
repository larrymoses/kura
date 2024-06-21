#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69112 "Manpower Plan Statistics"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "ManPower Plan Task Lines";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Manpower Plan Code";"Manpower Plan Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Manpower Plan';
                    Editable = false;
                }
                field("Job Id";"Job Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Title";"Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Actual Active";"Actual Active")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                fixed(Control27)
                {
                    group(Quantities)
                    {
                        Caption = 'Quantities';
                        field("Planned Qty";"Planned Qty")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Planned Quantity';
                        }
                        field("Actual Qty";"Actual Qty")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Actual Quantity';
                        }
                        field("FillUp%";"FillUp%")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Filled Up %';
                        }
                        field(Available;Available)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Available %';
                        }
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        "Planned Qty":=0;
        "Actual Qty":=0;
        "FillUp%":=0;
        Available:=0;
        ManPowerPlanTaskLines.Reset;
        ManPowerPlanTaskLines.SetRange("Manpower Plan Code","Manpower Plan Code");
        ManPowerPlanTaskLines.SetRange("Job Id","Job Id");
        if ManPowerPlanTaskLines.FindSet then begin
        "Planned Qty":=ManPowerPlanTaskLines."Target No.";
          "Actual Qty":=ManPowerPlanTaskLines."Actual Recruited";
          if "Actual Qty">0 then begin
        Available:=(("Planned Qty"-"Actual Qty")/"Planned Qty")*100;
        "FillUp%":=100-Available;
        end else begin
          "FillUp%":=0;
          end
        end
    end;

    var
        "Planned Qty": Decimal;
        "Actual Qty": Decimal;
        "FillUp%": Decimal;
        Available: Decimal;
        ManPowerPlanTaskLines: Record "ManPower Plan Task Lines";
}

