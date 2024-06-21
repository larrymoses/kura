#pragma implicitwith disable
page 99666 "Workplan Summary of Bills"
{
    PageType = List;
    SourceTable = "WorkPlan Summary of Bills";
    PopulateAllFields =true;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan Type"; Rec."Workplan Type")
                {
                    ApplicationArea = Basic;
                }
                field("Workplan No"; Rec."Workplan No")
                {
                    ApplicationArea = Basic;
                }
                field("BoQ Template Code"; Rec."BoQ Template Code")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Bill Item Category Code"; Rec."Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                }
               
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
               
                field("Begin-Total Job Task No."; Rec."Begin-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("End-Total Job Task No."; Rec."End-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("No. of Bill Activities"; Rec."No. of Bill Activities")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ApplicationArea = Basic;
                }
               
                field("Region Code"; Rec."Region Code")
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

