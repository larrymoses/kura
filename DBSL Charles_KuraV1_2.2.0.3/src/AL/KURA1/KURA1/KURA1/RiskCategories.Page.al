#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95017 "Risk Categories"
{
    CardPageID = "Risk Category";
    Editable = false;
    PageType = List;
    SourceTable = "Risk Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Type';
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Risk Source ID";"Risk Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Addditiona Comments";"Addditiona Comments")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Risk Triggers";"No. of Risk Triggers")
                {
                    ApplicationArea = Basic;
                }
                field("No of Strategic Risks";"No of Strategic Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No of Operational Risks";"No of Operational Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No of Project Risks";"No of Project Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Incidents";"No. of Incidents")
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

