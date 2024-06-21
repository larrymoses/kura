#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80085 "Upcoming Performance Tasks"
{
    ApplicationArea = Basic;
    CardPageID = "Performance Plan Task";
    PageType = List;
    SourceTable = "Performance Plan Task";
   SourceTableView = where("Task Category"=const("Performance Review"));
                          //  "Published?"=const(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Mgt Plan ID";"Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Task Code";"Task Code")
                {
                    ApplicationArea = Basic;
                }
                field("Task Category";"Task Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Performance Cycle Start Date";"Performance Cycle Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Cycle End Date";"Performance Cycle End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Processing Start Date";"Processing Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Processing Due Date";"Processing Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Published?";"Published?")
                {
                    ApplicationArea = Basic;
                }
                field("Closed?";"Closed?")
                {
                    ApplicationArea = Basic;
                }
                field("Published By";"Published By")
                {
                    ApplicationArea = Basic;
                }
                field("Closed By";"Closed By")
                {
                    ApplicationArea = Basic;
                }
                field("No of Evaluations/Appeals";"No of Evaluations/Appeals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

