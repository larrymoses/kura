#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95040 "RMP Line Risk Ownership"
{
    PageType = Card;
    SourceTable = "RMP Line Risk Ownership";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Risk ID";"Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center ID";"Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Responsible Officer No.";"Responsible Officer No.")
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
