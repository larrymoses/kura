#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57220 "Agency Notice"
{
    PageType = Card;
    SourceTable = "Agency Notice Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Notice Date";"Notice Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor PIN";"Contractor PIN")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No";"Contractor No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date Time";"Created Date Time")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(Lifted;Lifted)
                {
                    ApplicationArea = Basic;
                }
                field("Date Lifted";"Date Lifted")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Registration Number";"Payment Registration Number")
                {
                    ApplicationArea = Basic;
                }
                field("PRN Expiry Date";"PRN Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Discounting No.";"Bill Discounting No.")
                {
                    ApplicationArea = Basic;
                }
                field("Discounted Amount";"Discounted Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Discountable Amount";"Discountable Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Obligation WHT";"Obligation WHT")
                {
                    ApplicationArea = Basic;
                }
                field("Obligation VAT";"Obligation VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Obligation Income Tax";"Obligation Income Tax")
                {
                    ApplicationArea = Basic;
                    Caption = 'Obligation PAYE';
                }
                field("Obligation Total Amount";"Obligation Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("Reference No";"Reference No")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    TestField("Accountants Notified");
                    Posted:=true;
                    Modify;
                    Message('Agency notice %1 posted successfully',"Document No");
                end;
            }
            action(Lift)
            {
                ApplicationArea = Basic;
                Image = Lock;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    TestField(Status,Status::Released);
                    if UserSetup.Get(UserId) then begin
                      if not UserSetup."Principal Accountant" = true then begin
                        Error('You do not have permission to lift the agency notice.Please contact your system administrator');
                        end;
                      end;

                    Lifted:=true;
                    "Date Lifted":=Today;
                    Modify;
                    Message('The agency notice %1 has been lifted successfully',"Document No");
                end;
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;

                trigger OnAction()
                begin
                    TestField("Global Dimension 1 Code");
                    DMSManagement.UploadPaymentsDocuments("Document No",Format("Document Type"),RecordId,"Global Dimension 1 Code");
                end;
            }
            action(Unlift)
            {
                ApplicationArea = Basic;
                Image = Lock;
                Promoted = false;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    if UserSetup.Get(UserId) then begin
                      if not UserSetup."Amend Bank Account Details" = true then begin
                        Error('You do not have permission to unlift the agency notice.\\Please contact your system administrator');
                        end;
                      end;

                    Lifted:=false;
                    "Date Lifted":=Today;
                    Modify;
                    Message('The agency notice %1 has been Unlifted successfully',"Document No");
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Status:=Status::Released;
                    Modify;
                    Message('Agency notice %1 has been approved successfully',"Document No");
                end;
            }
            action("Notify Accountant")
            {
                ApplicationArea = Basic;
                Image = Alerts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // IF Status=Status::Open THEN
                    //  ERROR('The document must be approved');


                    //Notify the contractor
                    TestField(Status,Status::Released);
                     ProcurementProcessing.FnNotifyAgencyNotice(Rec);
                     "Accountants Notified":=true;
                     Modify(true);
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
        UserSetup: Record "User Setup";
        ProcurementProcessing: Codeunit "Procurement Processing";
}

