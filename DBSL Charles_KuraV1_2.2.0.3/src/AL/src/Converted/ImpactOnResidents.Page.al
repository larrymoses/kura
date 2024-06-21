#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 99455 "Impact On Residents"
{
    PageType = ListPart;
    SourceTable = "Impact on Residents";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Extent Of Agrrement Measure"; Rec."Extent Of Agrrement Measure")
                {
                    ApplicationArea = Basic;
                    Caption = 'Extent Of Agrrement Measure Code';
                }
                field("Extent Description"; Rec."Extent Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Extent Of Agrrement Measure Description';
                }

                field("Respondent Answer"; Rec."Respondent Answer")
                {
                    ApplicationArea = Basic;
                }
                field("Measure Value"; Rec."Measure Value")
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

