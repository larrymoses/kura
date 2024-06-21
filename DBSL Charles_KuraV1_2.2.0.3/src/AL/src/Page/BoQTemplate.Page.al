#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72183 "BoQ Template"
{
    PageType = Card;
    SourceTable = "Purchase Requisition Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Road Project Category"; Rec."Road Project Category")
                {
                    ApplicationArea = Basic;
                }
                field("Works Category"; Rec."Works Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Works Category';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if Rec.Type = Rec.Type::Standard then
                           ;// PBRMVisible := true;
                    end;
                }

                field("PBRM BoQ"; Rec."PBRM BoQ")
                {
                    ApplicationArea = Basic;
                }

                field("Effective Start Date"; Rec."Effective Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Effective End Date"; Rec."Effective End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Variation of Price Rate(%)"; Rec."Variation of Price Rate(%)")
                {
                    ApplicationArea = basic;
                }
                field("Variation of Price Amount"; Rec."Variation of Price Amount")
                {
                    ApplicationArea = basic;
                }
                field("Contingency Rate(%)"; Rec."Contingency Rate(%)")
                {
                    ApplicationArea = basic;
                }
                field("Contingency Amount"; Rec."Contingency Amount")
                {
                    ApplicationArea = basic;
                }
                field("Default VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = basic;
                }

                field("Default VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = basic;
                }
                field("Total Amount Excl.VAT"; Rec."Total Amount Excl.VAT")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = basic;
                }
                field("Total Estimated Bid Sum 1"; Rec."Total Estimated Bid Sum 1")
                {
                    ApplicationArea = basic;
                }

            }

            part(Control16; "BoQ Template Line")
            {
                SubPageLink = "Requisition Template ID" = field(Code);
            }
            part(Control17; "BoQ Template Bill Codes")
            {
                SubPageLink = "BoQ Template Code" = field(Code);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Work Categories")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Category;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "BoQ Template Work Category";
                RunPageLink = "BoQ Template Code" = field(Code);
            }
            action("Bill Item Categories")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Category;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "BoQ Template Bill Codes";
                RunPageLink = "BoQ Template Code" = field(Code);
            }
            action("Copy From Template")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Copy;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(72009, true, true, Rec);
                end;
            }
            action("Suggest Template Liens")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //  RMS.SuggestBoQTemplateLines(Rec);
                end;
            }
            action("Copy To Template")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Copy;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(72009, true, true, Rec);
                end;
            }
            action("Generate Project BOQ")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    RMS.FNGenerateProjectBoq(Rec);
                    //  RMS.FnCopyRecordLinks(Code, Code, Rec);
                    //Fred Append the links to the newly created memo so that the user doesnt have to attach again

                    /*RecordLink.RESET;
                    RecordLink.SETCURRENTKEY("Document No");
                    RecordLink.SETRANGE(RecordLink."Document No",Code);
                    IF RecordLink.FINDSET THEN BEGIN
                    REPEAT
                      LinkIDNo:=0;
                      RecordLink.RESET;
                      IF RecordLink.FINDLAST THEN
                      LinkIDNo:=RecordLink."Link ID"+1
                      ELSE
                      LinkIDNo:=1;
                    ObjRecordLink.INIT;
                    ObjRecordLink."Link ID":=ObjRecordLink.COUNT+1;
                    ObjRecordLink."Record ID":=Rec.RECORDID;
                    ObjRecordLink.URL1:=RecordLink.URL1;
                    ObjRecordLink.URL2:=RecordLink.URL2;
                    ObjRecordLink.URL3:=RecordLink.URL3;
                    ObjRecordLink.URL4:=RecordLink.URL4;
                    ObjRecordLink.Description:=RecordLink.Description;
                    ObjRecordLink.Type:=RecordLink.Type;
                    ObjRecordLink.Note:=RecordLink.Note;
                    ObjRecordLink.Created:=CURRENTDATETIME;
                    ObjRecordLink."User ID":=USERID;
                    ObjRecordLink.Company:=COMPANYNAME;
                    ObjRecordLink.Notify:=RecordLink.Notify;
                    ObjRecordLink."To User ID":=RecordLink."To User ID";
                    ObjRecordLink."Base URL":=RecordLink."Base URL";
                    ObjRecordLink."Document No":=Rec.Code;
                    ObjRecordLink."Fetch To Sharepoint":=RecordLink."Fetch To Sharepoint";
                    ObjRecordLink."Uploaded To SharePoint":=RecordLink."Uploaded To SharePoint";
                    ObjRecordLink."SP URL Returned":=RecordLink."SP URL Returned";
                    ObjRecordLink.Polled:=RecordLink.Polled;
                    ObjRecordLink."Failure reason":=RecordLink."Failure reason";
                    ObjRecordLink.LocalUrl:=RecordLink.LocalUrl;
                    ObjRecordLink.INSERT;
                    UNTIL RecordLink.NEXT=0;
                    END;*/
                    //End Fred Append the links to the newly created memo so that the user doesnt have to attach again

                end;
            }
            action("Generate Engineer Estimates")
            {
                ApplicationArea = Basic;
                Enabled = Rec.Status = Rec.Status::Released;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //  RMS.FNGenerateEngEst(Rec);
                    //RMS.FnCopyRecordLinks(Code,Rec.RECORDID);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::"Pending Approval";
                    Message('BoQ sent for approval successfully');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;
                    Dialog.Message('Document Approved Successfully');
                end;
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Draft Tender Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;

                trigger OnAction()
                begin
                    //TESTFIELD("Shortcut Dimension 1 Code");
                    DMSManagement.UploadStaffClaimDocuments(DMSDocuments."document type"::"Staff Claim", Rec.Code, 'BoQ Template', Rec.RecordId, 'R48');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Template Type" := Rec."template type"::BoQ;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        RMS: Codeunit "RMS Management";
        PBRMVisible: Boolean;
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";
        RecordLink: Record "Record Link";
        ObjRecordLink: Record "Record Link";
        LinkIDNo: Integer;

    local procedure SetControlAppearance()
    var
    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        if Rec.Type = Rec.Type::Standard then
            PBRMVisible := true;
    end;
}

#pragma implicitwith restore

