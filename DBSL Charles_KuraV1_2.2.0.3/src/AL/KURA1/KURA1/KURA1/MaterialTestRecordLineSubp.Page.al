#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72585 "Material Test Record Line Subp"
{
    PageType = ListPart;
    SourceTable = "Material Test Record Line";

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
                field("Material Delivery Date";"Material Delivery Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Material ID";"Material ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Base Unit of Measure";"Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Site Description";"Site Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Test Laboratory Location';
                }
                field("Start Chainage";"Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage";"End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Technologist Type";"Technologist Type")
                {
                    ApplicationArea = Basic;
                }
                field("Test Lead No.";"Test Lead No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lab Technologist/Technician No';
                }
                field("Test Lead Name";"Test Lead Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lab Technologist/Technician Name';
                }
                field("Driver Name";"Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle No.";"Vehicle No.")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Final Test Result";"Final Test Result")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID";"Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Testing Date";"Testing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No.";"Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID";"Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID";"Department ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Material Test Categories")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Material Test Record Category";
                    RunPageLink = Code=field(Code),
                                  "Project ID"=field("Project ID"),
                                  "Line No"=field("Line No.");
                    Visible = false;
                }
                action("Material Test Pass")
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Material Test Passes";
                    RunPageLink = Code=field(Code),
                                  "Project ID"=field("Project ID"),
                                  "Line No."=field("Line No.");
                    Visible = false;
                }
                action("Attach Test Result")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}

