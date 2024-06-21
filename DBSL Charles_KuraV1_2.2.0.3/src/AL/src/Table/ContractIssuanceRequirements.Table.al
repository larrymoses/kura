#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70241 "Contract Issuance Requirements"
{
    Caption = 'Procurement Document Template Line';
    DrillDownPageID = "Procurement Doc Template Line";
    LookupPageID = "Procurement Doc Template Line";

    fields
    {
        field(1;"Document ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Procurement Document Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Document Type".Code;

            trigger OnValidate()
            begin
                ProcDocType.Reset;
                ProcDocType.SetRange(Code,"Procurement Document Type");
                if ProcDocType.FindSet then begin
                  Description:=ProcDocType.Description;
                  "Track Certificate Expiry":=ProcDocType."Track Certificate Expiry";
                  end;
            end;
        }
        field(4;Description;Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Mandatory,Optional';
            OptionMembers = ,Mandatory,Optional;
        }
        field(6;"Track Certificate Expiry";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Guidelines/Instruction";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Contract ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Document Link";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Process Area";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,PRN,Bid Response,Intention to Award,Contract Issuance,Contract';
            OptionMembers = " ",PRN,"Bid Response","Intention to Award","Contract Issuance",Contract;
        }
        field(11;"Contract Index";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"PRN No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"IFS Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document ID","Procurement Document Type","Process Area")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcDocType: Record "Procurement Document Type";
}

