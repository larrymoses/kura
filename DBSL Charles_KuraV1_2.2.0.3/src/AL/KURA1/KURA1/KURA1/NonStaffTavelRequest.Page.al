
Page 59120 "Non Staff Tavel Request"
{
    PageType = ListPart;
    SourceTable = "Travel Requisition Non Staff";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = Basic;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                }
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EntryNo; Rec.EntryNo)
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



