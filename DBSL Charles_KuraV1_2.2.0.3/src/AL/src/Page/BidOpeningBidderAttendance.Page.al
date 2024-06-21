#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75157 "Bid Opening Bidder Attendance"
{
    PageType = List;
    SourceTable = "Bid Opening Bidder Attendance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                
                field("Vendor No.";"Vendor No.")
            {
                ApplicationArea = Basic;
            }
                field("Vendor Name";"Vendor Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier Name';
                }
                field("Bidder Representative Name";"Bidder Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Designation";Designation)
                {
                    ApplicationArea = Basic;
                }
                field("Postal Address";"Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Email";"Representative Email")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Tel No";"Representative Tel No")
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

