#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57105 "Casual Labours"
{
    PageType = List;
    SourceTable = "Casual Labours";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("National ID Number of casual";"Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Type;"Work Type")
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
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Activity;Activity)
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

