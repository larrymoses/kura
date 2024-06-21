#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57200 "AIE Fund Transfers Posted"
{
    ApplicationArea = Basic;
    CardPageID = "AIE Fund Transfer Card Posetd";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Inter Bank Transfer";
    SourceTableView = where("Document Type"=filter("AIE Funds Transfer"),
                            "AIE Posted"=filter(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Destination Bank Account No";"Destination Bank Account No")
                {
                    ApplicationArea = Basic;
                }
                field("Destination Bank Name";"Destination Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code";"Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Region Name";"Region Name")
                {
                    ApplicationArea = Basic;
                }
                field("Region Trasnsfered To";"Region Trasnsfered To")
                {
                    ApplicationArea = Basic;
                }
                field("Branch Code";"Branch Code")
                {
                    ApplicationArea = Basic;
                }
                field("Branch Name";"Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Code";"Constituency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Name";"Constituency Name")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Originating Trans. Voucher No";"Originating Trans. Voucher No")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Amount(LCY)";"Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date";"Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date";"Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time";"Created Time")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
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

    trigger OnAfterGetCurrRecord()
    begin
        if UserSetup.Get(UserId) then
          begin
            if not UserSetup."View AIE" then
              Error('You do not have the permissions to view AIEs');
          end;
    end;

    trigger OnAfterGetRecord()
    begin
        if UserSetup.Get(UserId) then
          begin
            if not UserSetup."View AIE" then
              Error('You do not have the permissions to view AIEs');
          end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"AIE Funds Transfer";
    end;

    trigger OnOpenPage()
    begin

        if UserSetup.Get(UserId) then
          begin
            if not UserSetup."View AIE" then
              Error('You do not have the permissions to view AIEs');
          end;
    end;

    var
        UserSetup: Record "User Setup";
}

