#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69690 "Job Grade Pointers"
{
    PageType = ListPart;
    SourceTable = "Salary Pointers";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Salary Pointer";"Salary Pointer")
                {
                    ApplicationArea = Basic;
                }
                field("Pointer Int";"Pointer Int")
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
                Image = BinLedger;
                RunObject = Page "Job Grades Benefits";
                RunPageLink = "Salary Scale"=field("Salary Scale"),
                              "Salary Pointer"=field("Salary Pointer");
            }
        }
    }
}

