#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80119 "Proficiency Evalulation-AS"
{
    PageType = ListPart;
    SourceTable = "Proficiency Evaluation Result";

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
                field("Competency Template ID";"Competency Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Competency Code";"Competency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Competency Description";"Competency Description")
                {
                    ApplicationArea = Basic;
                }
                field("Competency Category";"Competency Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Outcome Perfomance Indicator";"Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Proficiency Direction";"Desired Proficiency Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Profiency Rating Scale";"Profiency Rating Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Scale Type";"Scale Type")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty";"Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Self-Review Qty";"Self-Review Qty")
                {
                    ApplicationArea = Basic;
                }
                field("AppraiserReview Qty";"AppraiserReview Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Final/Actual Qty";"Final/Actual Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Raw Profiency Score";"Raw Profiency Score")
                {
                    ApplicationArea = Basic;
                }
                field("Weight %";"Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Final Weighted Line Score";"Final Weighted Line Score")
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

