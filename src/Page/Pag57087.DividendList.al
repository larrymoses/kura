#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57087 "Dividend List"
{
    CardPageID = "Dividend Schedule header";
    Editable = false;
    PageType = List;
    SourceTable = "Casual Labours";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Imprest Memo No.";"Imprest Memo No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("No. Required";"No. Required")
                {
                    ApplicationArea = Basic;
                }
                field("Work Type";"Work Type")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Days";"No. of Days")
                {
                    ApplicationArea = Basic;
                }
                field(Rate;Rate)
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

