#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75257 "Bid Response List"
{
    ApplicationArea = Basic;
    CardPageID = "Bid Response Card";
    PageType = List;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter(Quote),
                            "Document Status" = filter(Draft));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to Name"; Rec."Pay-to Name")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Description"; Rec."Tender Description")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation For Supply No"; Rec."Invitation For Supply No")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice Type"; Rec."Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Envelope Type"; Rec."Bid Envelope Type")
                {
                    ApplicationArea = Basic;
                }
                field("PP Procurement Method"; Rec."PP Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Bid Seal Type"; Rec."Bid Seal Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        UserSetup.Get(UserId);
        //SETRANGE("Assigned User ID",USERID);
        //IF UserSetup."Procurement officer"=TRUE THEN
        // BEGIN
        //SETFILTER("Requester ID",USERID);
        // FILTERGROUP(2);
        //SETFILTER("Assigned User ID",USERID);
        //FILTERGROUP(0);
        //END;
    end;

    trigger OnOpenPage()
    begin
        IF UserSetup.GET(USERID) THEN
            Rec.SetFilter("Location Code", '=%1', UserSetup."Responsibility Center");
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

