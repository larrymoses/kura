#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80063 "Perfomance Rating Scale"
{
    PageType = Card;
    SourceTable = "Perfomance Rating Scale";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Scale Type";"Scale Type")
                {
                    ApplicationArea = Basic;
                }
                field("Max Excellent Raw Score";"Max Excellent Raw Score")
                {
                    ApplicationArea = Basic;
                }
                field("Least Poor Raw Score";"Least Poor Raw Score")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control12;"Perfomance Scale Line")
            {
                SubPageLink = "Performance Scale ID"=field(Code),
                              "Scale Type"=field("Scale Type");
            }
        }
    }

    actions
    {
    }
}

