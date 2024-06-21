
Page 72528 "Vehicle SuperV Requirements"
{
    ApplicationArea = Basic;
    Caption = 'PC SUM expenditures';
    CardPageID = "Vehicle SuperV Requirement C";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Temporary Supervision Requirem";
    UsageCategory = Documents;

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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Rejection Remarks"; Rec."Rejection Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Rejected By"; Rec."Rejected By")
                {
                    ApplicationArea = Basic;
                }
                field("Rejected DateTime"; Rec."Rejected DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned To:"; Rec."Assigned To:")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Links)
            {
            }
            systempart(Control13; Notes)
            {
            }
        }
    }

    actions
    {
    }
}



