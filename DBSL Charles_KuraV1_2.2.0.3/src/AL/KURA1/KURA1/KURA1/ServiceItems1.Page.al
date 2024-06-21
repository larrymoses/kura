#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69064 "Service Items1"
{
    CardPageID = "IR Service Items";
    Editable = false;
    PageType = List;
    SourceTable = "Document Approval Delegation";
    // SourceTableView = where(Field108=const(No));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // field("Service Code";"Service Code")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Service Name";"Service Name")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("G/L Account";"G/L Account")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("G/L Account Name";"G/L Account Name")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000007; Notes)
            {
            }
            systempart(Control1000000008; MyNotes)
            {
            }
            systempart(Control1000000009; Links)
            {
            }
        }
    }

    actions
    {
    }
}

