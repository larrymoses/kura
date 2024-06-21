#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72639 "Weekly Work Plan Line Subpage"
{
    PageType = ListPart;
    SourceTable = "Work Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Code"; "Activity Code")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Description"; "Activity Description")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Total Done To date"; "Total Done To date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
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
            group(ActionGroup11)
            {
                Caption = '&Line';
                action("Planning Work Plan Lines")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Weekly Work Plan Lines";
                    RunPageLink = "Document No." = field("Document No."),
                                  "Document Type" = field("Document Type"),
                                  "Activity Code" = field("Activity Code"),
                                  "Line No." = field("Line No.");
                }
            }
        }
    }
}

