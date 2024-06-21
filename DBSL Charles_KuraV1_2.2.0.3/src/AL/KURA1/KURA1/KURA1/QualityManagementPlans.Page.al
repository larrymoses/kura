#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72543 "Quality Management Plans"
{
    ApplicationArea = Basic;
    CardPageID = "Quality Management Plan";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "QM Plan Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID";"Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID";"Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Mission";"Primary Mission")
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
                field("Planning Start Date";"Planning Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planning End Date";"Planning End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time";"Created Date/Time")
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
                field("Works Start Chainage";"Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage";"Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Self -Inspections";"No. of Self -Inspections")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Adhoc Inspections";"No. of Adhoc Inspections")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Formal Inspections";"No. of Formal Inspections")
                {
                    ApplicationArea = Basic;
                }
                field("No. of TakeOver Inspections";"No. of TakeOver Inspections")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Post DLP Inspections";"No. of Post DLP Inspections")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Open Corr Orders Issued";"No. of Open Corr Orders Issued")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Closed Correctiv Orders";"No. of Closed Correctiv Orders")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager/Engineer";"Project Manager/Engineer")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID";"Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID";"Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID";"Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No.";"Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name";"Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Link Name";"Link Name")
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

