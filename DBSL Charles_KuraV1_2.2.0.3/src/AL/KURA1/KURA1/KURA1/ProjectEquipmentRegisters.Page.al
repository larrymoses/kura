#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72262 "Project Equipment Registers"
{
    PageType = List;
    SourceTable = "Project Equipment Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor ID";"Contractor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment No.";"Equipment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Type Code";"Equipment Type Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Category";"Equipment Category")
                {
                    ApplicationArea = Basic;
                }
                field("Ownership Type";"Ownership Type")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Registration No.";"Equipment Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Usability Code";"Equipment Usability Code")
                {
                    ApplicationArea = Basic;
                }
                field("Years of Previous Use";"Years of Previous Use")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Condition Code";"Equipment Condition Code")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Programme ID";"Work Execution Programme ID")
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

