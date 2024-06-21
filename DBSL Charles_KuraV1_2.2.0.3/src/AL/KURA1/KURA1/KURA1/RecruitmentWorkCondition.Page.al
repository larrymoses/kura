#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69628 "Recruitment Work Condition"
{
    Caption = 'Recruitment Work Condition';
    PageType = List;
    SourceTable = "Recruitment Req Work Condition";
    SourceTableView = where("Document Type"=filter("Recruitment Requisition"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Working Condition Category";"Working Condition Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

