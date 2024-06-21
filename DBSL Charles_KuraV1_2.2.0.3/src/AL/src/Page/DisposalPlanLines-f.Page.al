#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 70146 "Disposal Plan Lines-f"
{
    PageType = ListPart;
    SourceTable = "Disposal Plan Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Basic;
                }
                field("Description of Item"; Rec."Description of Item")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Issue"; Rec."Unit of Issue")
                {
                    ApplicationArea = Basic;
                    Caption = 'Unit of measure';
                    Visible = true;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Date Of Purchase"; Rec."Date Of Purchase")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Purchase Unit Price"; Rec."Purchase Unit Price")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Total Purchase Price"; Rec."Total Purchase Price")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Estimated current value"; Rec."Estimated current value")
                {
                    ApplicationArea = Basic;
                }
                // field("Total Estimated current value";"Total Estimated current value")
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                // }
                field("General Condition"; Rec."General Condition")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal committee Recommend"; Rec."Disposal committee Recommend")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Disposal Type"; Rec."Disposal Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Disposal Methods"; Rec."Disposal Methods")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}
