#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
/// <summary>
/// Page Tender Evaluation Card (ID 70097).
/// </summary>
Page 70097 "Tender Evaluation Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type" = const(Tender),
                            Status = filter(<> "Pending Approval"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Title)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition No"; "Requisition No")
                {
                    ApplicationArea = Basic;
                    // TableRelation = "Purchase Line" where(Committed = filter(false),
                    //                                       "Process Type" = filter('RFP'));
                }
                field("Procurement Plan No"; "Procurement Plan No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; "Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; "Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Type"; "Tender Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Type';
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Category"; "Supplier Category")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Issued Date"; "Issued Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Closing Date"; "Tender Closing Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Closing Date';
                }
                field("Validity Period"; "Validity Period")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Opening Date"; "Tender Opening Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Opening Date';
                }
                field("Extended Date"; "Extended Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Status"; "Tender Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Status';
                }
                field("No of Tender Documents"; "No of Tender Documents")
                {
                    ApplicationArea = Basic;
                }
                field("Generate Multiple LPO"; "Generate Multiple LPO")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Amount"; "Tender Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Amount';
                }
                field("Tender Committee"; "Tender Committee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Committee';
                }
                field("Technical Score"; "Technical Score")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Score"; "Financial Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Evaluation Admin"; "Evaluation Admin")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Request for Quotation")
            {
                Caption = 'Request for Quotation';
                action(Evaluators)
                {
                    ApplicationArea = Basic;
                    Caption = 'Add Evaluators';
                    Image = BusinessRelation;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Procurement Evaluators";
                    RunPageLink = tenderno = field(No);
                    Visible = Seeevaladmin;
                }
                action("<Send Approval Request>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        rfpevalrec: Record "RFQ Evaluation Lists";
                        filesrec2: Record "Document Attachment";
                        docrec: Record "Document Attachment";
                    begin
                        TestField("Technical Score");
                        TestField(Title);
                        //============================================================verify existance of preriquisites
                        rfpevalrec.Reset;
                        rfpevalrec.SetFilter(rfpevalrec."RFP No.", No);
                        rfpevalrec.SetFilter(rfpevalrec."Evaluation Type", '%1', rfpevalrec."evaluation type"::Mandatory);
                        if not rfpevalrec.FindSet then begin
                            Error('Please Fill the Mandatory Requirements!!!');
                        end;
                        rfpevalrec.Reset;
                        rfpevalrec.SetFilter(rfpevalrec."RFP No.", No);
                        rfpevalrec.SetFilter(rfpevalrec."Evaluation Type", '%1', rfpevalrec."evaluation type"::Technical);
                        if not rfpevalrec.FindSet then begin
                            Error('Please Fill the Technical Requirements!!!');
                        end;

                        filesrec2.Reset;
                        filesrec2.SetFilter(filesrec2."No.", No);
                        if not filesrec2.FindSet then begin
                            Error('Please Attach Documents for RFP %1', No);
                        end;
                        //=============================================================================================
                        //====================================================================================
                        reqlist.Reset;
                        reqlist.SetFilter(reqlist."No.", "Requisition No");
                        if reqlist.FindSet then begin
                            requser := reqlist."Requester ID";

                            Usersetuprec.Reset;
                            Usersetuprec.Get(requser);
                            useremail1 := Usersetuprec."E-Mail";

                            approvatemprec.Reset;
                            approvatemprec.SetFilter(approvatemprec."Document No.", '%1', "Requisition No");
                            approvatemprec.SetFilter(approvatemprec."Sequence No.", '%1', 2);
                            if approvatemprec.FindSet then begin
                                Approveruser := approvatemprec."Approver ID";

                                Usersetuprec.Reset;
                                Usersetuprec.Get(Approveruser);
                                useremail2 := Usersetuprec."E-Mail";

                                //====================================================================
                                smtprec.Reset;
                                smtprec.Get;

                                mailheader := 'RE: RFQ NO:  ' + No;
                                mailbody := 'Dear Sir/Madam<br><br>';
                                mailbody := mailbody + 'Please Find Attached RFQ Document(s) for your review.<br><br>Kindly submit any comments on the same within 24 hours.<br><br>';
                                mailbody := mailbody + 'If you do not submit any Comments within 24 hours the Procurement Process will Continue.<br<br>';
                                mailbody := mailbody + '<br><br><i>This E-mail is sent to you because you Approved or Raised the Requisition No: <b>' + reqlist."No." + '</b> Which formed the basis of creating this RFQ Document</i><br><br>';
                                mailbody := mailbody + 'Kind Regards<br><br>';

                                // smtpcu.CreateMessage('RFQ Team', smtprec."User ID", useremail1, mailheader, mailbody, true);

                                // docrec.Reset;
                                // docrec.SetFilter(docrec."No.", No);
                                // if docrec.FindSet then
                                //     repeat
                                //         //smtpcu.AddAttachment(docrec.Export(true), '');
                                //     until docrec.Next = 0;

                                // smtpcu.AddCC(useremail2 + ';kibetbriann@gmail.com');
                                // smtpcu.Send();


                                //=====================================put on queue=================
                                /*schedulerec.RESET;
                                schedulerec.SETFILTER(schedulerec."Document No",No);
                                IF schedulerec.FINDSET THEN BEGIN
                                   schedulerec.DELETEALL;
                                END;
                                schedulerec.RESET;
                                schedulerec.INIT;
                                schedulerec."Document No":=No;
                                schedulerec.Date:=CALCDATE('1D',TODAY);
                                schedulerec.time:= TIME;
                                schedulerec.INSERT;*/

                                Message('Email sent & Job Queue Entries setup successfully...');
                                //====================================================================
                            end;
                        end;
                        //====================================================================================
                        //ApprovalMgt.SendProcApprovalRequestRFP(Rec);

                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.CancelProcApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                action("Start Mandatory Evaluation")
                {
                    ApplicationArea = Basic;
                    Image = Migration;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = Seeevaladmin2;

                    trigger OnAction()
                    var
                        evalrec: Record "Procurement Evaluators";
                        userrec: Record "User Setup";
                        smtpcu: Codeunit Mail;
                        smtprec: Record "Email Account";
                        evalusers: array[8] of Text;
                        evalmails: array[8] of Text;
                        Evaltxtmails: Text;
                        Evalbody: Text;
                    begin
                        //=============================================================Email Evaluators
                        evalrec.Reset;
                        evalrec.SetFilter(evalrec.tenderno, No);
                        if evalrec.FindSet then begin
                            evalusers[1] := evalrec."Evaluator 1";
                            evalusers[2] := evalrec."Evaluator 2";
                            evalusers[3] := evalrec."Evaluator 3";
                            evalusers[4] := evalrec."Evaluator 4";
                            evalusers[5] := evalrec."Evaluator 5";
                            evalusers[6] := evalrec."Evaluator 6";
                            evalusers[7] := evalrec."Evaluator 7";
                            evalusers[8] := evalrec."Evaluator 8";
                            userrec.Reset;
                            if userrec.Get(evalusers[1]) then begin
                                evalmails[1] := userrec."E-Mail";
                                Evaltxtmails := evalmails[1];
                            end;
                            if userrec.Get(evalusers[2]) then begin
                                evalmails[2] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[2];
                            end;
                            if userrec.Get(evalusers[3]) then begin
                                evalmails[3] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[3];
                            end;
                            if userrec.Get(evalusers[4]) then begin
                                evalmails[4] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[4];
                            end;
                            if userrec.Get(evalusers[5]) then begin
                                evalmails[5] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[5];
                            end;
                            if userrec.Get(evalusers[6]) then begin
                                evalmails[6] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[6];
                            end;
                            if userrec.Get(evalusers[7]) then begin
                                evalmails[7] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[7];
                            end;
                            if userrec.Get(evalusers[8]) then begin
                                evalmails[8] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[8];
                            end;

                            // //error('%1..',Evaltxtmails);
                            // Evalbody := 'Dear Sir/Madam<br><br>You have been added as an Evaluator for RFP No: ' + No + '.<br><br>Kind Regards<br><br>';
                            // smtprec.Get;
                            // smtpcu.CreateMessage('NEMA Bidding Evaluation', smtprec."User ID", Evaltxtmails, No + ' EVALUATION', Evalbody, true);
                            // //smtpcu.Send  //Remove comment...


                        end;
                        //Error('...');
                        Message('Evaluators have been notified on E-mail...');
                        //=============================================================================
                        //=======================================================
                        //RFPREC.RESET;
                        //RFPREC.GET("Ref No.");
                        //IF RFPREC."Minutes Path"='' THEN BEGIN
                        //   ERROR('Please Attach Minutes First!!!');
                        //END;
                        //======================================================
                        Biddersrec.Reset;
                        Biddersrec.SetFilter(Biddersrec."Ref No.", No);
                        if Biddersrec.FindSet then
                            repeat
                                Biddersrec."visible?" := true;
                                Biddersrec.Modify;
                            until Biddersrec.Next = 0;
                        //error('tumefika hapa...');
                        //====================================================Mandatory Evaluation....
                        MandatoryReq.Reset;
                        MandatoryReq.SetRange(MandatoryReq."RFP No.", No);
                        MandatoryReq.SetRange(MandatoryReq."Evaluation Type", MandatoryReq."evaluation type"::Mandatory);
                        if MandatoryReq.Find('-') then
                            repeat
                                Biddersrec.Reset;
                                Biddersrec.SetFilter(Biddersrec."Ref No.", No);
                                if Biddersrec.FindSet then
                                    repeat

                                        BidderMandatory.Reset;
                                        BidderMandatory.SetFilter(BidderMandatory."Tender No", No);
                                        BidderMandatory.SetFilter(BidderMandatory."Company Name", Biddersrec.Name);
                                        BidderMandatory.SetFilter(BidderMandatory.Specification, MandatoryReq.Description);
                                        BidderMandatory.SetFilter(BidderMandatory.Technical, '<>%1', true);
                                        if BidderMandatory.FindSet then
                                            repeat
                                                BidderMandatory.Delete;
                                            until BidderMandatory.Next = 0;
                                        //message('%1..%2',MandatoryReq.Description,Biddersrec.Name);
                                        //================================================================
                                        //{
                                        evaluatorsrec.Reset;
                                        evaluatorsrec.SetFilter(evaluatorsrec.tenderno, No);
                                        if evaluatorsrec.FindSet then begin
                                            if evaluatorsrec."Evaluator 1" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 1";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 2" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 2";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 3" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 3";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 4" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 4";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 5" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 5";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 6" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 6";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 7" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 7";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 8" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := No;
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 8";
                                                BidderMandatory.Insert;
                                            end;
                                        end;

                                    //  }
                                    //==============================================================
                                    until Biddersrec.Next = 0;
                            until MandatoryReq.Next = 0;
                        Message('Mandatory Evaluation can begin...');
                        "Mandatory started?" := true;
                        //============================================================================
                        CurrPage.Close;
                    end;
                }
                action("Mandatory Evaluation Window")
                {
                    ApplicationArea = Basic;
                    Image = Evaluate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Mandatory Evaluation Window";
                    RunPageLink = "Tender No" = field(No);
                    Visible = Seeevalwindow;
                }
                action("Start Technical Specification")
                {
                    ApplicationArea = Basic;
                    Image = SuggestVendorBills;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        procrec: Record "Procurement Request";
                    begin
                        //====================================================Mandatory Evaluation....
                        //ERROR('%1',"Tender No");


                        MandatoryReq.Reset;
                        MandatoryReq.SetFilter(MandatoryReq."RFP No.", '%1', No);
                        MandatoryReq.SetFilter(MandatoryReq."Evaluation Type", '%1', MandatoryReq."evaluation type"::Technical);
                        //MandatoryReq.SETFILTER(MandatoryReq."Line No",'%1',10);
                        if MandatoryReq.FindSet then
                            repeat
                                //message('%1',MandatoryReq.Description);
                                Biddersrec.Reset;
                                Biddersrec.SetFilter(Biddersrec."Ref No.", No);
                                if Biddersrec.FindSet then
                                    repeat

                                        BidderMandatory.Reset;
                                        BidderMandatory.SetFilter(BidderMandatory."Tender No", No);
                                        BidderMandatory.SetFilter(BidderMandatory."Company Name", Biddersrec.Name);
                                        BidderMandatory.SetFilter(BidderMandatory.Technical, '%1', true);
                                        if BidderMandatory.FindSet then begin
                                            BidderMandatory.Delete;
                                        end;

                                        //================================================================
                                        BidderMandatory2.Reset;
                                        BidderMandatory2.SetFilter(BidderMandatory2."Tender No", No);
                                        BidderMandatory2.SetFilter(BidderMandatory2."Company Name", '%1', Biddersrec.Name);
                                        if BidderMandatory2.FindSet then
                                            repeat
                                                Biddersrec."Failed Mandatory" := false;
                                                if BidderMandatory2.Complied = false then begin
                                                    Biddersrec."Failed Mandatory" := true;
                                                    Biddersrec.Modify;
                                                end;
                                                Biddersrec.Modify;
                                            until BidderMandatory2.Next = 0;
                                        if Biddersrec."Failed Mandatory" = false then begin

                                            evaluatorsrec.Reset;
                                            evaluatorsrec.SetFilter(evaluatorsrec.tenderno, No);
                                            if evaluatorsrec.FindSet then begin
                                                if evaluatorsrec."Evaluator 1" <> '' then begin
                                                    BidderMandatory.Reset;
                                                    BidderMandatory.Init;
                                                    BidderMandatory."Tender No" := No;
                                                    BidderMandatory."Company Name" := Biddersrec.Name;
                                                    BidderMandatory.Specification := MandatoryReq.Description;
                                                    BidderMandatory."Technical score" := 0;
                                                    BidderMandatory.Remarks := '';
                                                    BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                    BidderMandatory.Technical := true;
                                                    BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 1";
                                                    BidderMandatory.Insert;
                                                end;
                                                if evaluatorsrec."Evaluator 2" <> '' then begin
                                                    BidderMandatory.Reset;
                                                    BidderMandatory.Init;
                                                    BidderMandatory."Tender No" := No;
                                                    BidderMandatory."Company Name" := Biddersrec.Name;
                                                    BidderMandatory.Specification := MandatoryReq.Description;
                                                    BidderMandatory."Technical score" := 0;
                                                    BidderMandatory.Remarks := '';
                                                    BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                    BidderMandatory.Technical := true;
                                                    BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 2";
                                                    BidderMandatory.Insert;
                                                end;
                                                if evaluatorsrec."Evaluator 3" <> '' then begin
                                                    BidderMandatory.Reset;
                                                    BidderMandatory.Init;
                                                    BidderMandatory."Tender No" := No;
                                                    BidderMandatory."Company Name" := Biddersrec.Name;
                                                    BidderMandatory.Specification := MandatoryReq.Description;
                                                    BidderMandatory."Technical score" := 0;
                                                    BidderMandatory.Remarks := '';
                                                    BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                    BidderMandatory.Technical := true;
                                                    BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 3";
                                                    BidderMandatory.Insert;
                                                end;
                                                if evaluatorsrec."Evaluator 4" <> '' then begin
                                                    BidderMandatory.Reset;
                                                    BidderMandatory.Init;
                                                    BidderMandatory."Tender No" := No;
                                                    BidderMandatory."Company Name" := Biddersrec.Name;
                                                    BidderMandatory.Specification := MandatoryReq.Description;
                                                    BidderMandatory."Technical score" := 0;
                                                    BidderMandatory.Remarks := '';
                                                    BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                    BidderMandatory.Technical := true;
                                                    BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 4";
                                                    BidderMandatory.Insert;
                                                end;
                                                if evaluatorsrec."Evaluator 5" <> '' then begin
                                                    BidderMandatory.Reset;
                                                    BidderMandatory.Init;
                                                    BidderMandatory."Tender No" := No;
                                                    BidderMandatory."Company Name" := Biddersrec.Name;
                                                    BidderMandatory.Specification := MandatoryReq.Description;
                                                    BidderMandatory."Technical score" := 0;
                                                    BidderMandatory.Remarks := '';
                                                    BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                    BidderMandatory.Technical := true;
                                                    BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 5";
                                                    BidderMandatory.Insert;
                                                end;
                                                if evaluatorsrec."Evaluator 6" <> '' then begin
                                                    BidderMandatory.Reset;
                                                    BidderMandatory.Init;
                                                    BidderMandatory."Tender No" := No;
                                                    BidderMandatory."Company Name" := Biddersrec.Name;
                                                    BidderMandatory.Specification := MandatoryReq.Description;
                                                    BidderMandatory."Technical score" := 0;
                                                    BidderMandatory.Remarks := '';
                                                    BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                    BidderMandatory.Technical := true;
                                                    BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 6";
                                                    BidderMandatory.Insert;
                                                end;
                                                if evaluatorsrec."Evaluator 7" <> '' then begin
                                                    BidderMandatory.Reset;
                                                    BidderMandatory.Init;
                                                    BidderMandatory."Tender No" := No;
                                                    BidderMandatory."Company Name" := Biddersrec.Name;
                                                    BidderMandatory.Specification := MandatoryReq.Description;
                                                    BidderMandatory."Technical score" := 0;
                                                    BidderMandatory.Remarks := '';
                                                    BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                    BidderMandatory.Technical := true;
                                                    BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 7";
                                                    BidderMandatory.Insert;
                                                end;
                                                if evaluatorsrec."Evaluator 8" <> '' then begin
                                                    BidderMandatory.Reset;
                                                    BidderMandatory.Init;
                                                    BidderMandatory."Tender No" := No;
                                                    BidderMandatory."Company Name" := Biddersrec.Name;
                                                    BidderMandatory.Specification := MandatoryReq.Description;
                                                    BidderMandatory."Technical score" := 0;
                                                    BidderMandatory.Remarks := '';
                                                    BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                    BidderMandatory.Technical := true;
                                                    BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 8";
                                                    BidderMandatory.Insert;
                                                end;

                                            end;
                                            j += 1;
                                        end;
                                    //==============================================================
                                    until Biddersrec.Next = 0;
                            until MandatoryReq.Next = 0;
                        if j > 1 then begin
                            Message('Technical Evaluation can begin in a separate Window...');
                            procrec.Reset;
                            procrec.Get(No);
                            procrec."Technical started?" := true;
                            procrec.Modify;
                        end;
                        if j = 0 then begin
                            Message('No Bidder has qualified');
                        end;

                        //============================================================================
                    end;
                }
                action("Technical Evaluation Window")
                {
                    ApplicationArea = Basic;
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Technical Evaluation Window";
                    RunPageLink = "Tender No" = field(No);
                    Visible = technicalwindow;
                }
                action("View Evaluation Report")
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        reportrec: Record "Bidder Mandatory Requirements";
                    begin
                        reportrec.Reset;
                        reportrec.SetFilter(reportrec."Tender No", No);
                        if reportrec.FindSet then begin
                            Report.Run(70008, true, false, reportrec);
                        end;
                    end;
                }
                action("Recommend Winner")
                {
                    ApplicationArea = Basic;
                    Image = Salutation;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Bid Winner";
                    RunPageLink = "Ref No." = field(No),
                                  "Failed Mandatory" = const(false);
                    Visible = Recommendwinnerwindow;
                }
                action("Proceed to Award")
                {
                    ApplicationArea = Basic;
                    Image = SalutationFormula;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = winnerrecommended;

                    trigger OnAction()
                    var
                        evalrec: Record "Procurement Evaluators";
                        userrec: Record "User Setup";
                        smtpcu: Codeunit Mail;
                        smtprec: Record "Email Account";
                        evalusers: array[8] of Text;
                        evalmails: array[8] of Text;
                        Evaltxtmails: Text;
                        Evalbody: Text;
                    begin
                        conftxt := Confirm('Are you sure you want to Proceed to Award level?');
                        if Format(conftxt) = 'Yes' then begin
                            if minutesbeforeproceedtoaward = '' then begin
                                Error('You cannot Proceed to Award Without Attaching Minutes!!!');
                            end;
                            "Award Started" := true;
                            //=====================================================
                            //=============================================================Email Evaluators
                            evalrec.Reset;
                            evalrec.SetFilter(evalrec.tenderno, No);
                            if evalrec.FindSet then begin
                                evalusers[1] := evalrec."Evaluator 1";
                                evalusers[2] := evalrec."Evaluator 2";
                                evalusers[3] := evalrec."Evaluator 3";
                                evalusers[4] := evalrec."Evaluator 4";
                                evalusers[5] := evalrec."Evaluator 5";
                                evalusers[6] := evalrec."Evaluator 6";
                                evalusers[7] := evalrec."Evaluator 7";
                                evalusers[8] := evalrec."Evaluator 8";
                                userrec.Reset;
                                if userrec.Get(evalusers[1]) then begin
                                    evalmails[1] := userrec."E-Mail";
                                    Evaltxtmails := evalmails[1];
                                end;
                                if userrec.Get(evalusers[2]) then begin
                                    evalmails[2] := userrec."E-Mail";
                                    Evaltxtmails := Evaltxtmails + ';' + evalmails[2];
                                end;
                                if userrec.Get(evalusers[3]) then begin
                                    evalmails[3] := userrec."E-Mail";
                                    Evaltxtmails := Evaltxtmails + ';' + evalmails[3];
                                end;
                                if userrec.Get(evalusers[4]) then begin
                                    evalmails[4] := userrec."E-Mail";
                                    Evaltxtmails := Evaltxtmails + ';' + evalmails[4];
                                end;
                                if userrec.Get(evalusers[5]) then begin
                                    evalmails[5] := userrec."E-Mail";
                                    Evaltxtmails := Evaltxtmails + ';' + evalmails[5];
                                end;
                                if userrec.Get(evalusers[6]) then begin
                                    evalmails[6] := userrec."E-Mail";
                                    Evaltxtmails := Evaltxtmails + ';' + evalmails[6];
                                end;
                                if userrec.Get(evalusers[7]) then begin
                                    evalmails[7] := userrec."E-Mail";
                                    Evaltxtmails := Evaltxtmails + ';' + evalmails[7];
                                end;
                                if userrec.Get(evalusers[8]) then begin
                                    evalmails[8] := userrec."E-Mail";
                                    Evaltxtmails := Evaltxtmails + ';' + evalmails[8];
                                end;

                                //error('%1..',Evaltxtmails);
                                // Evalbody := 'Dear Sir/Madam<br><br>Evaluation for RFP No: ' + No + ' has Ended. It is now in the Award Stage.<br><br>Kind Regards<br><br>';
                                // smtprec.Get;
                                // smtpcu.CreateMessage('NEMA Bidding Evaluation', smtprec."User ID", Evaltxtmails, No + ' EVALUATION', Evalbody, true);
                                // smtpcu.Send  //Remove comment...


                            end;

                            //=======================================================
                            CurrPage.Close;
                        end;
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        //    DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        //   DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        // DocumentAttachmentDetails.RunModal;
                    end;
                }
                action("Technical Evaluation")
                {
                    ApplicationArea = Basic;
                    Image = SetupColumns;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Technical Evaluation";
                    RunPageLink = "Ref No." = field(No);
                    Visible = true;
                }
                action("Financial Evaluation")
                {
                    ApplicationArea = Basic;
                    Image = SetupLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Financial Evaluation";
                    RunPageLink = "Ref No." = field(No);
                    Visible = true;
                }
                action(Award)
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Award Quotation Evaluation";
                    RunPageLink = "Ref No." = field(No);
                    Visible = true;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Process Type" := "process type"::RFP;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Process Type" := "process type"::RFP;
    end;

    trigger OnOpenPage()
    begin
        seetechnical := false;
        if "Technical started?" = true then begin
            seetechnical := true;
        end;
        ;
        Seeevaladmin := false;
        Recommendwinnerwindow := false;
        winnerrecommended := false;
        if "Evaluation Admin" = UserId then begin
            Seeevaladmin := true;
            Seeevaladmin2 := true;
            if "Mandatory started?" = false then begin
                Seeevaladmin2 := true;
            end;
            if "Mandatory started?" = true then begin
                Seeevaladmin2 := false;
            end;
            if "Financial Started?" = true then begin
                Recommendwinnerwindow := true;
            end;

            Biddersrec.Reset;
            Biddersrec.SetFilter(Biddersrec."Ref No.", No);
            Biddersrec.SetFilter(Biddersrec."Recommended Winner", '%1', true);
            if Biddersrec.FindSet then begin
                winnerrecommended := true;
                Recommendwinnerwindow := false;
            end;
            if "Award Started" = true then begin
                Recommendwinnerwindow := false;
                winnerrecommended := false;
            end;
        end;



        evaluatorsrec.Reset;
        Seeevalwindow := true;
        if evaluatorsrec.Get(No) then begin

            if evaluatorsrec."Evaluator 1" = UserId then begin
                Seeevalwindow := true;
                if "Technical started?" = true then begin
                    Seeevalwindow := false;
                    technicalwindow := true;
                end;
                if "Financial Started?" = true then begin
                    Seeevalwindow := false;
                    technicalwindow := false;
                end;
            end;
            if evaluatorsrec."Evaluator 2" = UserId then begin
                Seeevalwindow := true;
                if "Technical started?" = true then begin
                    technicalwindow := true;
                    Seeevalwindow := false;
                end;
                if "Financial Started?" = true then begin
                    Seeevalwindow := false;
                    technicalwindow := false;
                end;

            end;
            if evaluatorsrec."Evaluator 3" = UserId then begin
                Seeevalwindow := true;
                if "Technical started?" = true then begin
                    technicalwindow := true;
                    Seeevalwindow := false;
                end;
                if "Financial Started?" = true then begin
                    Seeevalwindow := false;
                    technicalwindow := false;
                end;

            end;
            if evaluatorsrec."Evaluator 4" = UserId then begin
                Seeevalwindow := true;
                if "Technical started?" = true then begin
                    technicalwindow := true;
                    Seeevalwindow := false;
                end;
                if "Financial Started?" = true then begin
                    Seeevalwindow := false;
                    technicalwindow := false;
                end;


            end;
            if evaluatorsrec."Evaluator 5" = UserId then begin
                Seeevalwindow := true;
                if "Technical started?" = true then begin
                    technicalwindow := true;
                    Seeevalwindow := false;
                end;
                if "Financial Started?" = true then begin
                    Seeevalwindow := false;
                    technicalwindow := false;
                end;


            end;
            if evaluatorsrec."Evaluator 6" = UserId then begin
                Seeevalwindow := true;
                if "Technical started?" = true then begin
                    technicalwindow := true;
                    Seeevalwindow := false;
                end;
                if "Financial Started?" = true then begin
                    Seeevalwindow := false;
                    technicalwindow := false;
                end;


            end;
            if evaluatorsrec."Evaluator 7" = UserId then begin
                Seeevalwindow := true;
                if "Technical started?" = true then begin
                    technicalwindow := true;
                    Seeevalwindow := false;
                end;
                if "Financial Started?" = true then begin
                    Seeevalwindow := false;
                    technicalwindow := false;
                end;


            end;
            if evaluatorsrec."Evaluator 8" = UserId then begin
                Seeevalwindow := true;
                if "Technical started?" = true then begin
                    technicalwindow := true;
                    Seeevalwindow := false;
                end;
                if "Financial Started?" = true then begin
                    Seeevalwindow := false;
                    technicalwindow := false;
                end;

            end;
        end;

        if "Mandatory started?" = false then begin
            Seeevalwindow := false;
            if "Technical started?" = true then begin
                technicalwindow := true;
                Seeevalwindow := false;
            end;
            if "Financial Started?" = true then begin
                Seeevalwindow := false;
                technicalwindow := false;
            end;

        end;
    end;

    var
        FileDirectory: Text[100];
        FileName: Text[500];
        ReportID: Integer;
        // "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer: Record Customer;
        Customer2: Record Customer;
        SupplierSelect: Record "Supplier Selection1";
        SupplierSelect2: Record "Supplier Selection1";
        Mail: Codeunit Mail;
        MailSent: Boolean;
        PrequalifiedSupRec: Record "Prequalified Suppliers1";
        Subject: Text[250];
        Body: Text[250];
        CCName: Text[30];
        // ApprovalMgt: Codeunit "Approvals Mgmt.";
        CompInfo: Record "Company Information";
        Usersetuprec: Record "User Setup";
        approvatemprec: Record "Approval Entry";
        payablesetuprec: Record "Purchases & Payables Setup";
        reqlist: Record "Purchase Header";
        requser: Code[20];
        Approveruser: Code[20];
        smtpcu: Codeunit Mail;
        mailheader: Text;
        mailbody: Text;
        smtprec: Record "Email Account";
        useremail1: Text;
        useremail2: Text;
        schedulerec: Record "Job Queue Category";
        currentdatetime: DateTime;
        Docno: Text;
        MandatoryReq: Record "RFQ Evaluation Lists";
        BidderMandatory: Record "Bidder Mandatory Requirements";
        Biddersrec: Record Bidders;
        ans: Boolean;
        RFPREC: Record "Procurement Request";
        evaluatorsrec: Record "Procurement Evaluators";
        seetechnical: Boolean;
        conftxt: Boolean;
        Procrec: Record "Procurement Request";
        Seeevaladmin: Boolean;
        Seeevalwindow: Boolean;
        BidderMandatory2: Record "Bidder Mandatory Requirements";
        j: Integer;
        Seeevaladmin2: Boolean;
        technicalwindow: Boolean;
        Recommendwinnerwindow: Boolean;
        winnerrecommended: Boolean;


    procedure RequestForProposal()
    var
        UserSetup: Record "User Setup";
        Emp: Record Employee;
        SenderName: Text;
        SenderAddress: Text;
        Recipients: Text;
        SMTPMail: Codeunit Mail;
        ProcurementReqRef: RecordRef;
        SearchString: Text;
        RecLink: Record "Record Link";
        // FileMangement: Codeunit "File Management";
        NoSuppliers: Integer;
    begin
        ReportID := 51511025;
        NoSuppliers := 0;

        SupplierSelect.Reset;
        SupplierSelect.SetRange("Reference No.", No);
        SupplierSelect.SetRange(Invited, true);
        if SupplierSelect.Find('-') then begin

            Window.Open('processing Supplier ######################1##');
            //  Object.Get(Object.Type::Report, '', ReportID);

            CompInfo.Get;
            SenderAddress := CompInfo."Administrator Email";
            SenderName := CompInfo.Name;//Emp."First Name"+' '+Emp."Middle Name"+' '+Emp."Last Name";

            repeat

                Subject := 'REQUEST FOR QUOTATION ' + SupplierSelect."Reference No.";
                Body := 'Please find attached Quotation';

                if UserSetup.Get(UserId) then begin

                    PrequalifiedSupRec.Reset;
                    PrequalifiedSupRec.SetRange(PrequalifiedSupRec.Name, SupplierSelect."Supplier Name");
                    if PrequalifiedSupRec.Find('-') then
                        Recipients := PrequalifiedSupRec."E-mail";

                    NoSuppliers := NoSuppliers + 1;
                    // //SMTPMail.CreateMessage(SenderName, SenderAddress, Recipients, Subject, Body, true);

                    // Report.SaveAsPdf(Report::"Request for Quotation", FileName, SupplierSelect);
                    // FileName := FileMangement.ServerTempFileName('.pdf');
                    // SMTPMail.AddAttachment(FileName, '');

                    // SMTPMail.Send();
                end;

            until SupplierSelect.Next = 0;

            Message('RFP Successfully Sent to %1 Suppliers', NoSuppliers);

            Window.Close;
        end else
            Error('There are no Suppliers Selected!');
    end;
}

