#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57037 "Other Costs"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Other Costs";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Type of Expense"; Rec."Type of Expense")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Required For"; Rec."Required For")
                {
                    ApplicationArea = Basic;
                }
                field("Quantity Requ0ired"; Rec."Quantity Required")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code") { ApplicationArea = basic; }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No To Surrender"; Rec."Employee No To Surrender")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name To Surender"; Rec."Employee Name To Surender")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                }
                field("Job  Task"; Rec."Job  Task")
                {
                    ApplicationArea = Basic;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                     Visible =false;
                }
                field("Budgeted Amount";Rec."Budgeted Amount")
                {
                     ApplicationArea = Basic;
                }
                  field("Account Actual Spent";Rec."Account Actual Spent")
                {
                     ApplicationArea = Basic;
                }
                field("Committed Amount";Rec."Committed Amount")
                {
                     ApplicationArea = Basic;
                }
                field("Available Amount";Rec."Available Amount")
                {
                     ApplicationArea = Basic;
                }
                field("Line Amount (LCY)";Rec."Line Amount (LCY)")
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

#pragma implicitwith restore

