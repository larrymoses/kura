#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69009 "Brackets Table"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Bracket Tablesx";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bracket Code";"Bracket Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bracket Description";"Bracket Description")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Starting Date";"Effective Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Effective End Date";"Effective End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Annual;Annual)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008;Notes)
            {
                Visible = false;
            }
            systempart(Control1000000009;MyNotes)
            {
                Visible = false;
            }
            systempart(Control1000000010;Links)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Brackets Table")
            {
                ApplicationArea = Basic;
                Caption = '&Brackets Table';
                Ellipsis = true;
                Image = "Table";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Tax Table";
                RunPageLink = "Table Code"=field("Bracket Code");
            }
        }
    }
}

