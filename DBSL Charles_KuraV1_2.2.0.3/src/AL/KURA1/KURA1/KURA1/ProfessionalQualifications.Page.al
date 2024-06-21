#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69135 "Professional Qualifications"
{
    PageType = ListPart;
    SourceTable = "Applicant Background";
    SourceTableView = where(Type=filter("Professional Qualification"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("From Date";"From Date")
                {
                    ApplicationArea = Basic;
                }
                field("To Date";"To Date")
                {
                    ApplicationArea = Basic;
                }
                field(Institution;Institution)
                {
                    ApplicationArea = Basic;
                }
                field(Attainment;Attainment)
                {
                    ApplicationArea = Basic;
                }
                field(Specialization;Specialization)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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
