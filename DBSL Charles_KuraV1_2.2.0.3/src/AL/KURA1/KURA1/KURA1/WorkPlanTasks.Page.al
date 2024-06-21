#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72191 "Work Plan Tasks"
{
    Caption = 'Summary Of Bills';
    PageType = List;
    SourceTable = "New Road Work Program Task";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Work Program ID";"Road Work Program ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Package No.";"Package No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("BoQ Template Code";"BoQ Template Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Category Code";"Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Begin-Total Job Task No.";"Begin-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("End-Total Job Task No.";"End-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Bill Activities";"No. of Bill Activities")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted Job No.";"Posted Job No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posted Begin-Total Job Tsk No.";"Posted Begin-Total Job Tsk No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posted End-Total Job Task No.";"Posted End-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Total Amount";"Total Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("WP Plan Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Bill Items';
            }
        }
    }
}

