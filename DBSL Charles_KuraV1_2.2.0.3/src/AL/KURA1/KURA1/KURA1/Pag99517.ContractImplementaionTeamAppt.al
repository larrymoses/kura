/// <summary>
/// Page Contract ImplementaionTeamAppt (ID 99517).
/// </summary>

page 99517 ContractImplementationTeamApps
{
    ApplicationArea = All;
    Caption = 'Contract Implementation Team Appointments';
    PageType = List;
    SourceTable = "IFS Tender Committee";
    UsageCategory = Lists;
    CardPageId =ContractImplementationTeamAppt;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea=All;
                }
                 field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea=All;
                }
                   field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea=All;
                }
                   field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea=All;
                }
                   field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea=All;
                }
                   field("Appointment Effective Date"; Rec."Appointment Effective Date")
                {
                    ApplicationArea=All;
                }
                   field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ApplicationArea=All;
                }
            }
        }
    }
}


