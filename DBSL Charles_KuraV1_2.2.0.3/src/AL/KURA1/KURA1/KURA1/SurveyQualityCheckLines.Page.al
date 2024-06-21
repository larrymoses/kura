#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72682 "Survey Quality Check Lines"
{
    PageType = ListPart;
    SourceTable = "Survey Quality Check Line";

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
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Layer Code";"Layer Code")
                {
                    ApplicationArea = Basic;
                }
                field("Layer Description";"Layer Description")
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
                field("Survey Test Done";"Survey Test Done")
                {
                    ApplicationArea = Basic;
                    Caption = 'Survey Check Done';
                }
                field("Test Time";"Test Time")
                {
                    ApplicationArea = Basic;
                }
                field("Test Date";"Test Date")
                {
                    ApplicationArea = Basic;
                }
                field("Surveyor Type";"Surveyor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Surveyor No";"Surveyor No")
                {
                    ApplicationArea = Basic;
                }
                field("Surveyor Name";"Surveyor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Location (Chainage)";"Location (Chainage)")
                {
                    ApplicationArea = Basic;
                }
                field("Layer Tolerance";"Layer Tolerance")
                {
                    ApplicationArea = Basic;
                }
                field("Final Test Result";"Final Test Result")
                {
                    ApplicationArea = Basic;
                }
                field(Offset;Offset)
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
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

