page 99684 "Vendor Appraisal Periods"
{
    Caption = 'Vendor Appraisal Periods';
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Vendor Appraisal Period";
    SourceTableView = order(descending);
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Period Code";Rec."Period Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Closed;Rec.Closed)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field(Blocked;Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
               
            }
        }
        area(factboxes)
        {
            systempart(Control1000000014; Notes)
            {
            }
            systempart(Control1000000015; MyNotes)
            {
            }
            systempart(Control1000000016; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
           
           
         
        }
    }

    var
        ClosingFunction: Report "Close Pay period";

    ///   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}
