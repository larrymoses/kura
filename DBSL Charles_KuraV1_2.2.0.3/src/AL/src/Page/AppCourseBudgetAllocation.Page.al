#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69334 "App. Course Budget Allocation"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Planning Line Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Type";"Training Type")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date";"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date";"Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Service Item";"Service Item")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item';
                }
                field("Service Item Description";"Service Item Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item Description';
                }
                field("Available Budget";"Available Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Budget Utilized";"Budget Utilized")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Budget";"Total Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Planned Budget";"Planned Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Planned No. to be Trained";"Planned No. to be Trained")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Planned Department";"Planned Department")
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

