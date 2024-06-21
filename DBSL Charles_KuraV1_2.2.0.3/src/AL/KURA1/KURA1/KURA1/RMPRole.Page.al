#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95050 "RMP Role"
{
    PageType = Card;
    SourceTable = "RMP Role";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary";"Executive Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Team";"Risk Management Team")
                {
                    ApplicationArea = Basic;
                }
                field("Project Team (Internal Staff)";"Project Team (Internal Staff)")
                {
                    ApplicationArea = Basic;
                }
                field("Project Team(Contractor Staff)";"Project Team(Contractor Staff)")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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

