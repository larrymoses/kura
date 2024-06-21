#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57150 "Standing Imprest Lines"
{
    PageType = ListPart;
    SourceTable = "PV Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(AccountType;Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(TransferTo;Rec."Account No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer To';
                }
                field(AccountName;Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description Of Works/Service';
                    ShowMandatory = true;
                }
                field(Amount;Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field(ShortcutDimension1Code;Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(ShortcutDimension2Code;Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(FundingSource;Rec."Shortcut Dimesnion 4 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Source';
                }
            }
        }
    }

    actions
    {
    }
}
