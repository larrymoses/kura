#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69212 "HR Leave Types"
{
    ApplicationArea = Basic;
    CardPageID = "HR Leave Types Card";
    PageType = List;
    SourceTable = "HR Leave Types";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Days;Days)
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field("Inclusive of Holidays";"Inclusive of Holidays")
                {
                    ApplicationArea = Basic;
                }
                field("Inclusive of Saturday";"Inclusive of Saturday")
                {
                    ApplicationArea = Basic;
                }
                field(Annual;Annual)
                {
                    ApplicationArea = Basic;
                }
                field("Inclusive of Sunday";"Inclusive of Sunday")
                {
                    ApplicationArea = Basic;
                }
                field("Max Carry Forward Days";"Max Carry Forward Days")
                {
                    ApplicationArea = Basic;
                }
                field("Grace Period(in Days )";"Grace Period(in Days )")
                {
                    ApplicationArea = Basic;
                }
                field("Inclusive of Non Working Days";"Inclusive of Non Working Days")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Attachments Required";"Attachments Required")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755003;Outlook)
            {
            }
            systempart(Control1102755004;Notes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;
}

