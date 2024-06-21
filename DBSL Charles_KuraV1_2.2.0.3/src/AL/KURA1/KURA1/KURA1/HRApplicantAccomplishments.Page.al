#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59119 "HR Applicant Accomplishments"
{
    PageType = List;
    SourceTable = "HR Applications Accomplishment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("Job Application No";"Job Application No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Indicator Code";"Job Indicator Code")
                {
                    ApplicationArea = Basic;
                }
                field("Indicator Description";"Indicator Description")
                {
                    ApplicationArea = Basic;
                }
                field(Number;Number)
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments";"Additional Comments")
                {
                    ApplicationArea = Basic;
                }
                field("Job ID";"Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Id Number";"Id Number")
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

