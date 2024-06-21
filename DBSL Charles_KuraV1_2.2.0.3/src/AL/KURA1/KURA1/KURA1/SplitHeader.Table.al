#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57016 "Split Header"
{

    fields
    {
        field(1;"No.";Code[20])
        {

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                  InvestmentSetup.Get;
                  NoSeriesMgt.TestManual(InvestmentSetup."Split Nos");
                  "No. Series" := '';
                end;

                //"Created By":=USERID;
                "Creation Date":=Today;
            end;
        }
        field(2;"Document Date";Date)
        {
        }
        field(3;Posted;Boolean)
        {
        }
        field(4;"Created By";Code[50])
        {
        }
        field(5;"Creation Date";Date)
        {
        }
        field(6;"No. Series";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
         InvestmentSetup.Get;
         InvestmentSetup.TestField(InvestmentSetup."Split Nos");
         NoSeriesMgt.InitSeries(InvestmentSetup."Split Nos",xRec."No. Series",0D,"No.","No. Series");
        end;
    end;

    var
        InvestmentSetup: Record "Investment Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

