#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72013 "BoQ Template Lines"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "BoQ Template Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Type; Type)
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies whether the line is for a general ledger account, item, fixed asset or item charge.';

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
                    TableRelation = "Option Lookup Buffer"."Option Caption" where("Lookup Type" = const(Purchases));
                    ToolTip = 'Specifies whether the line is for a general ledger account, item, fixed asset or item charge.';
                    Visible = IsFoundation;

                    trigger OnValidate()
                    begin
                        // TempOptionLookupBuffer.SetCurrentType(Type);
                        // if TempOptionLookupBuffer.AutoCompleteOption(TypeAsText, TempOptionLookupBuffer."lookup type"::Purchases) then
                        //     Validate(Type, TempOptionLookupBuffer.ID);
                        // TempOptionLookupBuffer.ValidateOption(TypeAsText);
                        // UpdateTypeText;
                        // TypeOnAfterValidate;
                    end;
                }
                field("No."; "No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of a general ledger account, item, resource, additional cost, or fixed asset, depending on the contents of the Type field.';

                    trigger OnValidate()
                    begin
                        if ApplicationAreaMgmtFacade.IsAdvancedEnabled then
                            exit;

                        if "No." = xRec."No." then
                            exit;

                        UpdateTypeText;
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    ToolTip = 'Specifies a description of the entry, which is based on the contents of the Type and No. fields.';

                    trigger OnValidate()
                    begin
                        if Description = xRec.Description then
                            exit;

                        if "No." = '' then
                            Type := Type::" ";
                        UpdateTypeText;
                    end;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = Suite;
                    Caption = 'Unit Of Measure';
                }
                field("Technology Code"; "Technology Code")
                {
                    ApplicationArea = Basic;
                }
                field("Technology Description"; "Technology Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Amount Excl. VAT"; "Amount Excl. VAT")
                {
                    ApplicationArea = Suite;
                    Caption = 'Planned Rate';
                    Visible = true;
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
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        ShowDimensions;
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
        ShowShortcutDimCode(ShortcutDimCode);
        UpdateTypeText;
    end;

    trigger OnInit()
    begin
        // TempOptionLookupBuffer.FillBuffer(TempOptionLookupBuffer."lookup type"::Purchases);
        // IsFoundation := ApplicationAreaMgmtFacade.IsFoundationEnabled;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if ApplicationAreaMgmtFacade.IsAdvancedEnabled then
            Type := xRec.Type;
        if ApplicationAreaMgmtFacade.IsFoundationEnabled then
            Type := Type::Item;
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
        TypeAsText := TempOptionLookupBuffer.FormatOption(RecRef.Field(FieldNo(Type)));
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

