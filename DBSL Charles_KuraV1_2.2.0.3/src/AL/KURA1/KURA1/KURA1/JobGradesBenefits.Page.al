#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69689 "Job Grades Benefits"
{
    PageType = List;
    SourceTable = "Scale Benefits";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Salary Scale";"Salary Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Pointer";"Salary Pointer")
                {
                    ApplicationArea = Basic;
                }
                field("ED Code";"ED Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("ED Description";"ED Description")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account";"G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary";"Basic Salary")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Job Grades Benefits")
            {
                ApplicationArea = Basic;
                RunObject = Page "Job Grades Benefits";
            }
        }
    }
}

