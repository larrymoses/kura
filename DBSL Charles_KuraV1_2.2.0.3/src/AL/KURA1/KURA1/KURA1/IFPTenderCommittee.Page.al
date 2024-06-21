#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75320 "IFP Tender Committee"
{
    ApplicationArea = Basic;
    CardPageID = "IFP Committee Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "IFS Tender Committee";
    SourceTableView = where("Document Type"=filter(IFP));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Type";"Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Appointment Effective Date";"Appointment Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointing Authority";"Appointing Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name";"Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region";"Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate";"Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department";"Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date";"Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time";"Created Time")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code";"IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
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

