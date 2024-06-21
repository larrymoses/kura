#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 99507 "Safe Work Permits COM"
{
    // CardPageID = "Safe Work Permit Completion";
    Editable = false;
    PageType = List;
    SourceTable = 69441;
    SourceTableView = where("Document Type" = const("Safe Work Completion Report"));

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
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Safety Work Permit ID"; "Safety Work Permit ID")
                {
                    ApplicationArea = Basic;
                }
                field("HSE Plan Type"; "HSE Plan Type")
                {
                    ApplicationArea = Basic;
                }
                field("OSH Management Plan ID"; "OSH Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID"; "Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time"; "Created Date/Time")
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
