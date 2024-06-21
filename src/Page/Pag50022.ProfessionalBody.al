/// <summary>
/// Page Professional Body (ID 50022).
/// </summary>
page 50022 "Professional Body"
{
    Caption = 'Professional Body';
    PageType = Document;
    SourceTable = "Professional Bodies";
    RefreshOnActivate = true;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name 2 field.';
                    Importance = Additional;
                }
                field("No. of Members"; Rec."No. of Members")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. of Members field.';
                }
                field("Due Date";Rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Fees Payable";Rec."Total Fees Payable")
                {
                    ApplicationArea = Basic;
                }
                field("Total CPD Points Required";Rec."Total CPD Points Required")
                {
                    ApplicationArea = Basic;
                    visible = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.';
                    Importance = Additional;
                }
            }
            part("Members"; "ProfessionalBodyMembers")
            {
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = All;
                UpdatePropagation = Both;
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }
}
