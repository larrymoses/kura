#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95065 "Risk Status Report Lines"
{
    PageType = ListPart;
    SourceTable = "Risk Status Report Line";

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field("Risk Management Plan ID";"Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk ID";"Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Title";"Risk Title")
                {
                    ApplicationArea = Basic;
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
                field("Risk Status";"Risk Status")
                {
                    ApplicationArea = Basic;
                }
                field("Date Closed";"Date Closed")
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
                action("Risk Ownership")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Ownership';
                    Image = Reuse;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "RMP Line Risk Ownerships";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Document No"=field("Document No"),
                                  "Risk ID"=field("Risk ID");
                }
                action("Risk Response Actions")
                {
                    ApplicationArea = Basic;
                    Image = Reuse;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "RMP Line Response Actions";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Document No"=field("Document No"),
                                  "Risk ID"=field("Risk ID");
                }
                action("Job Tasks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Tasks';
                    Image = Reuse;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "RMP Line Job Tasks";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Document No"=field("Document No"),
                                  "Risk ID"=field("Risk ID");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Default Dimensions";
                }
            }
        }
    }
}

