#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50020 "Doc Approval Delegations Admin"
{
    CardPageID = "Doc Approval Delegation Admin";
    Editable = false;
    PageType = List;
    SourceTable = "Document Approval Delegation";
    SourceTableView = where(Status = const(Open));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Current Approver ID"; Rec."Current Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field("New Approver ID"; Rec."New Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        // SETRANGE("Current Approver ID",USERID);
    end;
}

#pragma implicitwith restore
