/// <summary>
/// Page Email Reminder Header (ID 50056).
/// </summary>
page 50056 "Email Reminder Header"
{
    Caption = 'Email Reminder Header';
    PageType = Document;
    SourceTable = "Email Reminders Header";
    RefreshOnActivate = true;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
            }
            part(Recepients;"Email Reminder Recepients")
            {
                UpdatePropagation = Both;
                Caption = 'Email Recepients';
                SubPageLink = "Document No." = field("No.");
            }
            part("Email Reminder Lines"; "Email Reminders Lines")
            {
                UpdatePropagation = Both;
                Caption = 'Reminder Lines';
                SubPageLink = "Document No." = field("No.");
            }
        }
    }
}
