#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57032 "Agency Notice Header"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Notice,Suspension,Request for information';
            OptionMembers = " ",Notice,Suspension,"Request for information";
        }
        field(2; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Notice Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                ObjVend.Reset;
                ObjVend.SetRange("No.", "Contractor No");
                if ObjVend.FindSet then
                    "Contractor Name" := ObjVend.Name;
            end;
        }
        field(6; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Created Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released,Lifted';
            OptionMembers = " ",Open,"Pending Approval",Released,Lifted;
        }
        field(10; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; Lifted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Payment Registration Number"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Obligation VAT"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Obligation Total Amount" := "Obligation Income Tax" + "Obligation VAT" + "Obligation WHT";
            end;
        }
        field(14; "Obligation Income Tax"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Obligation Total Amount" := "Obligation Income Tax" + "Obligation VAT" + "Obligation WHT";
            end;
        }
        field(15; "Obligation WHT"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Obligation Total Amount" := "Obligation Income Tax" + "Obligation VAT" + "Obligation WHT";
            end;
        }
        field(16; "Staff Notified"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Project No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where("Contractor No." = field("Contractor No"));

            trigger OnValidate()
            begin
                ObjProj.Reset;
                ObjProj.SetRange("No.", "Project No");
                if ObjProj.FindSet then
                    "Project Name" := ObjProj.Description;

                //Bill discounting
                BillDiscountingHeader.Reset();
                BillDiscountingHeader.SetRange(Posted, false);
                BillDiscountingHeader.SetRange("Contractor No", "Contractor No");
                BillDiscountingHeader.SetRange("Project Code", "Project No");
                if BillDiscountingHeader.FindFirst then begin
                    Message('%1 bill discounting requests exists for this vendor', BillDiscountingHeader.Count);
                end;
            end;
        }
        field(18; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Contractor PIN"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ObjVend.Reset;
                ObjVend.SetRange("VAT Registration No.", "Contractor PIN");
                if ObjVend.FindSet then begin
                    "Contractor No" := ObjVend."No.";
                    "Contractor Name" := ObjVend.Name;
                end;
            end;
        }
        field(20; "Obligation Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Reference No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Date Lifted"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "PRN Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Discounted Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Discountable Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; "Bill Discounting No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bill Discounting Header"."Document No";

            trigger OnValidate()
            begin
                Clear("Discountable Amount");
                Clear("Discounted Amount");

                BillDiscountingHeader.Reset();
                BillDiscountingHeader.SetRange("Document No", "Bill Discounting No.");
                BillDiscountingHeader.SetAutocalcFields("Total Discountable Amount", "Total Discounted Amount");
                if BillDiscountingHeader.FindFirst then begin
                    "Discountable Amount" := BillDiscountingHeader."Total Discountable Amount";
                    "Discounted Amount" := BillDiscountingHeader."Total Discounted Amount";
                end;
            end;
        }
        field(28; "Accountants Notified"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(30; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No" = '' then begin
            ObjCashSetUp.Get;
            ObjCashSetUp.TestField("Agency Notice Nos");
            NoSeriesManagement.InitSeries(ObjCashSetUp."Agency Notice Nos", xRec."No Series", Today, "Document No", "No Series");
        end;


        Status := Status::Open;
        "Created By" := UserId;
        "Created Date Time" := CreateDatetime(Today, Time);
        "Document Date" := Today;
    end;

    var
        ObjCashSetUp: Record "Cash Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ObjVend: Record Vendor;
        ObjProj: Record Job;
        BillDiscountingHeader: Record "Bill Discounting Header";
        Options: Integer;
}

