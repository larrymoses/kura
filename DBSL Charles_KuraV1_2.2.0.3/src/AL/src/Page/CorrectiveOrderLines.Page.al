#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72548 "Corrective Order Lines"
{
    PageType = ListPart;
    SourceTable = "Corrective Order Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Order No";"Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Category ID";"Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement ID";"Requirement ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Response Option";"Response Option")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No";"Job Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Plan Line No";"Plan Line No")
                {
                    ApplicationArea = Basic;
                }
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Description";"Bill Item Description")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Of Measure";"Unit Of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Chainage Description";"Chainage Description")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Rework Status";"Rework Status")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Comments";"Contractor Comments")
                {
                    ApplicationArea = Basic;
                }
                field("Photo Number";"Photo Number")
                {
                    ApplicationArea = Basic;
                }
                field("Closure Date";"Closure Date")
                {
                    ApplicationArea = Basic;
                }
                field("Completion Percentage";"Completion Percentage")
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

