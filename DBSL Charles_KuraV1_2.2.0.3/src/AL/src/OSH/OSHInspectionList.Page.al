#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69532 "OSH Inspection List"
{
  //  CardPageID = "OSH Inspection Voucher Card";
    Editable = false;
    PageType = List;
    SourceTable = 69451;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Drill ID";"Drill ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'No.';
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7;Outlook)
            {
            }
            systempart(Control8;Notes)
            {
            }
            systempart(Control9;MyNotes)
            {
            }
            systempart(Control10;Links)
            {
            }
        }
    }

    actions
    {
    }
}
