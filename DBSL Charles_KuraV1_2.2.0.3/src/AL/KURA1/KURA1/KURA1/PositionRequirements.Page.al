#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69143 "Position Requirements"
{
    PageType = List;
    SourceTable = "Position Requirements";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Type";"Qualification Type")
                {
                    ApplicationArea = Basic;
                }
                field("Job Requirements";"Job Requirements")
                {
                    ApplicationArea = Basic;
                }
                field("Job Specification";"Job Specification")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Code";"Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field(Qualification;Qualification)
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Description";"Qualification Description")
                {
                    ApplicationArea = Basic;
                }
                field("Stage Code";"Stage Code")
                {
                    ApplicationArea = Basic;
                }
                field(Mandatory;Mandatory)
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

