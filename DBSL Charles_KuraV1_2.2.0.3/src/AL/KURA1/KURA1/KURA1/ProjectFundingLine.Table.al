#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72040 "Project Funding Line"
{
    DrillDownPageID = "Project Funding Voucher";
    LookupPageID = "Project Funding Voucher";

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Year Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Year Codes"."Year Code";

            trigger OnValidate()
            var
                FYCodes: Record "Funding Year Codes";
            begin
                // IF FYCodes.GET("Year Code") THEN BEGIN
                //  "Start Date":=FYCodes."Start Date";
                //  "End Date":=FYCodes."End Date";
                //  END;
            end;
        }
        field(4;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Status;Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Open;
            OptionCaption = ' ,Open,Pending Approval,Approved';
            OptionMembers = " ",Open,"Pending Approval",Approved;
        }
        field(7;Region;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));
        }
        field(8;Directorate;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Directorate));
        }
        field(9;Department;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter("Department/Center"));
        }
        field(10;"Responsibility Center";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(11;"Default Works Category";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code where ("Procurement Type"=filter('WORKS'));
        }
        field(12;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Creation Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Creation Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Funding Source";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source";
        }
        field(16;"Funding Total Value(LCY)";Decimal)
        {
            CalcFormula = sum("Project Funding Voucher Line"."Total Estimated Cost(LCY)" where ("Document No"=field("Document No")));
            FieldClass = FlowField;
        }
        field(17;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18;Type;Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Original;
            OptionCaption = ' ,Original,Revision';
            OptionMembers = " ",Original,Revision;
        }
        field(19;"Currency Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(20;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,PFV,PFW';
            OptionMembers = " ",PFV,PFW;
        }
        field(21;"PFV No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Funding Request Vouche"."Document No" where ("Document Type"=filter(PFV));

            trigger OnValidate()
            begin
                // LineNo:=0;
                //
                // PFVLine.RESET;
                // PFVLine.SETRANGE(PFVLine."Document No","PFV No");
                // IF PFVLine.FIND('-') THEN
                //  BEGIN
                //   REPEAT
                //    LineNo:=LineNo+100;
                //    PFVLine.TRANSFERFIELDS(PFVLine);
                //    PFVLine."Document No":="Document No";
                //    PFVLine."Line No":=LineNo;
                //    PFVLine.INSERT(TRUE);
                //   UNTIL PFVLine.NEXT= 0;
                //  END;
            end;
        }
        field(22;"Project No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"PFW No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Funding Voucher Line"."Document No";

            trigger OnValidate()
            begin
                PFVLine.Reset;
                PFVLine.SetRange(PFVLine."Document No","PFW No");
                if PFVLine.FindSet then begin
                  Amount:=PFVLine."Total Estimated Cost";
                 "Amount(LCY)":=PFVLine."Total Estimated Cost(LCY)";
                  end;
            end;
        }
        field(24;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Amount(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Project No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // IF "Document Type" = "Document Type"::PFV THEN BEGIN
        // IF "Document No" = '' THEN BEGIN
        //  RMSetup.GET;
        //  RMSetup.TESTFIELD("Project Funding Voucher Nos");
        //  SeriesMgt.InitSeries(RMSetup."Project Funding Voucher Nos",xRec."No. Series",0D,"Document No","No. Series");
        //  END;
        //  END;
        //
        // IF "Document Type" = "Document Type"::PFW THEN BEGIN
        // IF "Document No" = '' THEN BEGIN
        //  RMSetup.GET;
        //  RMSetup.TESTFIELD("Project Funding WorkSheet  Nos");
        //  SeriesMgt.InitSeries(RMSetup."Project Funding WorkSheet  Nos",xRec."No. Series",0D,"Document No","No. Series");
        //  END;
        //  END;
        //
        // "Created By":=UPPERCASE(USERID);
        // "Creation Date":=TODAY;
        // "Creation Time":=TIME;
    end;

    var
        RMSetup: Record "Roads Management Setup";
        SeriesMgt: Codeunit NoSeriesManagement;
        PFVoucher: Record "Project Funding Request Vouche";
        PFVLine: Record "Project Funding Voucher Line";
        LineNo: Integer;
        ObjPFVLine: Record "Project Funding Voucher Line";
}

