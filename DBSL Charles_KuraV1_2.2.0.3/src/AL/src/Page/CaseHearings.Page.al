#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56106 "Case Hearings"
{
    PageType = ListPart;
    SourceTable = "Case Hearing";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Day;Day)
                {
                    ApplicationArea = Basic;
                }
                field("Last Hearing Date";"Last Hearing Date")
                {
                    ApplicationArea = Basic;
                }
                field(Progress;Progress)
                {
                    ApplicationArea = Basic;
                }
                field("Next Hearing Date";"Next Hearing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Advocate On Record";"Advocate On Record")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Decision;Decision)
                {
                    ApplicationArea = Basic;
                    Caption = 'Decision on Hearing Date';
                    MultiLine = true;
                }
                field("Bring Up Date";"Bring Up Date")
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

