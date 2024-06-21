#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69034 "Employee Tax Exemption Lines"
{
    PageType = ListPart;
    SourceTable = "Employee Tax Exemption";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Exempted";"Amount Exempted")
                {
                    ApplicationArea = Basic;
                }
                field("Certificate No";"Certificate No")
                {
                    ApplicationArea = Basic;
                }
                field(StartDate;StartDate)
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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

