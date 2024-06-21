#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69313 "Course Budget Allocation"
{
    PageType = ListPart;
    SourceTable = "Planning Line Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Type"; Rec."Training Type")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Service Item"; Rec."Service Item")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item';
                }
                field("Service Item Description"; Rec."Service Item Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item Description';
                }
                field("Available Budget"; Rec."Available Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Budget Utilized"; Rec."Budget Utilized")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Budget"; Rec."Total Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Planned Budget"; Rec."Planned Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Planned No. to be Trained"; Rec."Planned No. to be Trained")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Planned Department"; Rec."Planned Department")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No."; Rec."Employee No.") { ApplicationArea = basic; }
                field("Employee Name"; Rec."Employee Name") { ApplicationArea = basic; }
                field("Location"; rec."Location") { ApplicationArea = basic; }
                field("Location Name"; rec."Location Name") { ApplicationArea = basic; }
            }
        }
    }
    actions
    {
    }
}

#pragma implicitwith restore

