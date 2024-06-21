#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80177 "Governement Policies"
{
    Caption = 'Governement Policies';
    CardPageID = "Government Policy Card";
    Editable = false;
    PageType = List;
    SourceTable = Policy;
    SourceTableView = where(Type=const(External),
                            "Approval Status"=const(Open));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Policy Name";"Policy Name")
                {
                    ApplicationArea = Basic;
                }
                field(Summary;Summary)
                {
                    ApplicationArea = Basic;
                }
                field("Applies-To";"Applies-To")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Person";"Responsible Person")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Title;Title)
                {
                    ApplicationArea = Basic;
                }
                field("Date Approved";"Date Approved")
                {
                    ApplicationArea = Basic;
                }
                field("Current Version No";"Current Version No")
                {
                    ApplicationArea = Basic;
                }
                field("Last Review Date";"Last Review Date")
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

