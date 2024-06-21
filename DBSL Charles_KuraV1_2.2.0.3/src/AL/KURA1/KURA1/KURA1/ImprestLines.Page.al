#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57013 "Imprest Lines"
{
    DeleteAllowed = true;
    PageType = ListPart;
    SourceTable = "Imprest Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Advance Type"; Rec."Advance Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    editable = false;
                }
                field("Daily Rate"; Rec."Daily Rate")
                {
                    ApplicationArea = Basic;
                    editable = (rec.status = rec.Status::Open);
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                    editable = (rec.status = rec.Status::Open);
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ConvertedAmount;Rec.ConvertedAmount)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }
    var
        imheader: record "payments";

    trigger OnAfterGetRecord()
    begin
        //cc
        imheader.reset;
        imheader.SetRange(imheader."No.", rec.No);
        if imheader.findset then
            if imheader.Status = imheader.Status::Released then
                currpage.Editable := false;
        //cc
    end;

    trigger OnOpenPage()
    var
        imheader: record "payments";
    begin

        //cc
        REC.Validate("Daily Rate");
        REC.Validate("No. of Days");
    end;
}

#pragma implicitwith restore

