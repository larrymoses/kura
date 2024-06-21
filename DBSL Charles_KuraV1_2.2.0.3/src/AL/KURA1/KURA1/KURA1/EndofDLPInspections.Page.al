#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72579 "End of DLP Inspections"
{
    ApplicationArea = Basic;
    CardPageID = "End of DLP Inspection";
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Inspection Headersss";
    SourceTableView = where("Inspection Type"=filter("End of DLP Inspection"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No";"Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Type";"Inspection Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID";"Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Request No";"Contractor Request No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date";"Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No";"Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Committee No";"Committee No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date";"Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date";"Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("DLP Start Date";"DLP Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("DLP Period";"DLP Period")
                {
                    ApplicationArea = Basic;
                }
                field("DLP End Date";"DLP End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Tender Sum Inc Tax";"Awarded Tender Sum Inc Tax")
                {
                    ApplicationArea = Basic;
                }
                field("Payments To Date";"Payments To Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Committee Decision";"Committee Decision")
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

