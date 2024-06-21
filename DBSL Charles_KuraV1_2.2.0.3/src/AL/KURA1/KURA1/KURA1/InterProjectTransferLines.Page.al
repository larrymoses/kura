#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65145 "Inter-Project Transfer Lines"
{
    PageType = ListPart;
    SourceTable = "Inter-Project Transfer Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transfer-From Job No";"Transfer-From Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer-From Task No";"Transfer-From Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Name";"Job Task Name")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer-From Expense G/L A/C";"Transfer-From Expense G/L A/C")
                {
                    ApplicationArea = Basic;
                }
                field("Expensing Description";"Expensing Description")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer Line Amount";"Transfer Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer Line Amount LCY";"Transfer Line Amount LCY")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Employee No";"Responsible Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Employee Name";"Responsible Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Manager";"Project Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Job Available Budget (LCY)";"Job Available Budget (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Commitments;Commitments)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task Remaining Amount";"Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

