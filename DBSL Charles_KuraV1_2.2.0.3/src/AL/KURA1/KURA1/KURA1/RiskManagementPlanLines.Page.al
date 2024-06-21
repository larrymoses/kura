#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95038 "Risk Management Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Risk Management Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                // field("Risk ID";"Risk ID")
                // {
                //     ApplicationArea = Basic;
                //     Visible = true;
                // }
                field("Risk Category";"Risk Category")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Title";"Risk Title")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Source ID";"Risk Source ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Risk Likelihood Code";"Risk Likelihood Code")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Code";"Risk Impact Code")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Type";"Risk Impact Type")
                {
                    ApplicationArea = Basic;
                }
                field("Estimate Fin. Impact (LCY)";"Estimate Fin. Impact (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Estimate Delay Impact (Days)";"Estimate Delay Impact (Days)")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Risk Response Strategy";"Gen. Risk Response Strategy")
                {
                    ApplicationArea = Basic;
                }
                field("Date Raised";"Date Raised")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Status";"Risk Status")
                {
                    ApplicationArea = Basic;
                }
                field("Date Closed";"Date Closed")
                {
                    ApplicationArea = Basic;
                }
                // field("Risk Likelihood Rate Scale ID";"Risk Likelihood Rate Scale ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Risk Impact Rating Scale ID";"Risk Impact Rating Scale ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Overall Risk Rating Scale ID";"Overall Risk Rating Scale ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Risk Appetite Rating Scale ID";"Risk Appetite Rating Scale ID")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Risk Likelihood Rating";"Risk Likelihood Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Rating";"Risk Impact Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Overal Risk Rating";"Overal Risk Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Risk Level Code";"Overall Risk Level Code")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Heat Zone";"Risk Heat Zone")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Risk Ownership")
                {
                    ApplicationArea = Basic;
                    Image = "Order";
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "RMP Line Risk Ownerships";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Document No"=field("Document No"),
                                  "Risk ID"=field("Risk ID");
                }
                action("Risk Response Actions")
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "RMP Line Response Actions";
                    RunPageLink = "Risk ID"=field("Risk ID");
                }
                action("Line Dimensions")
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Dimension Set Entries";
                }
            }
        }
    }
}

