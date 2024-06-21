#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72125 "Works Progress Card"
{
    PageType = Card;
    SourceTable = "Works Progress Headers";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Progress No"; "Progress No")
                {
                    ApplicationArea = Basic;
                }
                field("Progress Date"; "Progress Date")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source"; "Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; "Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Link Name"; "Road Link Name")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control9; "Works Contract Line")
            {
                // SubPageLink = "Header No"=field("Progress No");
            }
            part(Control10; "Annual Workplan Section")
            {
                SubPageLink = "Header No" = field("Progress No");
            }
            part(Control11; "Employment Details")
            {
                SubPageLink = "Header No" = field("Progress No");
            }
            part(Control12; "Contract Signing & Progress")
            {
                SubPageLink = "Heder No" = field("Progress No");
            }
            part(Control13; "Progress Employment")
            {
                SubPageLink = "Header No" = field("Progress No");
            }
            part(Control14; "Progress Per Road Activity")
            {
                SubPageLink = "Header No" = field("Progress No");
            }
        }
    }

    actions
    {
    }
}

