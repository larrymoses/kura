#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72416 "Puchase Contract Signatories"
{
    CardPageID = "Purchase Contract Signatory";
    PageType = List;
    SourceTable = "Purchase Contract Signatory";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Signatory Type"; Rec."Signatory Type")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Signing Role"; Rec."Contract Signing Role")
                {
                    ApplicationArea = Basic;
                }
                field("Executed on behalf of"; Rec."Executed on behalf of")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Execution Date"; Rec."Execution Date")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Name"; Rec."Representative Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

