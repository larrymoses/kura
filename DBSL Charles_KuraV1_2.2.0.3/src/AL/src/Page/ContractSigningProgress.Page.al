#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72129 "Contract Signing & Progress"
{
    PageType = ListPart;
    SourceTable = "Contract Signing & Progress";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Heder No";"Heder No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Signing Date";"Contract Signing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Completion Date";"Completion Date")
                {
                    ApplicationArea = Basic;
                }
                field("Achieved Km This Month";"Achieved Km This Month")
                {
                    ApplicationArea = Basic;
                }
                field("Total Achieved KM To Date";"Total Achieved KM To Date")
                {
                    ApplicationArea = Basic;
                }
                field("Work Variation Amount";"Work Variation Amount")
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

