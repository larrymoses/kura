#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65132 "My Tasks"
{
    CardPageID = "Grant Admin Tasks Card";
    Editable = false;
    PageType = List;
    SourceTable = "Grant Admin Tasks";
    SourceTableView = where("Source Document Type" = const(" "));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Source Document Type"; "Source Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Sourec Document No."; "Sourec Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Admin Team Code"; "Grant Admin Team Code")
                {
                    ApplicationArea = Basic;
                }
                field("Team Name"; "Team Name")
                {
                    ApplicationArea = Basic;
                }
                field("Researcher No"; "Researcher No")
                {
                    ApplicationArea = Basic;
                }
                field("Research Center"; "Research Center")
                {
                    ApplicationArea = Basic;
                }
                field("Contact No."; "Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field("Task Type"; "Task Type")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Priority; Priority)
                {
                    ApplicationArea = Basic;
                }
                field("Research Program"; "Research Program")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Name"; "Contact Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Closed; Closed)
                {
                    ApplicationArea = Basic;
                }
                field("Date Closed"; "Date Closed")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Comment; Comment)
                {
                    ApplicationArea = Basic;
                }
                field("Research Center Description"; "Research Center Description")
                {
                    ApplicationArea = Basic;
                }
                field("Program Description"; "Program Description")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Company No"; "Contact Company No")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        //  SetRange("Assigned to",UserId);
    end;
}

