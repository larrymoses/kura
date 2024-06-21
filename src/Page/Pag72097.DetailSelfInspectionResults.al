#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72097 "Detail Self Inspection Results"
{
    ApplicationArea = Basic;
    CardPageID = "Detail Self Inspection ResultC";
    PageType = List;
    SourceTable = "Detail Self Inspection Result";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Authority Code";"Road Authority Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Authority Name";"Road Authority Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Link Name";"Road Link Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Chainage";"Road Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Standard Service Level";"Standard Service Level")
                {
                    ApplicationArea = Basic;
                }
                field(Month;Month)
                {
                    ApplicationArea = Basic;
                }
                field(Year;Year)
                {
                    ApplicationArea = Basic;
                }
                field("Contract Month";"Contract Month")
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
                field("Road Class";"Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Inspected Chainage";"Inspected Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Subsection";"No. Of Subsection")
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

