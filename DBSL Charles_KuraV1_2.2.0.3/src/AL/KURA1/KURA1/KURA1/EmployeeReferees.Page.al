#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69273 "Employee Referees"
{
    PageType = List;
    SourceTable = "Hr Proffessional Body";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No"; "Application No")
                {
                    ApplicationArea = Basic;
                }
                field("Job ID"; "Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Membership Type"; "Membership Type")
                {
                    ApplicationArea = Basic;
                }
                field("Membership No"; "Membership No")
                {
                    ApplicationArea = Basic;
                }
                field(Institution; Institution)
                {
                    ApplicationArea = Basic;
                }
                // field("Telephone No";"Telephone No")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("E-Mail";"E-Mail")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Employee No"; "Employee No")
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

