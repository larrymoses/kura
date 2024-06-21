#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57125 "Data Imprest Lines"
{
    PageType = ListPart;
    SourceTable = "Imprest Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Advance Type";"Advance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type";"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name";"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Purpose;Purpose)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Project;Project)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Task No.";"Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Spent";"Actual Spent")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt No.";"Receipt No.")
                {
                    ApplicationArea = Basic;
                }
                field("Cash Receipt Amount";"Cash Receipt Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Remaining Amount";"Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }
}

