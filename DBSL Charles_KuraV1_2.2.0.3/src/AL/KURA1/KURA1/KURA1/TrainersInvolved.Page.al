#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69319 "Trainers Involved"
{
    PageType = ListPart;
    SourceTable = "Trainers Involved";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ID No.";"ID No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'ID No./Paasport No.';
                }
                field("Trainer Full Name";"Trainer Full Name")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
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

