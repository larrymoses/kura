#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75075 "Request For Information"
{
    PageType = List;
    SourceTable = "Request For Information";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Target Vendor Cluster";"Primary Target Vendor Cluster")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Period Start Date";"Period Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Period End Date";"Period End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Box Location Code";"Tender Box Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Start Date";"Submission Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Start Time";"Submission Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Date";"Submission End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Time";"Submission End Time")
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

