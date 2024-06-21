#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57209 "Acknowledged AIE Details"
{
    ApplicationArea = Basic;
    Caption = 'AIE Lines';
    Editable = false;
    PageType = Document;
    SourceTable = "Inter Bank Transfer Line";
    SourceTableView = where(Acknowledged=filter(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Constituency Code';
                }
                field("Funding Source";"Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code";"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Acknowledged By";"Acknowledged By")
                {
                    ApplicationArea = Basic;
                }
                field("Acknowledgement Datetime";"Acknowledgement Datetime")
                {
                    ApplicationArea = Basic;
                }
                field(Acknowledged;Acknowledged)
                {
                    ApplicationArea = Basic;
                }
                field("Bank Account No";"Bank Account No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer To';
                }
                field("Bank Account Name";"Bank Account Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer To Name';
                    Editable = false;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Receivable Account(Region)";"Receivable Account(Region)")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Reference";"Payment Reference")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Amount(LCY)";"Amount(LCY)")
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
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension=R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Image = Dimensions;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    ShowDimensions;
                end;
            }
            action(Acknowledge)
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(InterBankTransferLine);
                    if InterBankTransferLine.FindSet then begin
                      repeat
                       "Acknowledged By":=UserId;
                        "Acknowledgement Datetime":=CurrentDatetime;
                        InterBankTransferLine.Modify(true);
                    
                      until InterBankTransferLine.Next = 0;
                      Clear(InterBankTransferLine);
                     end;
                     Message('Acknowledgements done');
                    
                    /*
                    RESET;
                    SETRANGE("Document No","Document No");
                    SETRANGE("Document Type","Document Type");
                    IF FINDSET THEN BEGIN
                      "Acknowledged By":=USERID;
                      "Acknowledgement Datetime":=CREATEDATETIME(TODAY,TIME);
                      MODIFY(TRUE);
                      END;
                      RESET;
                    */

                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = PostPrint;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("Document No","Document No");
                    SetFilter("Responsibility Center","Responsibility Center");
                    if FindSet then
                      Report.Run(57094,true,false,Rec);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if UserSetup.Get(UserId) then begin
          SetRange("Shortcut Dimension 1 Code",UserSetup."Purchase Resp. Ctr. Filter");
          end;
    end;

    trigger OnAfterGetRecord()
    begin
        if UserSetup.Get(UserId) then begin
          SetRange("Shortcut Dimension 1 Code",UserSetup."Purchase Resp. Ctr. Filter");
          end;
    end;

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
          Rec.SetRange("Shortcut Dimension 1 Code",UserSetup."Purchase Resp. Ctr. Filter");
          end;
    end;

    var
        ShortcutDimCode: array [8] of Code[20];
        UserSetup: Record "User Setup";
        InterBankTransferLine: Record "Inter Bank Transfer Line";
}

