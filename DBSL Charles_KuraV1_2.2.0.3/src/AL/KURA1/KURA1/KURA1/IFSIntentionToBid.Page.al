#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75133 "IFS Intention To Bid"
{
    Caption = 'Suppliers';
    DataCaptionFields = "Vendor No.";
    PageType = ListPart;
    SourceTable = "Standard Vendor Purchase Code";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a standard purchase code from the Standard Purchase Code table.';
                    Visible = false;
                }
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                    Editable = TRUE;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vendor No."; Rec."Supplier No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Supplier No.';
                    ToolTip = 'Specifies the number of the vendor to which the standard purchase code is assigned.';
                    Visible = true;

                }
                field("Supplier No."; Rec."Supplier No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Supplier No.';
                    ToolTip = 'Specifies the number of the vendor to which the standard purchase code is assigned.';
                    VISIBLE = false;
                }

                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier Name';
                    Editable = false;
                }
                field("Primary Email"; Rec."Primary Email")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }

                field("Supplier Type"; Rec."Supplier Type")
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

    procedure GetSelected(var StdVendPurchCode: Record "Standard Vendor Purchase Code")
    begin
        CurrPage.SetSelectionFilter(StdVendPurchCode);
    end;
}

#pragma implicitwith restore

