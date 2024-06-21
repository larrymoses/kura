
Page 59049 "Driver Vehicle Allocation"
{
    PageType = ListPart;
    SourceTable = "Vehicle Driver Allocation";
    //ApplicationArea=All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Driver Code"; Rec."Driver Code")
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                }
                field("Number of Days"; Rec."Number of Days")
                {
                    ApplicationArea = Basic;
                }
                field("Trip End Date"; Rec."Trip End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Registration Number"; Rec."Registration Number")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Description"; Rec."Vehicle Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field("Reassigned?"; Rec."Reassigned?")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     Visible = false;
                // }
                // field("New Trip"; Rec."New Trip")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     Visible = false;
                // }
                // field("Date Reassigned"; Rec."Date Reassigned")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     Visible = false;
                // }
                /*  field("Approved Imprest Memo No.";"Approved Imprest Memo No.")
                  {
                      ApplicationArea = Basic;
                  }*/
            }
        }
    }

    actions
    {
        area(processing)
        {
            // group("&Line")
            // {
            //     Caption = '&Line';
            //     Image = Line;
            //     action("Reassign to Another Trip")
            //     {
            //         ApplicationArea = Basic;
            //         Image = Refresh;

            //         trigger OnAction()
            //         begin
            //             if "Reassigned?" = true then
            //                 Error('The Driver has already been reassigned to another trip');
            //             TravelRequ.Reset;
            //             TravelRequ.SetRange("Driver Code", "Driver Code");
            //             TravelRequ.SetRange("Requisition Number", "Requisition Number");
            //             if Dialog.Confirm('Are you sure you want to reasign %1 to another trip?', true, "Driver Name") then
            //                 Report.Run(Report::"Reasign Driver Trip", true, true, TravelRequ);
            //         end;
            //     }
            // }
        }
    }

    var
        DriverAllocation: Record "Vehicle Driver Allocation";
        TravelRequ: Record "Vehicle Driver Allocation";
}


