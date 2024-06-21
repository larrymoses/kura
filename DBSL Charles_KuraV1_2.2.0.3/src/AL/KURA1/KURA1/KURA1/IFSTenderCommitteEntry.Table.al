#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70223 "IFS Tender Committe Entry"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Tender Committee"."Document No.";

            trigger OnValidate()
            begin
                IFSTenderCommitte.Reset;
                IFSTenderCommitte.SetRange("Document No.","Document No.");
                if IFSTenderCommitte.FindSet then begin
                  Description:=IFSTenderCommitte.Description;
                  end;
            end;
        }
        field(2;"IFS Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            begin
                ifs.Reset;
                ifs.SetRange(Code,"IFS Code");
                if ifs.FindSet then begin


                  "External Document No":=ifs."External Document No";
                  "Tender Name":=ifs."Tender Name";
                  "Tender Opening Date":=ifs."Bid Opening Date";
                  "Tender Opeing Time":=ifs."Bid Opening Time";
                  end;
            end;
        }
        field(3;Description;Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Tender Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"External Document No";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Tender Opening Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Tender Opeing Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","IFS Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BidCharge: Record "Bid Charges Schedule";
        ifs: Record "Standard Purchase Code";
        IFSTenderCommitte: Record "IFS Tender Committee";
}

