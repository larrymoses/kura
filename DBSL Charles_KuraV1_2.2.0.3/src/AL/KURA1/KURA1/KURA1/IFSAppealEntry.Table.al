#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70233 "IFS Appeal Entry"
{

    fields
    {
        field(1;No;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"IFS Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code where (Status=const(Released));
        }
        field(4;"Vendor No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(5;"Bid Response No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where ("Document Type"=const(Quote),
                                                           "Vendor No."=field("Vendor No"));
        }
        field(6;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Appeal Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Decision;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Won,Lost';
            OptionMembers = " ",Won,Lost;
        }
        field(9;"Date of Verdict";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;Comments;Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Posted By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Notice of Award No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Tabulation Header".Code where ("Document Type"=const("Notice of Award"));

            trigger OnValidate()
            begin
                BidTabulationHeader.Reset;
                BidTabulationHeader.SetRange(Code,"Notice of Award No.");
                if BidTabulationHeader.FindSet then
                  "IFS Code":=BidTabulationHeader."IFS Code";
                Description:=BidTabulationHeader."Tender Name"+' Appeal';
            end;
        }
        field(16;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'IFS,IFP,IFR';
            OptionMembers = IFS,IFP,IFR;
        }
        field(17;"IFP Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        BidTabulationHeader: Record "Bid Tabulation Header";
}

