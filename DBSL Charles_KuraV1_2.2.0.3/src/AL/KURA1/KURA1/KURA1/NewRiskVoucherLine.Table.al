#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95125 "New Risk Voucher Line"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Risk Voucher,Risk Status Report';
            OptionMembers = " ","New Risk Voucher","Risk Status Report";
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Risk ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Risk Category";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Category".Code where (Blocked=filter(false));

            trigger OnValidate()
            begin
                RiskCategories.Reset;
                RiskCategories.SetRange(RiskCategories.Code,"Risk Category");
                if RiskCategories.FindSet then begin
                  "Risk Title":=RiskCategories.Description;
                end;
            end;
        }
        field(5;"Risk Title";Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Risk Source ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Source"."Source ID" where (Blocked=filter(false));
        }
        field(7;"Risk Likelihood Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale Line".Code where ("Risk Rating Scale Type"=filter("Likelihood Rating"),
                                                                 "Rating Scale ID"=field("Risk Likelihood Rate Scale ID"));

            trigger OnValidate()
            begin
                RiskRatingScaleLine.Reset;
                 RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."risk rating scale type"::"Likelihood Rating");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Rating Scale ID","Risk Likelihood Rate Scale ID");
                  RiskRatingScaleLine.SetRange(RiskRatingScaleLine.Code,"Risk Likelihood Code");
                 if RiskRatingScaleLine.FindSet then begin
                  "Risk Likelihood Rating":=RiskRatingScaleLine."Rating Score";

                   end;
                   "Overal Risk Rating":="Risk Likelihood Rating"*"Risk Impact Rating";

                RiskRatingScaleLine.Reset;
                RiskRatingScaleLine.SetCurrentkey("Risk Rating Scale Type","Rating Scale ID");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."risk rating scale type"::"Overall Risk Rating");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Rating Scale ID","Overall Risk Rating Scale ID");
                if RiskRatingScaleLine.FindSet then
                  begin
                    repeat
                      if (("Overal Risk Rating">=RiskRatingScaleLine."Min Overall Rating") and ("Overal Risk Rating"<=RiskRatingScaleLine."Max Overall Rating")) then
                        "Overall Risk Level Code":=RiskRatingScaleLine.Code;
                       until RiskRatingScaleLine.Next=0;
                  end;

                RiskRatingScaleLine.Reset;
                RiskRatingScaleLine.SetCurrentkey("Risk Rating Scale Type","Rating Scale ID",Code);
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."risk rating scale type"::"Overall Risk Rating");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Rating Scale ID","Overall Risk Rating Scale ID");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine.Code,"Overall Risk Level Code");
                if RiskRatingScaleLine.FindFirst then
                  begin
                    repeat
                      if (("Overal Risk Rating">=RiskRatingScaleLine."Min Overall Rating") and ("Overal Risk Rating"<=RiskRatingScaleLine."Max Overall Rating")) then begin
                        "Risk Heat Zone":=RiskRatingScaleLine."Risk Heat Zone";
                       end;
                      until RiskRatingScaleLine.Next=0;
                  end;
            end;
        }
        field(8;"Risk Impact Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale Line".Code where ("Risk Rating Scale Type"=filter("Impact Rating"),
                                                                 "Rating Scale ID"=field("Risk Impact Rating Scale ID"));

            trigger OnValidate()
            begin
                RiskRatingScaleLine.Reset;
                 RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."risk rating scale type"::"Impact Rating");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Rating Scale ID","Risk Impact Rating Scale ID");
                  RiskRatingScaleLine.SetRange(RiskRatingScaleLine.Code,"Risk Impact Code");
                 if RiskRatingScaleLine.FindSet then begin
                  "Risk Impact Rating":=RiskRatingScaleLine."Rating Score";

                   end;
                   "Overal Risk Rating":="Risk Likelihood Rating"*"Risk Impact Rating";


                RiskRatingScaleLine.Reset;
                RiskRatingScaleLine.SetCurrentkey("Risk Rating Scale Type","Rating Scale ID");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."risk rating scale type"::"Overall Risk Rating");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Rating Scale ID","Overall Risk Rating Scale ID");
                if RiskRatingScaleLine.FindSet then
                  begin
                    repeat
                      if (("Overal Risk Rating">=RiskRatingScaleLine."Min Overall Rating") and ("Overal Risk Rating"<=RiskRatingScaleLine."Max Overall Rating")) then
                        "Overall Risk Level Code":=RiskRatingScaleLine.Code;
                       until RiskRatingScaleLine.Next=0;
                  end;

                RiskRatingScaleLine.Reset;
                RiskRatingScaleLine.SetCurrentkey("Risk Rating Scale Type","Rating Scale ID",Code);
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."risk rating scale type"::"Overall Risk Rating");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Rating Scale ID","Overall Risk Rating Scale ID");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine.Code,"Overall Risk Level Code");
                if RiskRatingScaleLine.FindFirst then
                  begin
                    repeat
                      if (("Overal Risk Rating">=RiskRatingScaleLine."Min Overall Rating") and ("Overal Risk Rating"<=RiskRatingScaleLine."Max Overall Rating")) then begin
                        "Risk Heat Zone":=RiskRatingScaleLine."Risk Heat Zone";
                      end;
                      until RiskRatingScaleLine.Next=0;
                  end;
            end;
        }
        field(9;"Risk Impact Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Negative,Positive';
            OptionMembers = " ",Negative,Positive;
        }
        field(10;"Estimate Fin. Impact (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Estimate Fin. Impact (LCY)';
        }
        field(11;"Estimate Delay Impact (Days)";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Gen. Risk Response Strategy";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Gen. Risk Response Strategy';
            TableRelation = "Risk Response Strategy"."Strategy ID" where (Blocked=filter(false),
                                                                          "Risk Impact Type"=field("Risk Impact Type"));
        }
        field(13;"Date Raised";Date)
        {
            FieldClass = Normal;
        }
        field(14;"Risk Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Open,Closed';
            OptionMembers = " ",Open,Closed;
        }
        field(15;"Risk Management Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan"."Document No" where ("Document Type"=field("Risk Register Type"),
                                                                        Blocked=filter(false));
        }
        field(16;"Risk Likelihood Rate Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Likelihood Rate Scale ID';
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where ("Risk Rating Scale Type"=filter("Likelihood Rating"),
                                                                         Blocked=filter(false));
        }
        field(17;"Risk Impact Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where ("Risk Rating Scale Type"=filter("Impact Rating"),
                                                                         Blocked=filter(false));
        }
        field(18;"Overall Risk Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where ("Risk Rating Scale Type"=filter("Overall Risk Rating"),
                                                                         Blocked=filter(false));
        }
        field(19;"Risk Appetite Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Appetite Rating Scale ID';
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where ("Risk Rating Scale Type"=filter("Risk Appetite Rating"),
                                                                         Blocked=filter(false));
        }
        field(20;"Risk Likelihood Rating";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21;"Risk Impact Rating";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22;"Overal Risk Rating";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23;"Overall Risk Level Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale Line".Code where ("Risk Rating Scale Type"=filter("Overall Risk Rating"));
        }
        field(24;"Risk Heat Zone";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Red,Yellow,Green';
            OptionMembers = " ",Red,Yellow,Green;
        }
        field(25;"No. of Planed Risk Resp. Actns";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Plan Risk Resp. Actns';
        }
        field(26;"No. of Impacted Project Tasks";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Risk Register Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Risk Register Type","Risk Management Plan ID","Risk ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        RiskMEHeader.Reset;
        RiskMEHeader.SetRange(RiskMEHeader."Document No","Document No");
        if RiskMEHeader.FindSet then
          begin
            "Risk Likelihood Rate Scale ID":=RiskMEHeader."Risk Likelihood Rate Scale ID";
            "Risk Appetite Rating Scale ID":=RiskMEHeader."Risk Appetite Rating Scale ID";
            "Risk Impact Rating Scale ID":=RiskMEHeader."Risk Impact Rating Scale ID";
            "Overall Risk Rating Scale ID":=RiskMEHeader."Overall Risk Rating Scale ID";
          end;
    end;

    var
        RiskCategories: Record "Risk Category";
        RiskRatingScaleLine: Record "Risk Rating Scale Line";
        RiskMEHeader: Record "Risk M&E Header";
}

