#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69280 "Approved Training Applications"
{
    ApplicationArea = Basic;
    //CardPageID = "Approved Training Application";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Training Requests";
    SourceTableView = where(Status = filter(Approved));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field("Course Title"; "Course Title")
                {
                    ApplicationArea = Basic;
                }
                field("Start DateTime"; "Start DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime"; "End DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Duration)
                {
                    ApplicationArea = Basic;
                }
                field(Cost; Cost)
                {
                    ApplicationArea = Basic;
                }
                field(Location; Location)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Year; Year)
                {
                    ApplicationArea = Basic;
                }
                field(Provider; Provider)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Employee No."; "Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Application Date"; "Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Department"; "Employee Department")
                {
                    ApplicationArea = Basic;
                }
                field("Requires Flight"; "Requires Flight")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor No."; "Supervisor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name"; "Supervisor Name")
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

