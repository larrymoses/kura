#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72496 "Contractor Request Tasks"
{
    PageType = List;
    SourceTable = "Contractor Request Task";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Schedule (Total Cost)";"Schedule (Total Cost)")
                {
                    ApplicationArea = Basic;
                }
                field("Usage (Total Cost)";"Usage (Total Cost)")
                {
                    ApplicationArea = Basic;
                }
                field("Contract (Total Cost)";"Contract (Total Cost)")
                {
                    ApplicationArea = Basic;
                }
                field("Contract (Total Price)";"Contract (Total Price)")
                {
                    ApplicationArea = Basic;
                }
                field("Contract (Invoiced Cost)";"Contract (Invoiced Cost)")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining (Total Cost)";"Remaining (Total Cost)")
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

