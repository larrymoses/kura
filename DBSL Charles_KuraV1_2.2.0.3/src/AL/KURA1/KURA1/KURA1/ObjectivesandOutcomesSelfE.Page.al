#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80137 "Objectives and Outcomes-Self E"
{
    PageType = ListPart;
    SourceTable = "Objective Evaluation Result";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Evaluation ID";"Performance Evaluation ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Scorecard ID";"Scorecard ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Scorecard Line No";"Scorecard Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Objective/Initiative";"Objective/Initiative")
                {
                    ApplicationArea = Basic;
                }
                field("Outcome Perfomance Indicator";"Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Desired Perfomance Direction";"Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Rating Scale";"Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Scale Type";"Scale Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Target Qty";"Target Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Self-Review Qty";"Self-Review Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("AppraiserReview Qty";"AppraiserReview Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Final/Actual Qty";"Final/Actual Qty")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

