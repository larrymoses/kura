#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72265 "WEP Execution Schedule"
{
    PageType = ListPart;
    SourceTable = "WEP Execution Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job No";"Job No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task No";"Job Task No")
                {
                    ApplicationArea = Basic;
                    Caption = 'BOQ No.';
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Scheduled Start Date";"Scheduled Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Scheduled End Date";"Scheduled End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Budget (Total Cost)";"Budget (Total Cost)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task Type";"Job Task Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posting Type';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

