
Page 57054 "Tariff Codes1"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Tariff Codes1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Transaction";Rec."Nature of Transaction")
                {
                    ApplicationArea = Basic;
                }
                field(Directors;Directors)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000009;Outlook)
            {
            }
            systempart(Control1000000010;Notes)
            {
            }
            systempart(Control1000000011;MyNotes)
            {
            }
            systempart(Control1000000012;Links)
            {
            }
        }
    }

    actions
    {
    }
}



