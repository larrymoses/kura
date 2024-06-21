#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59085 "Registry File Creation"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Registry File Creation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("System No";"System No")
                {
                    ApplicationArea = Basic;
                    Caption = 'File No:';
                }
                field("File No";"File No")
                {
                    ApplicationArea = Basic;
                }
                field("File Type";"File Type")
                {
                    ApplicationArea = Basic;
                }
                field("File Name";"File Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'File Name Description';
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date";"Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Location;Location)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Created By":= UserId;
        "Creation Date":= Today;
    end;
}

