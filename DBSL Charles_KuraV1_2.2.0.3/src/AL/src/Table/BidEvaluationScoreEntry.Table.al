#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70180 "Bid Evaluation Score Entry"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Bid No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";
        }
        field(4;"Vendor No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(5;"Criteria Group";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Requirement ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Evaluation Requirement";Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Rating Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Number,Yes/No,Options Text,Date';
            OptionMembers = Number,"Yes/No","Options Text",Date;
        }
        field(9;"Target Value/KPI";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Unit of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Response Value";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Score Guide"."Response Value" where ("Criteria Group ID"=field("Criteria Group"),
                                                                      "Requirement ID"=field("Requirement ID"),
                                                                      "Template ID"=field("Bid Scoring Document No."));

            trigger OnValidate()
            begin
                Bidscore.Reset;
                Bidscore.SetRange("Template ID","Bid Scoring Document No.");
                Bidscore.SetRange("Requirement ID","Requirement ID");
                Bidscore.SetRange("Response Value","Response Value");
                if Bidscore.FindSet then begin
                  "Score %":=Bidscore."Score %";
                  //MESSAGE(FORMAT("Score %"));
                  Validate("Score %");

                end;
            end;
        }
        field(13;"Bid Response Actual Qty";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                BidevaluationScoreGuide.Reset;
                BidevaluationScoreGuide.SetRange("Template ID","Bid Scoring Document No.");
                BidevaluationScoreGuide.SetRange("Criteria Group ID","Criteria Group");
                BidevaluationScoreGuide.SetRange("Requirement ID","Requirement ID");
                if BidevaluationScoreGuide.FindSet then begin
                  repeat
                  if ("Bid Response Actual Qty">=BidevaluationScoreGuide."Min Bid Value") and ("Bid Response Actual Qty"<=BidevaluationScoreGuide."Max Bid Value") then begin
                    "Score %":=BidevaluationScoreGuide."Score %";
                    //MESSAGE(

                     Validate("Score %");
                  end;
                  until BidevaluationScoreGuide.Next=0;
                  end;
            end;
        }
        field(14;"Score %";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Score %">0 then begin
                 //MESSAGE(FORMAT("Score %"));
                "Weighted Line Score":="Score %"/100*"Assigned Weight %";
                "Evaluation Results":="evaluation results"::Pass
                end else begin
                  "Weighted Line Score":=0;
                  "Evaluation Results":="evaluation results"::Fail
                end;
            end;
        }
        field(15;"Assigned Weight %";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(16;"Weighted Line Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Equipment Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Evaluation Requirement"."Equipment Type";
        }
        field(18;"Desired Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(19;"Bid Scoring Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Evaluation Requirement"."Bid Scoring Document No.";
        }
        field(20;"Bid Scoring Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Bid Score Template,Bid Score Voucher';
            OptionMembers = "Bid Score Template","Bid Score Voucher";
        }
        field(21;"Evaluation Results";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(22;Remarks;Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Optional,NA';
            OptionMembers = Mandatory,Optional,NA;
        }
        field(24;Priority;Option)
        {
            DataClassification = ToBeClassified;
            InitValue = High;
            OptionCaption = 'High,Medium,Low';
            OptionMembers = High,Medium,Low;
        }
        field(25;"Contract Ref Clause";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"IFS Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Evaluation Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Preliminary Evaluation,Technical Evaluation,Financial Evaluation,Vendor Due Diligence,Prequalification,Registration,Post Qualification';
            OptionMembers = "Preliminary Evaluation","Technical Evaluation","Financial Evaluation","Vendor Due Diligence",Prequalification,Registration,"Post Qualification";
        }
        field(28;"No Of Pages";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Tax Compliance Certificate";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Last Evaluation Version No.";Integer)
        {
            CalcFormula = lookup("Bid Evaluation Register"."Last Evaluation Version No." where (Code=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Code","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Bidscore: Record "Bid Score Guide";
        BidevaluationScoreGuide: Record "Bid Evaluation Score Guide";
}

