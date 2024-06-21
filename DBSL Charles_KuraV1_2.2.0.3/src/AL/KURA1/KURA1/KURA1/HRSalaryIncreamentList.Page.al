#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69190 "HR Salary Increament List"
{
    ApplicationArea = Basic;
    CardPageID = "HR Salary Increament Card";
    InsertAllowed = false;
    PageType = List;
    SourceTable = "HR Salary Increament Header";
    SourceTableView = where(Status=const(Open));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Batch No";"Batch No")
                {
                    ApplicationArea = Basic;
                }
                field(Descriptions;Descriptions)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Run By";"Run By")
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

