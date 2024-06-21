#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69119 "Applicant Referees"
{
    PageType = ListPart;
    SourceTable = "Applicant Referees";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Names;Names)
                {
                    ApplicationArea = Basic;
                }
                field(Occupation;Occupation)
                {
                    ApplicationArea = Basic;
                }
                field(Institution;Institution)
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No";"Telephone No")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail";"E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code";"Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field("Period Known";"Period Known")
                {
                    ApplicationArea = Basic;
                }
                field("Job ID";"Job ID")
                {
                    ApplicationArea = Basic;
                }
                field(RefereeEmail;RefereeEmail)
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

