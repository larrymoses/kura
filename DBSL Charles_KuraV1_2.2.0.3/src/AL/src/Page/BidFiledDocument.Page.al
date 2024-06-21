#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75153 "Bid Filed Document"
{
    Editable = false;
    PageType = List;
    SourceTable = "Bid Filed Document";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Date Filed";"Date Filed")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Document Type ID";"Procurement Document Type ID")
                {
                    ApplicationArea = Basic;
                }
                field("File Name";"File Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'File Name';
                }
                field("Certificate No.";"Certificate No.")
                {
                    ApplicationArea = Basic;
                }
                field("Issue Date";"Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Date";"Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Link";"Document Link")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = URL;
                }
            }
        }
    }

    actions
    {
    }
}

