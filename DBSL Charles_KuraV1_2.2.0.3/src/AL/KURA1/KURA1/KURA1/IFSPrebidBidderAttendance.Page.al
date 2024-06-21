#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75137 "IFS Prebid Bidder Attendance"
{
    PageType = List;
    SourceTable = "IFS Prebid Bidder Attendance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Prebid Register ID";"Prebid Register ID")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code";"IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder No";"Bidder No")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Name";"Representative Name")
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
                field("Date/Time Notified";"Date/Time Notified")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Designation;Designation)
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

