#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95248 "Audit Findings"
{
    CardPageID = "Audit Finding";
    PageType = List;
    SourceTable = "Audit Finding";

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
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Implications;Implications)
                {
                    ApplicationArea = Basic;
                }
                field("Finding Rating Code";"Finding Rating Code")
                {
                    ApplicationArea = Basic;
                }
                field(Recommendations;Recommendations)
                {
                    ApplicationArea = Basic;
                }
                field("Applicable To All Locations";"Applicable To All Locations")
                {
                    ApplicationArea = Basic;
                }
                field("Management Response";"Management Response")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Person";"Responsible Person")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Person Name";"Responsible Person Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Requested";"Date Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Response Submission Deadline";"Response Submission Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Verdict/Opinion";"Verdict/Opinion")
                {
                    ApplicationArea = Basic;
                }
                field("Action Plan";"Action Plan")
                {
                    ApplicationArea = Basic;
                }
                field("Action Plan Deadline";"Action Plan Deadline")
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

