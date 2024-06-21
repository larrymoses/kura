#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70053 "Contract Manangement Lines"
{
    PageType = ListPart;
    SourceTable = "Contract Management Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Supplier;Supplier)
                {
                    ApplicationArea = Basic;
                }
                field("Service Provided";"Service Provided")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Amount";"Contract Amount")
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

