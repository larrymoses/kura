#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50006 "Road Activities"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Road Activities";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            cuegroup("Cost Claims")
            {
                Caption = 'Cost Claims';
                Visible = true;
                field("Open Cost Claims"; Rec."Open Cost Claims")
                {
                    ApplicationArea = Jobs;
                    DrillDownPageID = "Cost Claims";
                    Caption = 'Open Cost Claims';
                    ToolTip = 'Specifies the number of upcoming invoices that are displayed in the Job Cue on the Role Center. The documents are filtered by today''s date.';
                }

                field("Pending Cost Claims"; Rec."Pending Cost Claims")
                {
                    Caption = 'Pending Cost Claims';
                    Visible = true;
                    ApplicationArea = Jobs;
                    DrillDownPageID = "Cost Claims";
                    ToolTip = 'Specifies the number of upcoming invoices that are displayed in the Job Cue on the Role Center. The documents are filtered by today''s date.';
                }
            }
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Descrption; Rec.Descrption)
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

#pragma implicitwith restore

