#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69600 "Positions"
{
    ApplicationArea = Basic;
    CardPageID = "Position Card";
    Editable = true;
    PageType = List;
    SourceTable = "Company Positions";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Position ID"; "Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; "Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Directly Reports To"; "Directly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Indirectly Reports To"; "Indirectly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary/Job Purpose"; "Executive Summary/Job Purpose")
                {
                    ApplicationArea = Basic;
                }
                field("Designation Group"; "Designation Group")
                {
                    ApplicationArea = Basic;
                }
                field("Job Grade ID"; "Job Grade ID")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Appointment Authority"; "Overall Appointment Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Seniority Level"; "Seniority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Default Terms of Service"; "Default Terms of Service")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type"; "Employment Type")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Academic Qualification"; "Minimum Academic Qualification")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Work Experience"; "Minimum Work Experience")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Mngmnt Experience"; "Minimum Mngmnt Experience")
                {
                    ApplicationArea = Basic;
                }
                field("Default Probation Period"; "Default Probation Period")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control21; Outlook)
            {
            }
            systempart(Control22; Notes)
            {
            }
            systempart(Control23; MyNotes)
            {
            }
            systempart(Control24; Links)
            {
            }
        }
    }

    actions
    {
    }
}

