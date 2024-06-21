#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72553 "Corrective Order Reponse Lines"
{
    PageType = ListPart;
    SourceTable = "Corrective Order Response Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
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
                field(Description;Description)
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
                field("Start Chainage";"Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage";"End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Comments";"Engineer Comments")
                {
                    ApplicationArea = Basic;
                }
                field("Achieved Start Chainage";"Achieved Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Achieved End Chainage";"Achieved End Chainage")
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
                field("Posting Date";"Posting Date")
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

