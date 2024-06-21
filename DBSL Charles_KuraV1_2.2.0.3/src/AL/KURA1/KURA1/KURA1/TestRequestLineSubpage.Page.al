#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

Page 72650 "Test Request Line Subpage"
{
    PageType = ListPart;
    SourceTable = "Test Request Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Site Instruction No."; Rec."Site Instruction No.")
                {
                    ApplicationArea=Basic;
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Total Done Todate"; Rec."Total Done Todate")
                {
                    ApplicationArea = Basic;
                }
                field("Works Start Chainage(KM)"; Rec."Works Start Chainage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chanage(KM)"; Rec."Works End Chanage(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Tests Required"; Rec."Tests Required")
                {
                    ApplicationArea = Basic;
                }
                field("Foreman ID"; Rec."Foreman ID")
                {
                    ApplicationArea = Basic;
                }
                field("Foreman Name"; Rec."Foreman Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
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



