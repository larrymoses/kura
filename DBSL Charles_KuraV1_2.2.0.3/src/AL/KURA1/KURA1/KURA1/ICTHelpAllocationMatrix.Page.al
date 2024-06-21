#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56219 "ICT Help Allocation Matrix"
{
    //ApplicationArea = Basic,Suite;
    Caption = 'User Setup';
    PageType = List;
    SourceTable = "User Setup";
   // UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("User ID";"User ID")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                }
                field(CIDO;CIDO)
                {
                    ApplicationArea = Basic;
                }
                field("Allow Posting From";"Allow Posting From")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTip = 'Specifies the earliest date on which the user is allowed to post to the company.';
                }
                field("Allow Posting To";"Allow Posting To")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTip = 'Specifies the last date on which the user is allowed to post to the company.';
                }
                field("Register Time";"Register Time")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTip = 'Specifies whether to register the user''s time usage defined as the time spent from when the user logs in to when the user logs out. Unexpected interruptions, such as idle session timeout, terminal server idle session timeout, or a client crash are not recorded.';
                }
                field("Salespers./Purch. Code";"Salespers./Purch. Code")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTip = 'Specifies the code for the salesperson or purchaser for the user.';
                }
                field("Sales Resp. Ctr. Filter";"Sales Resp. Ctr. Filter")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the code for the responsibility center to which you want to assign the user.';
                }
                field("Purchase Resp. Ctr. Filter";"Purchase Resp. Ctr. Filter")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the code for the responsibility center to which you want to assign the user.';
                }
                field("Service Resp. Ctr. Filter";"Service Resp. Ctr. Filter")
                {
                    ApplicationArea = Service;
                    ToolTip = 'Specifies the code for the responsibility center you want to assign to the user. The user will only be able to see service documents for the responsibility center specified in the field. This responsibility center will also be the default responsibility center when the user creates new service documents.';
                }
                field("Time Sheet Admin.";"Time Sheet Admin.")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTip = 'Specifies if a user is a time sheet administrator. A time sheet administrator can access any time sheet and then edit, change, or delete it.';
                }
                field("Employee No.";"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Receiptionist;Receiptionist)
                {
                    ApplicationArea = Basic;
                }
                field("Accounts User";"Accounts User")
                {
                    ApplicationArea = Basic;
                }
                field(Leave;Leave)
                {
                    ApplicationArea = Basic;
                }
                field("Resource No";"Resource No")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Account";"Imprest Account")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll View";"Payroll View")
                {
                    ApplicationArea = Basic;
                }
                field("Post Memo";"Post Memo")
                {
                    ApplicationArea = Basic;
                }
                field("Post Requisition";"Post Requisition")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement officer";"Procurement officer")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Manager";"Procurement Manager")
                {
                    ApplicationArea = Basic;
                }
                field("post surrender";"post surrender")
                {
                    ApplicationArea = Basic;
                }
                field("Allowed To Auto Reverse";"Allowed To Auto Reverse")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Administrator";"Approval Administrator")
                {
                    ApplicationArea = Basic;
                }
                field(Email;"E-Mail")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTip = 'Specifies the user''s email address.';
                }
                field("Portal User";"Portal User")
                {
                    ApplicationArea = Basic;
                }
                field("Create New Job";"Create New Job")
                {
                    ApplicationArea = Basic;
                }
                field("Update Job Status";"Update Job Status")
                {
                    ApplicationArea = Basic;
                }
                field("Archive Document";"Archive Document")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code";"Region Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        //HideExternalUsers;
    end;
}

