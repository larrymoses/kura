#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80345 "Custom Stakeholder Surveys"
{
    CardPageID = "Custom Stakeholder Survey";
    Editable = false;
    PageType = List;
    SourceTable = "Business Research Survey";
    SourceTableView = where("Business Research Category"=const("Custom Survey"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Business Research Category";"Business Research Category")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Survey Type";"Survey Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Business Research Template ID";"Business Research Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Target Respondent Type";"Target Respondent Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department ID";"Primary Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate ID";"Primary Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field(Published;Published)
                {
                    ApplicationArea = Basic;
                }
                field("Date Published";"Date Published")
                {
                    ApplicationArea = Basic;
                }
                field("Response Due Date";"Response Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date";"Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Time";"Creation Time")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Responses";"No. of Responses")
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

