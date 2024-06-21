#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80184 "Policy Revisions"
{
    CardPageID = "Policy Revision";
    Editable = false;
    PageType = List;
    SourceTable = "Policy Revision";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Revision No.";"Revision No.")
                {
                    ApplicationArea = Basic;
                }
                field("Policy ID";"Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Revision Type";"Revision Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Policy Name";"Policy Name")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Dev Institution ID";"Policy Dev Institution ID")
                {
                    ApplicationArea = Basic;
                }
                field(Summary;Summary)
                {
                    ApplicationArea = Basic;
                }
                field("Policy Goal";"Policy Goal")
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
                }
                field(Title;Title)
                {
                    ApplicationArea = Basic;
                }
                field("Revision Date";"Revision Date")
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

