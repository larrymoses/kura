#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72574 "Project Inspection Line Subpag"
{
    PageType = ListPart;
    SourceTable = "Inspection Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No";"Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Type";"Inspection Type")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Category ID";"Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Requirements";"No. of Requirements")
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
                action("Inspection Plan Lines")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Project Inspection Plan Lines";
                    RunPageLink = "Inspection No"=field("Inspection No"),
                                  "Inspection Type"=field("Inspection Type"),
                                  "Line No"=field("Line No"),
                                  "Category ID"=field("Category ID");
                }
            }
        }
    }
}

