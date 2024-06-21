#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75229 "BoQ Item Categories"
{
    ApplicationArea = Basic,Suite;
    Caption = 'BoQ Item Categories';
    CardPageID = "Item Category Card";
    InsertAllowed = false;
    PageType = List;
    RefreshOnActivate = true;
    ShowFilter = false;
    SourceTable = "Item Category";
    SourceTableView = sorting("Presentation Order")
                      where("Bill Item Group"=const(true));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                IndentationColumn = Indentation;
                IndentationControls = "Code";
                ShowAsTree = true;
                field("Code";Code)
                {
                    ApplicationArea = Basic,Suite;
                    StyleExpr = StyleTxt;
                    ToolTip = 'Specifies the code for the item category.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update(false);
                        CurrPage.ItemAttributesFactbox.Page.LoadCategoryAttributesData(Code);
                    end;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic,Suite;
                    ToolTip = 'Specifies a description of the item category.';
                }
            }
        }
        area(factboxes)
        {
            part(ItemAttributesFactbox;"Item Attributes Factbox")
            {
                ApplicationArea = Basic,Suite;
                Caption = 'Attributes';
            }
        }
    }

    actions
    {
        area(creation)
        {
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        StyleTxt := GetStyleText;
        CurrPage.ItemAttributesFactbox.Page.LoadCategoryAttributesData(Code);
    end;

    trigger OnAfterGetRecord()
    begin
        StyleTxt := GetStyleText;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        StyleTxt := GetStyleText;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        StyleTxt := GetStyleText;
    end;

    trigger OnOpenPage()
    var
        ItemCategoryManagement: Codeunit "Item Category Management";
    begin
        ItemCategoryManagement.UpdatePresentationOrder;
    end;

    var
        StyleTxt: Text;

    procedure GetSelectionFilter(): Text
    var
        ItemCategory: Record "Item Category";
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(ItemCategory);
        exit(SelectionFilterManagement.GetSelectionFilterForItemCategory(ItemCategory));
    end;

    procedure SetSelection(var ItemCategory: Record "Item Category")
    begin
        CurrPage.SetSelectionFilter(ItemCategory);
    end;
}

