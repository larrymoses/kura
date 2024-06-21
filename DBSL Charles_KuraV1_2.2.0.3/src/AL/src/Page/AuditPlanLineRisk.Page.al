#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95315 "Audit Plan Line Risk"
{
    PageType = List;
    SourceTable = "Audit Plan Line Risk";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line Risk ID";"Line Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Title";"Risk Title")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Category";"Risk Category")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Source ID";"Risk Source ID")
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
                field("Risk Register Type";"Risk Register Type")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID";"Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk ID";"Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Risk Response Strategy";"Gen. Risk Response Strategy")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Controls";"No. of Controls")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Procedures";"No. of Audit Procedures")
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

