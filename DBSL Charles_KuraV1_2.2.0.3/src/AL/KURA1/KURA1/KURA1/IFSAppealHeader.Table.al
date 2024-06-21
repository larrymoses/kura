#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70231 "IFS Appeal Header"
{

    fields
    {
        field(1;No;Code[30])
        {
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

            trigger OnValidate()
            begin
                Vendors.Reset;
                Vendors.SetRange("No.","Vendor No");
                if Vendors.FindSet then
                  "Awarded Bidder Name":=Vendors.Name;
            end;
        }
        field(5;"Bid Response No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where ("Document Type"=const(Quote),
                                                           "Vendor No."=field("Vendor No"),
                                                           "Invitation For Supply No"=field("IFS Code"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange("No.","Bid Response No");
                if PurchaseHeader.FindSet then
                  "Award Tender Sum Inc Taxes":=PurchaseHeader."Total PRN Amount (LCY)";
            end;
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
            OptionCaption = ' ,Won,Lost,Pending Verdict';
            OptionMembers = " ",Won,Lost,"Pending Verdict";
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
            TableRelation = "Bid Tabulation Header".Code where ("Document Type"=filter("Notice of Award"));

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
        field(18;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Awarded Bidder Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Award Tender Sum Inc Taxes";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Reason for Appeal";Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Date of Approval";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"No. of Bidders";Integer)
        {
            CalcFormula = count("Purchase Header" where ("Invitation For Supply No"=field("IFS Code"),
                                                         "Document Type"=const(Quote)));
            FieldClass = FlowField;
        }
        field(24;"ITC Issuance Date";Date)
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

    trigger OnInsert()
    begin
        if No = '' then begin
          PurchSetup.Get;
          PurchSetup.TestField("Tender Addendum Notice");
          NoSeriesMgt.InitSeries(PurchSetup."Tender Addendum Notice",xRec.No,0D,No,"No. Series");
         "Document Date":=Today;
         "Created By":=UserId;
         "Appeal Date":=Today;
         //Description:=
        end;
    end;

    var
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        BidTabulationHeader: Record "Bid Tabulation Header";
        Vendors: Record Vendor;
        PurchaseHeader: Record "Purchase Header";
}

