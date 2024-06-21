#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72597 "Subcontractor Requests"
{
    ApplicationArea = Basic;
    CardPageID = "Subcontractor Request";
    PageType = List;
    SourceTable = "Subcontracting Header";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime";"Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Project Code";"Project Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Main Contractor No.";"Main Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Main Contractor Name";"Main Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Subcontractor No";"Subcontractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Subcontractor Name";"Subcontractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date Subcontracted";"Date Subcontracted")
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

