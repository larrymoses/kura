table 99470 "Vendor Evaluation Score Entry"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            
        }
        field(3;"Bid No.";Code[30])
        {
            
            TableRelation = "Purchase Header"."No.";
        }
        field(4;"Vendor No.";Code[20])
        {
            
            TableRelation = Vendor;
        }
        field(5;"Criteria Group";Code[50])
        {
            
        }
        field(6;"Requirement ID";Integer)
        {
            
        }
        field(7;"Evaluation Requirement";Text[250])
        {
            
        }
        field(8;"Rating Type";Option)
        {
            
            OptionCaption = 'Number,Yes/No,Options Text,Date';
            OptionMembers = Number,"Yes/No","Options Text",Date;
        }
        field(9;"Target Value/KPI";Text[50])
        {
            
        }
        field(10;"Unit of Measure";Code[20])
        {
            
        }
        field(11;"Target Qty";Decimal)
        {
            
        }
        field(12;"Response Value";Code[40])
        {
            
            TableRelation = "Bid Score Guide"."Response Value" WHERE ("Criteria Group ID"=FIELD("Criteria Group"),
                                                                      "Requirement ID"=FIELD("Requirement ID"));

            trigger OnValidate()
            begin
                Bidscore.RESET;
                Bidscore.SETRANGE("Template ID","Bid Scoring Document No.");
                Bidscore.SETRANGE("Requirement ID","Requirement ID");
                Bidscore.SETRANGE("Response Value","Response Value");
                IF Bidscore.FINDSET THEN BEGIN
                  "Score %":=Bidscore."Score %";
                  VALIDATE("Score %");
                  MODIFY(TRUE);
                END;
            end;
        }
        field(13;"Bid Response Actual Qty";Decimal)
        {
            

            trigger OnValidate()
            begin
                BidevaluationScoreGuide.RESET;
                BidevaluationScoreGuide.SETRANGE("Template ID","Bid Scoring Document No.");
                BidevaluationScoreGuide.SETRANGE("Criteria Group ID","Criteria Group");
                BidevaluationScoreGuide.SETRANGE("Requirement ID","Requirement ID");
                IF BidevaluationScoreGuide.FINDSET THEN BEGIN
                  REPEAT
                  IF ("Bid Response Actual Qty">=BidevaluationScoreGuide."Min Bid Value") AND ("Bid Response Actual Qty"<=BidevaluationScoreGuide."Max Bid Value") THEN BEGIN
                    "Score %":=BidevaluationScoreGuide."Score %";
                    //MESSAGE(

                     VALIDATE("Score %");
                     MODIFY(TRUE);
                  END;
                  UNTIL BidevaluationScoreGuide.NEXT=0;
                  END;

            end;
        }
        field(14;"Score %";Decimal)
        {
            
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                IF "Score %">0 THEN BEGIN
                "Weighted Line Score":="Score %"/100*"Assigned Weight %";
                "Evaluation Results":="Evaluation Results"::Pass;
                MODIFY(TRUE);
                END;

                IF "Score %"=0 THEN BEGIN
                  "Weighted Line Score":=0;
                  "Evaluation Results":="Evaluation Results"::Fail;
                MODIFY(TRUE);
                END;
            end;
        }
        field(15;"Assigned Weight %";Decimal)
        {
            
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(16;"Weighted Line Score";Decimal)
        {
            
        }
        field(17;"Equipment Type";Code[30])
        {
            
            TableRelation = "Bid Evaluation Requirement"."Equipment Type";
        }
        field(18;"Desired Perfomance Direction";Option)
        {
            
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(19;"Bid Scoring Document No.";Code[30])
        {
            
            TableRelation = "Bid Evaluation Requirement"."Bid Scoring Document No.";
        }
        field(20;"Bid Scoring Document Type";Option)
        {
            
            OptionCaption = 'Bid Score Template,Bid Score Voucher';
            OptionMembers = "Bid Score Template","Bid Score Voucher";
        }
        field(21;"Evaluation Results";Option)
        {
            
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(22;Remarks;Text[250])
        {
            

            trigger OnValidate()
            begin
                MODIFY(TRUE);
            end;
        }
        field(23;Scores;Option)
        {
            
            OptionCaption = 'Choose Score,0,1,2,3';
            OptionMembers = "Choose Score","0","1","2","3";

            trigger OnValidate()
            begin
                IF Scores = Scores::"0" THEN BEGIN
                  "Scores Remarks":='Not Acceptable.';
                "Weighted Line Score":=0;
                "Evaluation Results":="Evaluation Results"::Fail;
                MODIFY(TRUE);
                END;
                IF Scores = Scores::"1" THEN BEGIN
                  "Scores Remarks":='Disapointing.';
                "Weighted Line Score":="Score %"/100*"Assigned Weight %";
                "Evaluation Results":="Evaluation Results"::Pass;
                MODIFY(TRUE);
                END;
                IF Scores = Scores::"2" THEN BEGIN
                  "Scores Remarks":='Acceptable.';
                "Weighted Line Score":="Score %"/100*"Assigned Weight %";
                "Evaluation Results":="Evaluation Results"::Pass;
                MODIFY(TRUE);
                END;
                IF Scores = Scores::"3" THEN BEGIN
                  "Scores Remarks":='Excellent.';
                "Weighted Line Score":="Score %"/100*"Assigned Weight %";
                "Evaluation Results":="Evaluation Results"::Pass;
                MODIFY(TRUE);
                END;
            end;
        }
        field(24;"Scores Remarks";Text[30])
        {
            
        }
        field(25;"Criteria Group ID";Code[30])
        {
            
            Description = 'This refers to the Criteria Group applicable in the Template. A simple scoring sheet may have 1 Group of all General criteria, generally adding upto 100%. Some score sheets may be split into different Criteria Groups e.g. Technical proposal at 80% and Financial proposal at 20%';
            TableRelation = "Bid Score Criteria Group"."Criteria Group ID";
        }
        field(26;"Criteria Description";Text[100])
        {
            
        }
        field(27;"Evaluation Decision";Option)
        {
            
            OptionCaption = 'Passed Appraisal,Failed Appraisal';
            OptionMembers = "Passed Appraisal","Failed Appraisal";
        }
    }

    keys
    {
        key(Key1;"Code","Line No")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Bidscore: Record "Bid Score Guide";
        BidevaluationScoreGuide: Record "Bid Evaluation Score Guide";
}

