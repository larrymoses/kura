#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75191 "Vendor Reinstatement Line"
{
    PageType = ListPart;
    SourceTable = "Vendor Debarment Voucher Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Firm Name";"Firm Name")
                {
                    ApplicationArea = Basic;
                }
                field("Debarment Reason Code";"Debarment Reason Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason Code';
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Apply To Entry No.";"Apply To Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Reinstatement Date";"Reinstatement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Registration (PIN) No.";"Tax Registration (PIN) No.")
                {
                    ApplicationArea = Basic;
                }
                field("Incorporation/Reg No.";"Incorporation/Reg No.")
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2";"Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code";"Country/Region Code")
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

