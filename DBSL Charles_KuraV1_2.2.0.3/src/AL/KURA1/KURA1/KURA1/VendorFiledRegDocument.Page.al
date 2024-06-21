#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75168 "Vendor Filed Reg Document"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "Vendor Filed Reg Document";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No";"Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Document Type ID";"Procurement Document Type ID")
                {
                    ApplicationArea = Basic;
                }
                field("Date Filed";"Date Filed")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("File Name";"File Name")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentLink;DocumentLink)
                {
                    ApplicationArea = Basic;
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
                field("Procurement Process";"Procurement Process")
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

