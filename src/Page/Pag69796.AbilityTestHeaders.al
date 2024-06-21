#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69796 "Ability Test Headers"
{
    Caption = 'Ability Test Headers';
    CardPageID = "Ability Test Header";
    PageType = List;
    SourceTable = "PreScreen Header";
    SourceTableView = where("Document Type" = filter("Ability Test Invitation"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Docu KKLKment No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test ID"; Rec."Ability Test ID")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Test Duration(Min)"; Rec."Maximum Test Duration(Min)")
                {
                    ApplicationArea = Basic;
                }
                field("Phone Interview Template ID"; Rec."Phone Interview Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
            }
            systempart(Control15; Notes)
            {
            }
            systempart(Control16; MyNotes)
            {
            }
            systempart(Control17; Links)
            {
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

