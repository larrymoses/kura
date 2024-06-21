#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80173 "Policy Committee Member"
{
    PageType = List;
    SourceTable = "Policy Committee Member";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Policy ID";"Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Committee Type";"Policy Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Resource No.";"Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Role;Role)
                {
                    ApplicationArea = Basic;
                }
                field("Tenure Start Date";"Tenure Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tenure End Date";"Tenure End Date")
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

