#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57025 "Imprest Surrenders"
{
    ApplicationArea = Basic;
    CardPageID = "Imprest Surrender";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type"=const(Surrender),
                            Status=filter("Pending Approval"|Open),
                            "Document Type"=const(Surrender));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name";"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Amount";"Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type";"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imprest Issue Doc. No";"Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                }
                field("Reference No.";"Reference No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015;Notes)
            {
            }
            systempart(Control1000000016;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Reset;
                    SetRange("No.","No.");
                    Report.Run(57002,true,true);
                    Reset;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //Fred RC
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
         // SETRANGE("Created By",USERID);
          end;

        if UserSetup.Get(UserId) then begin
          if UserSetup."post surrender" = true then begin
            Reset;
            SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
            end;
          end;
    end;

    trigger OnAfterGetRecord()
    begin
        //Fred RC
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
           SetRange("Payment Type", "payment type"::Surrender);
          SetRange("Document Type", "document type"::Surrender);
          //SETRANGE(Status, Status::"Pending Approval")
         // SETRANGE("Created By",USERID);
          end;
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
          IF UserSetup."post surrender" = TRUE THEN BEGIN
            RESET;
            SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
            END;
          END;*/

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Imprest Type":="imprest type"::"Project Imprest";
        "Payment Type":="payment type"::Surrender;
        "Document Type":="document type"::Surrender;
    end;

    trigger OnOpenPage()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        // IF UserSetup."post surrender" =FALSE THEN
        // SETRANGE("Created By",USERID);
        // END;
        
        
        //Fred RC
        if UserSetup.Get(UserId) then begin
          SetRange("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
          SetRange("Payment Type", "payment type"::Surrender);
         SetRange("Document Type", "document type"::Surrender);
          //SETRANGE(Status, Status::"Pending Approval")
          //SETRANGE("Created By",USERID);
          end;
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
          IF UserSetup."post surrender" = TRUE THEN BEGIN
            RESET;
            SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
            END;
          END;
          */

    end;

    var
        UserSetup: Record "User Setup";
}

