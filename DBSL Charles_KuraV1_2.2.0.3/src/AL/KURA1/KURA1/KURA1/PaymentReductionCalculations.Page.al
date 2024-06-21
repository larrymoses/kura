#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72103 "Payment Reduction Calculations"
{
    ApplicationArea = Basic;
    CardPageID = "Payment Reduction Calculationc";
    PageType = List;
    SourceTable = "Payment Reduction Calculation";
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
                field("Road/Link Name";"Road/Link Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class";"Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Chainage(Km)";"Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Length(Km)";"Length(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Statement Month";"Statement Month")
                {
                    ApplicationArea = Basic;
                }
                field(Year;Year)
                {
                    ApplicationArea = Basic;
                }
                field("Elapse Of Month";"Elapse Of Month")
                {
                    ApplicationArea = Basic;
                }
                field("Standard Service Level";"Standard Service Level")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Period(M)";"Contract Period(M)")
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
                field("Due Amount Of the Month";"Due Amount Of the Month")
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

