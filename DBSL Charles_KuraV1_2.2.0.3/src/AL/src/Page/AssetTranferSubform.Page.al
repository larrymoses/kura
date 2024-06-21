#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 90131 "Asset Tranfer Subform"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Standard Sales Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies whether the line is for a general ledger account, item, resource, fixed asset or item charge.';

                    trigger OnValidate()
                    begin
                        TypeOnAfterValidate;
                    end;
                }
                field(FilteredTypeField; TypeAsText)
                {
                    ApplicationArea = Suite;
                    Caption = 'Type';
                    Editable = CurrPageIsEditable;
                    LookupPageID = "Option Lookup List";
                    TableRelation = "Option Lookup Buffer"."Option Caption" where("Lookup Type" = const(Sales));
                    ToolTip = 'Specifies whether the line is for a general ledger account, item, fixed asset or item charge.';
                    Visible = IsFoundation;

                    trigger OnValidate()
                    begin
                        TempOptionLookupBuffer.SetCurrentType(Rec.Type);
                        if TempOptionLookupBuffer.AutoCompleteOption(TypeAsText, TempOptionLookupBuffer."lookup type"::Sales) then
                            Rec.Validate(Rec.Type, TempOptionLookupBuffer.ID);
                        TempOptionLookupBuffer.ValidateOption(TypeAsText);
                        UpdateTypeText;
                        TypeOnAfterValidate;
                    end;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of a general ledger account, item, resource, additional cost, or fixed asset, depending on the contents of the Type field.';

                    trigger OnValidate()
                    begin
                        if not ApplicationAreaMgmtFacade.IsFoundationEnabled then
                            exit;

                        if Rec."No." = xRec."No." then
                            exit;

                        UpdateTypeText;
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    ToolTip = 'Specifies a description of the entry, which is based on the contents of the Type and No. fields.';

                    trigger OnValidate()
                    begin
                        if Rec.Description = xRec.Description then
                            exit;

                        if Rec."No." = '' then
                            Rec.Type := Rec.Type::" ";
                        UpdateTypeText;
                    end;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    ToolTip = 'Specifies the number of units of the item on the line.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field("Disposal Type"; "Disposal Type")
                {
                    ApplicationArea = Basic;
                }
                field("Method of Disposal"; "Method of Disposal")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Amount Excl. VAT"; Rec."Amount Excl. VAT")
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    ToolTip = 'Specifies the net amount for the standard sales line. This field only applies to lines of type G/L Account and Charge (Item).';
                }
                field("Sell to Customer No"; "Sell to Customer No")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Name"; "Customer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Unit Cost(LCY)"; "Actual Unit Cost(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Total Cost(LCY)"; "Actual Total Cost(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Trade-in Asset No"; "Trade-in Asset No")
                {
                    ApplicationArea = Basic;
                }
                field("Trade-in Asset Description"; "Trade-in Asset Description")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPageIsEditable := CurrPage.Editable;
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
        UpdateTypeText;
    end;

    trigger OnInit()
    begin
        TempOptionLookupBuffer.FillBuffer(TempOptionLookupBuffer."lookup type"::Sales);
        IsFoundation := ApplicationAreaMgmtFacade.IsFoundationEnabled;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if ApplicationAreaMgmtFacade.IsAdvancedEnabled then
            Rec.Type := xRec.Type;

        if ApplicationAreaMgmtFacade.IsFoundationEnabled then
            Rec.Type := Rec.Type::Item;
        UpdateTypeText;

        Clear(ShortcutDimCode);
    end;

    trigger OnOpenPage()
    begin
        SetDimensionsVisibility;
    end;

    var
        TempOptionLookupBuffer: Record "Option Lookup Buffer" temporary;
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
        ShortcutDimCode: array[8] of Code[20];
        TypeAsText: Text[30];
        IsFoundation: Boolean;
        CurrPageIsEditable: Boolean;
        DimVisible1: Boolean;
        DimVisible2: Boolean;
        DimVisible3: Boolean;
        DimVisible4: Boolean;
        DimVisible5: Boolean;
        DimVisible6: Boolean;
        DimVisible7: Boolean;
        DimVisible8: Boolean;

    local procedure TypeOnAfterValidate()
    begin
        Clear(ShortcutDimCode);
    end;

    local procedure UpdateTypeText()
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Rec);
        TypeAsText := TempOptionLookupBuffer.FormatOption(RecRef.Field(Rec.FieldNo(Rec.Type)));
    end;

    local procedure SetDimensionsVisibility()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimVisible1 := false;
        DimVisible2 := false;
        DimVisible3 := false;
        DimVisible4 := false;
        DimVisible5 := false;
        DimVisible6 := false;
        DimVisible7 := false;
        DimVisible8 := false;

        DimMgt.UseShortcutDims(
          DimVisible1, DimVisible2, DimVisible3, DimVisible4, DimVisible5, DimVisible6, DimVisible7, DimVisible8);

        Clear(DimMgt);
    end;
}
