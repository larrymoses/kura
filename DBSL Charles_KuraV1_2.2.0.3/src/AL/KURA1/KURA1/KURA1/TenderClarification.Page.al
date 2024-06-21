#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75423 "Tender Clarification"
{
    ApplicationArea = Basic;
    CardPageID = "Tender Clarification Card";
    Editable = false;
    PageType = List;
    SourceTable = "Tender Addendum Notice";
    SourceTableView = where("Process Type"=const(IFS),
                            "Document Type"=const(Clarification));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Addendum Notice No.";"Addendum Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice No.";"Invitation Notice No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'No.';
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created by";"Created by")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time";"Created Date/Time")
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

