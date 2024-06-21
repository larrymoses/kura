#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72270 "WEP Equipment Repair Plan"
{
    PageType = List;
    SourceTable = "WEP Equipment Repair Plan";
    SourceTableView = where("Document Type"=filter("Work Execution Programme"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No.";"Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment No.";"Equipment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Entry  No";"Entry  No")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Description";"Equipment Description")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Type";"Maintenance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Scheduled Date";"Scheduled Date")
                {
                    ApplicationArea = Basic;
                }
                field("To-do Description";"To-do Description")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Staff No.";"Responsible Staff No.")
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

