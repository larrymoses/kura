#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69056 "Hardship Allowance Setup"
{
    ApplicationArea = Basic;
    Caption = 'Dimension Values';
    DataCaptionFields = "Dimension Code";
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Dimension Value";
    SourceTableView = where("Dimension Code"=const('REGION'));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                IndentationColumn = NameIndent;
                IndentationControls = Name;
                field("Code";Code)
                {
                    ApplicationArea = Dimensions;
                    Style = Strong;
                    StyleExpr = Emphasize;
                    ToolTip = 'Specifies the code for the dimension value.';
                }
                field(Name;Name)
                {
                    ApplicationArea = Dimensions;
                    Style = Strong;
                    StyleExpr = Emphasize;
                    ToolTip = 'Specifies a descriptive name for the dimension value.';
                }
                field("Hardship Area";"Hardship Area")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if "Hardship Area" = true then
                          "Hardship Type" := "hardship type"::Extreme
                        else
                          "Hardship Type" := "hardship type"::" ";
                    end;
                }
                field("Hardship Type";"Hardship Type")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if "Hardship Type" = "hardship type"::" " then
                          "Hardship Area" := false
                        else
                          "Hardship Area" := true;
                    end;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Indent Dimension Values")
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Indent Dimension Values';
                    Image = Indent;
                    RunObject = Codeunit "Dimension Value-Indent";
                    RunPageOnRec = true;
                    ToolTip = 'Indent dimension values between a Begin-Total and the matching End-Total one level to make the list easier to read.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        NameIndent := 0;
        FormatLine;
    end;

    trigger OnOpenPage()
    var
        DimensionCode: Code[20];
    begin
        if GetFilter("Dimension Code") <> '' then
          DimensionCode := GetRangeMin("Dimension Code");
        if DimensionCode <> '' then begin
          FilterGroup(2);
          SetRange("Dimension Code",DimensionCode);
          FilterGroup(0);
        end;
    end;

    var
        [InDataSet]
        Emphasize: Boolean;
        [InDataSet]
        NameIndent: Integer;

    local procedure FormatLine()
    begin
        Emphasize := "Dimension Value Type" <> "dimension value type"::Standard;
        NameIndent := Indentation;
    end;
}

