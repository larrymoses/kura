#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72644 "Monthly Work Plan Lines"
{
    PageType = List;
    SourceTable = "Planning Work Plan Line";

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
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Code";"Activity Code")
                {
                    ApplicationArea = Basic;
                }
                field("Works Description";"Works Description")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Total Done Todate";"Total Done Todate")
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
                field("Works Start Chainage(KM)";"Works Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chanage(KM)";"Works End Chanage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Of Measure";"Unit Of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Foreman ID";"Foreman ID")
                {
                    ApplicationArea = Basic;
                }
                field("Foreman Name";"Foreman Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Material on Site")
            {
                ApplicationArea = Basic;
                Image = WarehouseRegisters;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Workplan Materials on Site";
                RunPageLink = "Document No"=field("Document No."),
                              "Document Type"=field("Document Type"),
                              "Project ID"=field("Project ID"),
                              "Line No"=field("Entry No"),
                              "Activity No"=field("Activity Code");
            }
            action("Plant and Machinery")
            {
                ApplicationArea = Basic;
                Image = Delivery;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Workplan Plant and Machinery L";
                RunPageLink = "Document No"=field("Document No."),
                              "Document Type"=field("Document Type"),
                              "Activity No"=field("Activity Code"),
                              "Line No"=field("Line No.");
            }
        }
    }
}

