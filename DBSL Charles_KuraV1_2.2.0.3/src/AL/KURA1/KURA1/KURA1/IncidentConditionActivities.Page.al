#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72088 "Incident Condition& Activities"
{
    ApplicationArea = Basic;
    CardPageID = "Incident Condition&Activity C";
    PageType = List;
    SourceTable = "Incident Condition & Activity";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Incident No";"Incident No")
                {
                    ApplicationArea = Basic;
                }
                field("Road Authority";"Road Authority")
                {
                    ApplicationArea = Basic;
                }
                field(Contractor;Contractor)
                {
                    ApplicationArea = Basic;
                }
                field(Project;Project)
                {
                    ApplicationArea = Basic;
                }
                field("Road Name/Chainage";"Road Name/Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class";"Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Inspected By";"Inspected By")
                {
                    ApplicationArea = Basic;
                }
                field("Standard Service Level";"Standard Service Level")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
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

