#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69175 "Overtime List"
{
    ApplicationArea = Basic;
    CardPageID = "Overtime Header Page";
    PageType = List;
    SourceTable = "Overtime Header";
    //SourceTableView = where(Status=filter(<>Approved));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application Code"; "Application Code")
                {
                    ApplicationArea = Basic;
                }
                field("Application Date"; "Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("EMp No."; "EMp No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field("Convert to pay"; "Convert to pay")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Convert to Leave"; "Convert to Leave")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Weekday Hours"; "Weekday Hours")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Total Hours"; "Total Hours")
                {
                    ApplicationArea = Basic;
                }
                field("Overtime Amount"; "Overtime Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Status)
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

