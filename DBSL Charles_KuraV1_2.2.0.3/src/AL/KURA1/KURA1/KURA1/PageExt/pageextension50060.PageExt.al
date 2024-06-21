#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50060 "pageextension50060" extends "Requests to Approve"
{
    layout
    {
      addlast(Control1)
      {
        field("Employee No.";Rec."Employee No.")
        {
          ApplicationArea =Basic;
        }
        field("Employee Name";Rec."Employee Name")
        {
ApplicationArea =Basic;
        }
      }
      addafter(Details)
      {
          field(RecordDetails; Rec.RecordDetailsB)
            {
                Caption = 'Details';
                ApplicationArea = Basic;
            }
      }
        modify(Details)
        {
            Visible = false;
        }
        modify("Sender ID")
        {
            Visible = false;
        }
        addafter("Sender ID")
        {
            field("Sender ID1"; Rec."Last Modified By User ID")
            {
                Visible = true;
                caption = 'Sender ID';
            }
        }





        //Unsupported feature: Code Modification on "Approve(Action 19).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(ApprovalEntry);
        ApprovalsMgmt.ApproveApprovalRequests(ApprovalEntry);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //Force Mandatory Fields
        IF UserSetup.GET(USERID) THEN BEGIN
          IF UserSetup."Procurement Manager"=TRUE  THEN BEGIN
        PurchaseHeader.RESET;
        PurchaseHeader.SETRANGE(PurchaseHeader."No.","Document No.");
        PurchaseHeader.SETRANGE(PurchaseHeader."Document Type",PurchaseHeader."Document Type"::"Purchase Requisition");
        IF PurchaseHeader.FINDSET THEN
          REPEAT
           PurchaseHeader.TESTFIELD("Purchaser Code");
           PurchaseHeader.TESTFIELD("PP Solicitation Type");
          UNTIL PurchaseHeader.NEXT=0;
          END;
          END;
          //End Force mandatory fields
        IF CONFIRM('Are you sure you want to approve this document'+' '+"Document No."+'?') THEN BEGIN
        CurrPage.SETSELECTIONFILTER(ApprovalEntry);
        ApprovalsMgmt.ApproveApprovalRequests(ApprovalEntry);
        END
        ELSE
        EXIT;
        */
        //end;


        //Unsupported feature: Code Modification on "Reject(Action 2).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(ApprovalEntry);
        ApprovalsMgmt.RejectApprovalRequests(ApprovalEntry);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(ApprovalEntry);
        ApprovalsMgmt.RejectApprovalRequests(ApprovalEntry);


        CompanyInformation.GET;
        ApprovalEntry.RESET;
        ApprovalEntry.SETRANGE(ApprovalEntry."Document No.","Document No.");
        ApprovalEntry.SETRANGE(ApprovalEntry.Status,ApprovalEntry.Status::Approved);
        IF ApprovalEntry.FINDSET THEN BEGIN
          IF UserSetup.GET(ApprovalEntry."Approver ID") THEN BEGIN
            IF UserSetup."E-Mail" <> '' THEN BEGIN
               EmailNotifications.FnSendEmail(CompanyInformation."E-Mail",COMPANYNAME,UserSetup."E-Mail",'REJECTED APROVALS','This approval has been rejected'+ ' '+ApprovalEntry."Document No.");
              END;
            END;
          END;
        */
        //end;

    }

    var
        ApprovalEntry: Record "Approval Entry";
        UserSetup: Record "User Setup";
        EmailNotifications: Codeunit "Email Notifications";
        CompanyInformation: Record "Company Information";
        PurchaseHeader: Record "Purchase Header";
}

#pragma implicitwith restore

