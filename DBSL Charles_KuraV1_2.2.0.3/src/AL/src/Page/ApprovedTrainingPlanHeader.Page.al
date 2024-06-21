#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69198 "Approved Training Plan Header"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Training Plan Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
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
                field(Global; Global)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Department Code"; "Department Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Department  Name"; "Department  Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Year Code"; "Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Status"; "Approved Status")
                {
                    ApplicationArea = Basic;
                }
                field("Total Estimated Cost"; "Total Estimated Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Internal Training"; "Internal Training")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("External Training"; "External Training")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bugdet Available"; "Bugdet Available")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Allocation';
                    Editable = false;
                }
                field("Budget Allocation"; "Budget Allocation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Available';
                    Editable = false;
                }
                field("Budget Utilized"; "Budget Utilized")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan Code"; "Corporate Strategic Plan Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            //     part(Control16;"Approved Training Plan Lines")
            //     {
            //         Editable = false;
            //         SubPageLink = "Training Plan Code"=field(No);
            //     }
            // }
        }

        // actions
        // {
        //     area(reporting)
        //     {
        //         action("Training Plan")
        //         {
        //             ApplicationArea = Basic;
        //             Image = Planning;
        //             Promoted = true;
        //             PromotedCategory = "Report";
        //             PromotedIsBig = true;

        //             trigger OnAction()
        //             begin
        //                 SetRange(No, No);
        //                 Report.Run(69145, true, false, Rec);
        //             end;
        //         }
        //     }
    }
}

