#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70222 "Bid Security Closure Voucher"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin


                if "Document No"<>'' then
                  begin
                    if "Document Type"="document type"::"Claim/Forfeiture" then begin
                    ProcurementSetup.TestField("Bid Security Claim Nos");
                    NoMgt.TestManual(ProcurementSetup."Bid Security Claim Nos");
                    end;
                    if "Document Type"="document type"::"Released/Returned " then begin
                    ProcurementSetup.TestField("Bid Security Returned Nos");
                    NoMgt.TestManual(ProcurementSetup."Bid Security Returned Nos");
                    end;
                end;
            end;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Claim/Forfeiture,Released/Returned ';
            OptionMembers = "Claim/Forfeiture","Released/Returned ";
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"IFS Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            begin
                IFS.Reset;
                IFS.SetRange(Code,"IFS Code");
                if IFS.FindSet then
                 "Tender Name":=IFS."Tender Name";
                if "Document Type"="document type"::"Claim/Forfeiture" then begin
                Description:=IFS."Tender Name"+ 'Security claim';
                    Bid_ContractSecty.Reset;
                Bid_ContractSecty.SetRange("IFS No","IFS Code");
                if Bid_ContractSecty.FindSet then
                  repeat
                    BidSecurityR.Init;
                    BidSecurityR."Document Type":="Document Type";
                    BidSecurityR."Line No":=BidSecurityR."Line No"+1000;
                    BidSecurityR."Form of Security":=Bid_ContractSecty."Form of Security";
                    BidSecurityR."Document No":="Document No";
                    BidSecurityR."IFS Code":="IFS Code";
                    BidSecurityR."Bid Security ID":=Bid_ContractSecty."No.";
                    BidSecurityR."Security Amount (LCY)":=Bid_ContractSecty."Security Amount (LCY)";
                    BidSecurityR."Vendor No.":=Bid_ContractSecty."Vendor No.";
                    BidSecurityR."Issuer/Guarantor Name":=Bid_ContractSecty."Issuer/Guarantor Name";
                    BidSecurityR.Insert(true);
                    until Bid_ContractSecty.Next=0;
                end else begin
                Description:=IFS."Tender Name"+ 'Security return';
                    Bid_ContractSecty.Reset;
                Bid_ContractSecty.SetRange("IFS No","IFS Code");
                if Bid_ContractSecty.FindSet then
                  repeat
                    BidSecurityR.Init;
                    BidSecurityR."Document Type":="Document Type";
                    BidSecurityR."Line No":=BidSecurityR."Line No"+1000;
                    BidSecurityR."Form of Security":=Bid_ContractSecty."Form of Security";
                    BidSecurityR."Document No":="Document No";
                    BidSecurityR."IFS Code":="IFS Code";
                    BidSecurityR."Bid Security ID":=Bid_ContractSecty."No.";
                    BidSecurityR."Security Amount (LCY)":=Bid_ContractSecty."Security Amount (LCY)";
                    BidSecurityR."Vendor No.":=Bid_ContractSecty."Vendor No.";
                    BidSecurityR."Issuer/Guarantor Name":=Bid_ContractSecty."Issuer/Guarantor Name";
                    BidSecurityR.Insert(true);
                    until Bid_ContractSecty.Next=0;
                    // BidSecurityR.MODIFY(TRUE);
                    end;
                Message('Successfull');
            end;
        }
        field(5;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Tender Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Closed Securities Total Value";Decimal)
        {
            CalcFormula = sum("Bid Security Return Line"."Security Amount (LCY)" where ("Document No"=field("Document No")));
            Caption = 'Closed Securities Total Value (LCY)';
            Description = 'Closed Securities Total Value (LCY)';
            FieldClass = FlowField;
        }
        field(8;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(9;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Created Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Created Time";Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Posted By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Posted Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No"='' then begin
        ProcurementSetup.Get;
        if "Document Type"="document type"::"Claim/Forfeiture" then begin
        ProcurementSetup.TestField("Bid Security Claim Nos");
        NoMgt.InitSeries(ProcurementSetup."Bid Security Claim Nos",xRec."No. Series",0D,"Document No","No. Series");
        end;
        if "Document Type"="document type"::"Released/Returned " then begin
        ProcurementSetup.TestField("Bid Security Returned Nos");
        NoMgt.InitSeries(ProcurementSetup."Bid Security Returned Nos",xRec."No. Series",0D,"Document No","No. Series");
        end;

        end;

        "Created By":=UserId;
        "Created Date":=Today;
        "Created Time":=Time;
        "Document Date":=Today;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        IFS: Record "Standard Purchase Code";
        Bid_ContractSecty: Record "Bid_Contract Security Register";
        BidSecurityR: Record "Bid Security Return Line";
}

