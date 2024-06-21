#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69048 "Salary Scale"
{
    PageType = List;
    SourceTable = "Salary Mapping";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Rank;Rank)
                {
                    ApplicationArea = Basic;
                }
                field("Profit Centre";"Profit Centre")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary";"Basic Salary")
                {
                    ApplicationArea = Basic;
                }
                field("House Allowance";"House Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Uniform Cleaning Allowance";"Uniform Cleaning Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Allowance";"Responsibility Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Meal Allowance";"Meal Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Night Allowance";"Night Allowance")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000011;Notes)
            {
            }
            systempart(Control1000000012;MyNotes)
            {
            }
            systempart(Control1000000013;Links)
            {
            }
        }
    }

    actions
    {
    }
}

