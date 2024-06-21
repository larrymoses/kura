#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75313 "Approved Quotations(RFQ)"
{
    ApplicationArea = Basic;
    Caption = 'Request For Quotations (RFQ)';
    CardPageID = "Request For Quotation (RFQ)";
    Editable = false;
    PageType = List;
    SourceTable = "Standard Purchase Code";
    SourceTableView = where("Procurement Method" = const(RFQ),
                            Status = const(Released));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; "Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type"; "Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; "External Document No")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Outlook)
            {
            }
            systempart(Control8; Notes)
            {
            }
            systempart(Control9; MyNotes)
            {
            }
            systempart(Control10; Links)
            {
            }
        }
    }

    actions
    {

    }
    trigger OnOpenPage()
    begin
        IF UserSetup.GET(USERID) THEN
            Rec.SetFilter("Location Code", '=%1', UserSetup."Responsibility Center");
    end;

    var
        UserSetup: Record "User Setup";
}

