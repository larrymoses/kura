#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65143 "Inter Project Transfers"
{
    ApplicationArea = Basic;
    CardPageID = "Inter Project Transfer Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Inter_Project Transfer Header";
    SourceTableView = where(Posted=const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Description";"Posting Description")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No.";"External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Main Funds Bank A/C";"Main Funds Bank A/C")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer-To Job No";"Transfer-To Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer-To Task No";"Transfer-To Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer-To Income G/L A/C";"Transfer-To Income G/L A/C")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Total Transfer Amount";"Total Transfer Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Transfer Amount LCY";"Total Transfer Amount LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Transfe-To Directorate";"Transfe-To Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Transfe-To Department/Center";"Transfe-To Department/Center")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetRange("Created By",UserId);

        //Fred RC
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
          end;
    end;

    trigger OnAfterGetRecord()
    begin
        SetRange("Created By",UserId);

        //Fred RC
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
          end;
    end;

    trigger OnOpenPage()
    begin
        SetRange("Created By",UserId);

        //Fred RC
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
          end;
    end;

    var
        UserSetup: Record "User Setup";
}

