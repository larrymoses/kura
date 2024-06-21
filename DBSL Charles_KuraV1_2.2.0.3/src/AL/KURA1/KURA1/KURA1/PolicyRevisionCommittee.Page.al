#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80190 "Policy Revision Committee"
{
    PageType = List;
    SourceTable = "Policy Revision Committee";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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

