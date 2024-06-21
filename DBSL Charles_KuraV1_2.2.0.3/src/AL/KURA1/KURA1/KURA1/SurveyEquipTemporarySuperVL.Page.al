#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 99533 "SurveyEquip Temporary SuperV L"
{
    Caption = 'Survey Equipment Temporary Supervision Requirement';
    CardPageID = "SurveyEquip Temp SuperV C";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Temporary Supervision Requirem";
    SourceTableView = where("Document Type" = filter("Survey Equipment"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan"; Rec."Work Execution Plan")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
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

