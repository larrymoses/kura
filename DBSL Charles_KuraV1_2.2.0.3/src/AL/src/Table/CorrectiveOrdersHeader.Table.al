#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72284 "Corrective Orders Header"
{
    DrillDownPageID = "Corrective Order Responses";
    LookupPageID = "Corrective Orders";

    fields
    {
        field(1;"Order No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Project ID";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.","Project ID");
                if ObjJob.FindSet then begin
                  "Purchase Contract ID":=ObjJob."Purchase Contract ID";
                  Validate("Purchase Contract ID");
                  "Project Name":=ObjJob.Description;
                  "Project End Date":=ObjJob."Ending Date";
                  "Project Start Date":=ObjJob."Starting Date";
                  "Contractor No":=ObjJob."Contractor No.";
                  Validate("Contractor No");
                  "Works Start Chainage":=ObjJob."Section Start Chainage(Km)";
                  "Works End Chainage":=ObjJob."Section End Chainage(KM)";
                  end;
            end;
        }
        field(4;"Source Inspection No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Inspection Headersss"."Inspection No";
        }
        field(5;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Purchase Contract ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where ("Document Type"=filter("Blanket Order"));

            trigger OnValidate()
            begin
                ObjPurchaseHeader.Reset;
                ObjPurchaseHeader.SetRange(ObjPurchaseHeader."No.","Purchase Contract ID");
                if ObjPurchaseHeader.FindSet then
                  begin
                    "Contractor No":=ObjPurchaseHeader."Vendor No.";
                     Validate("Contractor No");
                    end;
            end;
        }
        field(7;"Project Start Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Project End Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                ObjVendor.Reset;
                ObjVendor.SetRange(ObjVendor."No.","Contractor No");
                if ObjVendor.FindSet then
                  "Contractor Name":=ObjVendor.Name;
            end;
        }
        field(10;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Works Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 0;
        }
        field(12;"Works End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
        field(13;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(16;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17;"No Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Portal Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Draft,Submitted';
            OptionMembers = ,Draft,Submitted;
        }
        field(19;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Corrective Order,Corrective Order Action';
            OptionMembers = ,"Corrective Order","Corrective Order Action";
        }
        field(20;"Corrective Order No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corrective Orders Header"."Order No" where ("Project ID"=field("Project ID"));

            trigger OnValidate()
            begin
                 CorrectiveOrderResponseLine.Reset;
                 CorrectiveOrderResponseLine.SetRange(CorrectiveOrderResponseLine."Corrective Order No","Order No");
                 CorrectiveOrderResponseLine.DeleteAll;

                 CorrectiveOrdersHeader.Reset;
                 CorrectiveOrdersHeader.SetRange(CorrectiveOrdersHeader."Order No","Corrective Order No");
                 if CorrectiveOrdersHeader.FindSet then
                   "Source Inspection No":=CorrectiveOrdersHeader."Source Inspection No";

                 CorrectiveOrderLine.Reset;
                 CorrectiveOrderLine.SetRange(CorrectiveOrderLine."Order No","Corrective Order No");
                 if CorrectiveOrderLine.FindSet then
                   begin
                     repeat
                        CorrectiveOrderResponseLine.Init;
                        CorrectiveOrderResponseLine."Document No":="Order No";
                        CorrectiveOrderResponseLine."Document Type":="Document Type";
                        CorrectiveOrderResponseLine."Project ID":=CorrectiveOrderLine."Project ID";
                        CorrectiveOrderResponseLine."Line No":=CorrectiveOrderResponseLine.Count+1;
                        CorrectiveOrderResponseLine."Job Task No":=CorrectiveOrderLine."Job Task No";
                        CorrectiveOrderResponseLine."Plan Line No":=CorrectiveOrderLine."Plan Line No";
                        CorrectiveOrderResponseLine.No:=CorrectiveOrderLine.No;
                        CorrectiveOrderResponseLine.Description:=CorrectiveOrderLine."Bill Item Description";
                        CorrectiveOrderResponseLine."Unit Of Measure":=CorrectiveOrderLine."Unit Of Measure";
                        CorrectiveOrderResponseLine."Chainage Description":=CorrectiveOrderLine."Chainage Description";
                        CorrectiveOrderResponseLine."Engineer Comments":=CorrectiveOrderLine.Comments;
                        if not CorrectiveOrderResponseLine.Insert then
                          CorrectiveOrderResponseLine.Modify;
                        until CorrectiveOrderLine.Next=0;
                    end;
            end;
        }
        field(21;"No of Corrective Responses";Integer)
        {
            CalcFormula = count("Corrective Orders Header" where ("Source Inspection No"=field("Source Inspection No"),
                                                                  "Document Type"=filter("Corrective Order Action")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Order No","Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Order No","Project ID","Project Name")
        {
        }
        fieldgroup(Brick;"Order No","Project ID","Project Name")
        {
        }
    }

    trigger OnInsert()
    begin
         if "Order No"='' then begin
           if "Document Type"="document type"::"Corrective Order" then begin
          RoadManagementSetup.Get;
          RoadManagementSetup.TestField("Corrective Order Nos");
          NoSeriesManagement.InitSeries(RoadManagementSetup."Corrective Order Nos",xRec."No Series",Today,"Order No","No Series");
          end;
          end;
           if "Order No"='' then begin
           if "Document Type"="document type"::"Corrective Order Action" then begin
          RoadManagementSetup.Get;
          RoadManagementSetup.TestField("Corrective Order Response Nos");
          NoSeriesManagement.InitSeries(RoadManagementSetup."Corrective Order Response Nos",xRec."No Series",Today,"Order No","No Series");
          end;
          end;
        "Created By":=UserId;
        "Created DateTime":=CreateDatetime(Today,Time);
        Status:=Status::Open;
        "Portal Status":="portal status"::Draft;
        "Document Date":=Today;
    end;

    var
        ObjJob: Record Job;
        ObjVendor: Record Vendor;
        ObjPurchaseHeader: Record "Purchase Header";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        CorrectiveOrdersHeader: Record "Corrective Orders Header";
        CorrectiveOrderResponseLine: Record "Corrective Order Response Line";
        CorrectiveOrderLine: Record "Corrective Order Line";
}

