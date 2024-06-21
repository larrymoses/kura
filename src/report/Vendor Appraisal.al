report 70146 "Vendor Appraisal"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Vendor Appraisal.rdlc';

    dataset
    {
        dataitem("Vendor Appraisal Voucher";"Vendor Appraisal Voucher")
        {
            column(logo;corec.Picture)
            {
            }
            column(DocumentNo_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Document No")
            {
            }
            column(DocumentType_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Document Type")
            {
            }
            column(SourceType_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Source Type")
            {
            }
            column(Description_VendorAppraisalVoucher;"Vendor Appraisal Voucher".Description)
            {
            }
            column(DocumentDate_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Document Date")
            {
            }
            column(ExternalDocumentNo_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."External Document No")
            {
            }
            column(ApprovalStatus_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Approval Status")
            {
            }
            column(Posted_VendorAppraisalVoucher;"Vendor Appraisal Voucher".Posted)
            {
            }
            column(CreatedBy_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Created By")
            {
            }
            column(CreatedDate_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Created Date")
            {
            }
            column(CreatedTime_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Created Time")
            {
            }
            column(NoSeries_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."No. Series")
            {
            }
            column(GlobalDimension1Code_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Global Dimension 2 Code")
            {
            }
            column(GlobalDimension3Code_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Global Dimension 3 Code")
            {
            }
            column(DimensionSetID_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Dimension Set ID")
            {
            }
            column(VendorNo_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Vendor No.")
            {
            }
            column(VendorName_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Vendor Name")
            {
            }
            column(AppraisalPeriod_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Appraisal Period")
            {
            }
            column(TendorCategory_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Tendor Category")
            {
            }
            column(EvaluationTemplate_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Evaluation Template")
            {
            }
            column(TenderCategoryDescription_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Tender Category Description")
            {
            }
            column(Remarks_VendorAppraisalVoucher;"Vendor Appraisal Voucher".Remarks)
            {
            }
            column(SuggestedAreasofImprevement_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Suggested Areas of Imprevement")
            {
            }
            column(Recommendations_VendorAppraisalVoucher;"Vendor Appraisal Voucher"."Recommendation(s)")
            {
            }
            dataitem("Vendor Evaluation Score Entry";"Vendor Evaluation Score Entry")
            {
                DataItemLink = Code=FIELD("Document No");
                column(Code_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry".Code)
                {
                }
                column(LineNo_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Line No")
                {
                }
                column(BidNo_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Bid No.")
                {
                }
                column(VendorNo_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Vendor No.")
                {
                }
                column(CriteriaGroup_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Criteria Group")
                {
                }
                column(RequirementID_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Requirement ID")
                {
                }
                column(EvaluationRequirement_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Evaluation Requirement")
                {
                }
                column(RatingType_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Rating Type")
                {
                }
                column(TargetValueKPI_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Target Value/KPI")
                {
                }
                column(UnitofMeasure_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Unit of Measure")
                {
                }
                column(TargetQty_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Target Qty")
                {
                }
                column(ResponseValue_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Response Value")
                {
                }
                column(BidResponseActualQty_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Bid Response Actual Qty")
                {
                }
                column(Score_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Score %")
                {
                }
                column(AssignedWeight_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Assigned Weight %")
                {
                }
                column(WeightedLineScore_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Weighted Line Score")
                {
                }
                column(EquipmentType_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Equipment Type")
                {
                }
                column(DesiredPerfomanceDirection_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Desired Perfomance Direction")
                {
                }
                column(BidScoringDocumentNo_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Bid Scoring Document No.")
                {
                }
                column(BidScoringDocumentType_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Bid Scoring Document Type")
                {
                }
                column(EvaluationResults_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Evaluation Results")
                {
                }
                column(Remarks_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry".Remarks)
                {
                }
                column(Scores_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry".Scores)
                {
                }
                column(ScoresRemarks_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Scores Remarks")
                {
                }
                column(CriteriaGroupID_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Criteria Group ID")
                {
                }
                column(CriteriaDescription_VendorEvaluationScoreEntry;"Vendor Evaluation Score Entry"."Criteria Description")
                {
                }
                column(SNO;SNO)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    SNO:= SNO+1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                
                
                /*IFS.RESET;
                IFS.SETRANGE(Code,"IFS Tender Committee"."IFS Code");
                IF IFS.FINDSET THEN BEGIN
                  IFSDates:=IFS."Bid Opening Date";
                  IFSTime:=IFS."Bid Opening Time";
                  END;
                  //Approvals
                ApprovalEntries.RESET;
                ApprovalEntries.SETRANGE("Table ID",70141);
                ApprovalEntries.SETRANGE("Document No.","IFS Tender Committee"."Document No.");
                ApprovalEntries.SETRANGE(Status,ApprovalEntries.Status::Approved);
                IF ApprovalEntries.FIND('-') THEN BEGIN
                   i:=0;
                 REPEAT
                 i:=i+1;
                IF i=1 THEN BEGIN
                Approver[1]:=ApprovalEntries."Sender ID";
                ApproverDate[1]:=ApprovalEntries."Date-Time Sent for Approval";
                 IF UserSetup.GET(Approver[1]) THEN
                    UserSetup.CALCFIELDS(Picture);
                
                Approver[2]:=ApprovalEntries."Approver ID";
                ApproverDate[2]:=ApprovalEntries."Last Date-Time Modified";
                 IF UserSetup1.GET(Approver[2]) THEN
                    UserSetup1.CALCFIELDS(Picture);
                END;
                IF i=2 THEN
                BEGIN
                Approver[3]:=ApprovalEntries."Approver ID";
                ApproverDate[3]:=ApprovalEntries."Last Date-Time Modified";
                 IF UserSetup2.GET(Approver[3]) THEN
                    UserSetup2.CALCFIELDS(Picture);
                END;
                IF i=3 THEN
                BEGIN
                Approver[4]:=ApprovalEntries."Approver ID";
                ApproverDate[4]:=ApprovalEntries."Last Date-Time Modified";
                 IF UserSetup3.GET(Approver[4]) THEN
                    UserSetup3.CALCFIELDS(Picture);
                END;
                UNTIL
                ApprovalEntries.NEXT=0;
                
                END;*/

            end;

            trigger OnPreDataItem()
            begin
                corec.GET;
                corec.CALCFIELDS(Picture);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        corec.GET;
        corec.CALCFIELDS(Picture);
    end;

    var
        corec: Record "Company Information";
        SerialNo: Integer;
        Chairman: Text[70];
        IFSDates: Date;
        IFS: Record "Standard Purchase Code";
        IFSTime: Time;
        ApprovalEntries: Record "Approval Entry";
        Approver: array [10] of Code[50];
        ApproverDate: array [10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record  "User Setup";
        i: Integer;
        SNO: Integer;
}

