#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70036 "Inspection Header1"
{

    fields
    {
        field(1; "Inspection No"; Code[20])
        {
        }
        field(2; "Contract/Order No"; Code[20])
        {
            TableRelation = if (Type = filter(Standard)) "Purchase Header"."No." where("Document Type" = const(Order))
            // "Location Code" = field("Responsibility Center"))
            else
            if (Type = filter("Works")) "Purchase Header"."No." where("Document Type" = const("Blanket Order"),
                                                                                                                                                  "Location Code" = field("Responsibility Center"));

            trigger OnValidate()
            begin

                PurchLines.Reset;
                //PurchLines.SETRANGE(PurchLines."Document Type",PurchLines."Document Type"::Order);
                PurchLines.SetRange(PurchLines."Document No.", "Contract/Order No");
                if PurchLines.Find('-') then begin
                    repeat
                        InspectLines.Init;
                        InspectLines."Inspection No" := "Inspection No";
                        InspectLines."Line No" := PurchLines."Line No.";
                        InspectLines.Description := PurchLines.Description;
                        InspectLines."Unit of Measure" := PurchLines."Unit of Measure Code";
                        InspectLines."Quantity Ordered" := PurchLines.Quantity;
                        InspectLines."Quantity Received" := PurchLines.Quantity;
                        InspectLines."Received Qty" := PurchLines."Quantity Received";
                        if not InspectLines.Get(InspectLines."Inspection No", InspectLines."Line No") then
                            InspectLines.Insert;
                    until PurchLines.Next = 0;
                end;
                PO.Reset;
                PO.SetRange("No.", "Contract/Order No");
                if PO.FindSet then begin
                    "Supplier Name" := PO."Buy-from Vendor Name";
                    "Tender/Quotation No." := PO."Contract No.";
                    Description := 'Inspection of: ' + PO."Tender Name";
                    //"Commitee Appointment No":=PO.
                end;
            end;
        }
        field(3; "Commitee Appointment No"; Code[20])
        {
            TableRelation = "IFS Tender Committee"."Document No.";//where (Inspection=const(true));
        }
        field(4; "Inspection Date"; Date)
        {
        }
        field(5; "Supplier Name"; Text[80])
        {
        }
        field(6; "No. Series"; Code[20])
        {
        }
        field(7; Status; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Rejected,Payment Processing';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected,"Payment Processing";
        }
        field(8; Amount; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document No." = field("Contract/Order No")));
            Editable = true;
            FieldClass = FlowField;
        }
        field(9; "Amount Invoiced"; Decimal)
        {
            CalcFormula = sum("Purch. Inv. Line".Amount where("Document No." = field("Contract/Order No")));
            FieldClass = FlowField;
        }
        field(10; "Temp Amount"; Decimal)
        {
        }
        field(11; "Tender/Quotation No."; Code[20])
        {

            Editable = false;
        }
        field(12; Type; Option)
        {

            OptionCaption = 'Standard,Works';
            OptionMembers = Standard,Works;
        }
        field(13; Description; Text[250])
        {

        }
        field(14; "General Committe Remarks"; Text[250])
        {

        }
        field(15; "Responsibility Center"; Code[10])
        {

            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Region));
        }
        field(16; "Created By"; Code[50])
        {

        }
        field(17; "Created On"; Date)
        {

        }
        field(18; "Clause No."; Code[20])
        {
            TableRelation = "Contract Sub Clause".Code;
        }
    }

    keys
    {
        key(Key1; "Inspection No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        PurchSetup.Get;
        PurchSetup.TestField(PurchSetup."Inspection Nos");
        NoSeriesMgt.InitSeries(PurchSetup."Inspection Nos", xRec."No. Series", 0D, "Inspection No", "No. Series");
        "Inspection Date" := Today;

        "Created On" := Today;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then
            "Created By" := UserId;
        "Responsibility Center" := UserSetup."Purchase Resp. Ctr. Filter";
    end;

    var
        PurchLines: Record "Purchase Line";
        InspectLines: Record "Inspection Lines1";
        PO: Record "Purchase Header";
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
}

