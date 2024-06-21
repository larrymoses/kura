#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72282 "Measurement & Payment Line"
{
    PageType = ListPart;
    SourceTable = "Measurement & Payment Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Category Code";"Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                }
                field("Measurement Type";"Measurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Linear/Unit Quantity";"Linear/Unit Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Length (m)";"Length (m)")
                {
                    ApplicationArea = Basic;
                }
                field("Width (m)";"Width (m)")
                {
                    ApplicationArea = Basic;
                }
                field("Height/Depth (m)";"Height/Depth (m)")
                {
                    ApplicationArea = Basic;
                }
                field("Measured Quantity";"Measured Quantity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Cost (LCY)";"Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Measured Amount';
                    Editable = false;
                }
                field("Contract Quantity";"Contract Quantity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Direct Unit Cost (LCY)";"Direct Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Technology Type";"Technology Type")
                {
                    ApplicationArea = Basic;
                }
                field("Works Start Chainage";"Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage";"Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Previous Measured Quantity";"Previous Measured Quantity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Previous Certificate Amount";"Previous Certificate Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        FnSetPageVisibility;
    end;

    trigger OnInit()
    begin
        FnSetPageVisibility;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        FnSetPageVisibility;
    end;

    trigger OnOpenPage()
    begin
        FnSetPageVisibility;
    end;

    var
        LengthVisible: Boolean;
        WidthVisible: Boolean;
        HeightVisible: Boolean;
        MeasuredQtyVisible: Boolean;
        Linear_UnitQty: Boolean;

    local procedure FnSetPageVisibility()
    begin
        if "Measurement Type"="measurement type"::"Linear/Unit" then begin
            Linear_UnitQty:=true;
            LengthVisible:=false;
            WidthVisible:=false;
            HeightVisible:=false;
          end;

        if "Measurement Type" = "measurement type"::Areal then begin
            Linear_UnitQty:=false;
            LengthVisible:=true;
            WidthVisible:=true;
            HeightVisible:=false;
        end;

        if "Measurement Type" = "measurement type"::Volumetric then begin
            Linear_UnitQty:=false;
            LengthVisible:=true;
            WidthVisible:=true;
            HeightVisible:=true;
        end;
    end;
}

