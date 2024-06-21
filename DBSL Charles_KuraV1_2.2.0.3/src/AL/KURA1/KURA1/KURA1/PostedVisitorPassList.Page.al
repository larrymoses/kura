#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56068 "Posted Visitor Pass List"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Visitor Pass";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Visitors Pass";
    SourceTableView = where(Status=filter(Released));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date of visit";"Date of visit")
                {
                    ApplicationArea = Basic;
                }
                field("Time of visit";"Time of visit")
                {
                    ApplicationArea = Basic;
                }
                field("Visitor Name";"Visitor Name")
                {
                    ApplicationArea = Basic;
                }
                field("ID No";"ID No")
                {
                    ApplicationArea = Basic;
                }
                field(From;From)
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

