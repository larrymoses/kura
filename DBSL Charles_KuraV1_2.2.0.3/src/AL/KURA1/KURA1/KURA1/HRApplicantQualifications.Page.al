#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69252 "HR Applicant Qualifications"
{
    Caption = 'Applicant Qualifications';
    PageType = List;
    SaveValues = true;
    ShowFilter = true;
    SourceTable = "HR Applicant Qualifications";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Qualification Description";"Qualification Description")
                {
                    ApplicationArea = Basic;
                }
                field("From Date";"From Date")
                {
                    ApplicationArea = Basic;
                }
                field("To Date";"To Date")
                {
                    ApplicationArea = Basic;
                }
                field("Institution/Company";"Institution/Company")
                {
                    ApplicationArea = Basic;
                }
                field("Course Grade";"Course Grade")
                {
                    ApplicationArea = Basic;
                    Caption = 'Award';
                }
                field("Date of Renewal";"Date of Renewal")
                {
                    ApplicationArea = Basic;
                }
                field("Membership Registration No";"Membership Registration No")
                {
                    ApplicationArea = Basic;
                }
                field(Specialization;Specialization)
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

