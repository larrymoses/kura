#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59134 "Blocked Vehicle Insurance"
{
    ApplicationArea = Basic;
    CardPageID = "Vehicle Insurance Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Insurance;
    SourceTableView = where(Blocked=const(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiration Date";"Expiration Date")
                {
                    ApplicationArea = Basic;
                }
                field("Policy No.";"Policy No.")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Premium";"Annual Premium")
                {
                    ApplicationArea = Basic;
                }
                field("Total Value Insured";"Total Value Insured")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Type";"Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Registration No.";"Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("FA No.";"FA No.")
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

