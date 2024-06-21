#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50012 "tableextension50012" extends "Purchase Header"
{
    DrillDownPageID = "Purchase List";
    fields
    {
        modify("Document Type")
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';

            //Unsupported feature: Property Modification (OptionString) on ""Document Type"(Field 1)".

        }

        //Unsupported feature: Property Modification (Editable) on ""No. Printed"(Field 47)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Amount Including VAT"(Field 61)".

        modify(Status)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,In Progress';

            //Unsupported feature: Property Modification (OptionString) on "Status(Field 120)".


            //Unsupported feature: Property Modification (Editable) on "Status(Field 120)".

        }

        //Unsupported feature: Property Modification (Name) on ""Payment Reference"(Field 171)".

        modify("Assigned User ID")
        {
            TableRelation = "User Setup" where("Procurement officer" = const(true));
        }
        MODIFY("Purchaser Code")
        {
            trigger OnAfterValidate()
            var
                ApprovalEntry: record 454;
                Text042: text;

            //Parameters and return type have not been exported.
            //>>>> ORIGINAL CODE:
            begin
                Text042 := 'Contact:';
                ValidatePurchaserOnPurchHeader(Rec, FALSE, FALSE);

                ApprovalEntry.SETRANGE("Table ID", DATABASE::"Purchase Header");
                ApprovalEntry.SETRANGE("Document Type", "Document Type");
                ApprovalEntry.SETRANGE("Document No.", "No.");
                ApprovalEntry.SETFILTER(Status, '%1|%2', ApprovalEntry.Status::Created, ApprovalEntry.Status::Open);
                IF NOT ApprovalEntry.ISEMPTY THEN
                    ERROR(Text042, FIELDCAPTION("Purchaser Code"));

                CreateDim(
                  DATABASE::"Salesperson/Purchaser", "Purchaser Code",
                  DATABASE::Vendor, "Pay-to Vendor No.",
                  DATABASE::Campaign, "Campaign No.",
                  DATABASE::"Responsibility Center", "Responsibility Center");

            end;
            //>>>> MODIFIED CODE:
        }
        modify("Buy-from Vendor No.")
        {
            trigger OnAfterValidate()
            var
                vendor: record vendor;
                PRNRec: record "Purchase Header";
                XPRN: Record "Purchase Header";
                Pline: Record "Purchase Line";
                copyline: Record "Purchase Line";
                FromDocumentAttachment: Record "Document Attachment";
                ToDocumentAttachment: Record "Document Attachment";
                FromFieldRef: FieldRef;
                ToFieldRef: FieldRef;
                FromDocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Purchase Requisition";
                FromLineNo: Integer;
                FromNo: Code[20];
                ToNo: Code[20];
                ToDocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
                ToLineNo: Integer;
                approvalTable: Record "Approval Entry";
            begin

                if vendor.get("Buy-from Vendor No.") then begin
                    if vendor."VAT Registration No." = '' then
                    Error('Tax Registration No. is mandatory for Vendor %1 %2',vendor."No.",Vendor.Name);
                    rec."Buy-from Address" := vendor.address;
                    rec."Buy-from Address 2" := vendor."Address 2";
                    rec."Buy-from City" := vendor.city;
                    rec."Buy-from Contact" := vendor.Contact;
                    rec."Buy-from Contact No." := vendor."Phone No.";
                    rec."Buy-from Post Code" := vendor."Post Code";


                end;


                IF "No." = '' THEN
                    InitRecord;
                TestStatusOpen;
                IF ("Buy-from Vendor No." <> xRec."Buy-from Vendor No.") AND
                   (xRec."Buy-from Vendor No." <> '')
                THEN BEGIN
                    GetVend("Buy-from Vendor No.");
                    //  ////CheckBlockedVendOnDocs(Vend,FALSE);
                    //   Vend.TESTFIELD("Gen. Bus. Posting Group");
                    //  OnAfterCheckBuyFromVendor(Rec,xRec,Vend);
                    IF (xRec."Buy-from Vendor No." <> '') AND (xRec."Buy-from Vendor No." <> "Buy-from Vendor No.") THEN
                        RecallModifyAddressNotification(GetModifyVendorAddressNotificationId);

                end;
                begin
                    IF "No." = '' THEN
                        //   InitRecord;
                        //TestStatusOpen;
                        Message('Please Enter No.');
                end;
                //attach
                // FromDocumentAttachment.reset;
                // FromDocumentAttachment.SetRange("Table ID", Database::"Purchase Header");
                // // if FromDocumentAttachment.IsEmpty() then
                // ///    exit;
                // ////    FromDocumentAttachment.setfilter("Document Type",'%1',"Document Type"::"Purchase Requisition");

                //    FromDocumentAttachment.setrange("No.","PRN");
                // if FromDocumentAttachment.FindSet() then begin
                //     repeat
                //         Clear(ToDocumentAttachment);
                //         ToDocumentAttachment.Init();
                //         ToDocumentAttachment.TransferFields(FromDocumentAttachment);
                //         ToDocumentAttachment.Validate("Line No.", 10000);
                //         ToDocumentAttachment.Validate("Table ID", database::"Purchase Line");
                //         ToDocumentAttachment.Validate("No.", rec."No.");
                //         ToDocumentAttachment.Validate("Document Type", Enum::"Purchase Document Type"::Order);
                //         // if not 
                //         ToDocumentAttachment.Insert(true);
                //         //then;
                //         ToDocumentAttachment."Attached Date" := FromDocumentAttachment."Attached Date";
                //         ToDocumentAttachment.modify();
                //     until FromDocumentAttachment.Next() = 0;
                // end;
                // message('Attachments Copied Sucessfully');
                // end;
            end;

        }
        //Unsupported feature: Code Modification on ""Buy-from Vendor No."(Field 2).OnValidate".

        //trigger "(Field 2)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "No." = '' THEN
          InitRecord;
        TestStatusOpen;
        IF ("Buy-from Vendor No." <> xRec."Buy-from Vendor No.") AND
           (xRec."Buy-from Vendor No." <> '')
        THEN BEGIN
        #7..25

        GetVend("Buy-from Vendor No.");
        Vend.CheckBlockedVendOnDocs(Vend,FALSE);
        Vend.TESTFIELD("Gen. Bus. Posting Group");
        OnAfterCheckBuyFromVendor(Rec,xRec,Vend);

        #32..91

        IF (xRec."Buy-from Vendor No." <> '') AND (xRec."Buy-from Vendor No." <> "Buy-from Vendor No.") THEN
          RecallModifyAddressNotification(GetModifyVendorAddressNotificationId);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "No." = '' THEN
          InitRecord;
        TestStatusOpen;//
        #4..28

        #29..94
        */
        //end;


        //Unsupported feature: Code Modification on ""Location Code"(Field 28).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        IF ("Location Code" <> xRec."Location Code") AND
           (xRec."Buy-from Vendor No." = "Buy-from Vendor No.")
        THEN
        #5..12
          IF Location.GET("Location Code") THEN;
          "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //TestStatusOpen;//Commented by Fred on 07/03/2022. Need to know the impact.
        #2..15
        */
        //end;


        //Unsupported feature: Code Modification on ""Currency Code"(Field 32).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF NOT (CurrFieldNo IN [0,FIELDNO("Posting Date")]) OR ("Currency Code" <> xRec."Currency Code") THEN
          TestStatusOpen;
        IF (CurrFieldNo <> FIELDNO("Currency Code")) AND ("Currency Code" = xRec."Currency Code") THEN
        #4..10
              IF "Currency Factor" <> xRec."Currency Factor" THEN
                ConfirmUpdateCurrencyFactor;
            END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..13
        IF "Currency Code"<>'' THEN
        "Award Tender Sum Incl Taxes(FC":="Currency Factor"*"Award Tender Sum Inc Taxes";
        */
        //end;


        //Unsupported feature: Code Modification on ""Purchaser Code"(Field 43).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidatePurchaserOnPurchHeader(Rec,FALSE,FALSE);

        ApprovalEntry.SETRANGE("Table ID",DATABASE::"Purchase Header");
        ApprovalEntry.SETRANGE("Document Type","Document Type");
        ApprovalEntry.SETRANGE("Document No.","No.");
        ApprovalEntry.SETFILTER(Status,'%1|%2',ApprovalEntry.Status::Created,ApprovalEntry.Status::Open);
        IF NOT ApprovalEntry.ISEMPTY THEN
          ERROR(Text042,FIELDCAPTION("Purchaser Code"));

        CreateDim(
          DATABASE::"Salesperson/Purchaser","Purchaser Code",
          DATABASE::Vendor,"Pay-to Vendor No.",
          DATABASE::Campaign,"Campaign No.",
          DATABASE::"Responsibility Center","Responsibility Center");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
        IF "Document Type"="Document Type"::"Purchase Requisition" THEN BEGIN
        IF UserSetup."Procurement Manager"=FALSE THEN
          ERROR('Sorry, You are not allowed to Change this');
        END;
        END;
        #1..8
        IF "Document Type"<> "Document Type"::"Purchase Requisition" THEN BEGIN
        #10..14
          END;
        */
        //end;


        //Unsupported feature: Code Insertion on "Status(Field 120)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        // IF ("Document Type"="Document Type"::"Purchase Requisition")AND (Status=Status::Released)
        //   THEN BEGIN
        // Procurement.FnPRNCommittment(Rec);
        // EmailNotification.SendPRNApprovedMail(Rec)
        // END;
        // IF Status=Status::Released THEN BEGIN
        // IF ("Document Type"="Document Type"::"Purchase Requisition")  THEN BEGIN
        //  EmailNotification.SendPRNApprovedMail(Rec)
        // END;
        // END;
        IF ("Document Type"="Document Type"::"Blanket Order") THEN BEGIN
        IF Status=Status::Released THEN BEGIN
          "Contract Status":="Contract Status"::"Pending Signing";
          MODIFY;
          END;
          END;
        */
        //end;
        field(50000; Copied; Boolean)
        {

        }
        field(50001; "Debit Note"; Boolean)
        {

        }
        field(50002; "Fully Issued"; Boolean)
        {

        }
        field(50003; "Partially Issued"; Boolean)
        {

        }
        field(50004; "Cancelled?"; Boolean)
        {

        }
        field(50005; "Project?"; Boolean)
        {

        }
        field(50006; "Send To PM"; Boolean)
        {

        }
        field(50007; "Sent By"; Code[50])
        {

            TableRelation = User;
        }
        field(50008; "Sending Date"; Date)
        {

        }
        field(50009; "Store No"; Code[20])
        {

            //  TableRelation = Table0.Field12143624;

            trigger OnValidate()
            begin
                /*
                StoreReqLines.RESET;
                StoreReqLines.SETRANGE(StoreReqLines."Requistion No","Store No");
                IF StoreReqLines.FIND('-') THEN
                BEGIN
                //Find Purchase Lines
                PurchaseLine.RESET;
                PurchaseLine.SETRANGE(PurchaseLine."Document No.","No.");
                //PurchaseLine.SETRANGE(PurchaseLine."Document Type",PurchaseLine."Document Type"::Quote);
                IF PurchaseLine.FIND('-') THEN
                BEGIN
                PurchaseLine.DELETEALL;
                  REPEAT
                    LineNo:=LineNo+1000;
                    PurchaseLine.INIT;
                    PurchaseLine."Line No.":=LineNo;
                    PurchaseLine."Document No.":="No.";
                    PurchaseLine."No.":=StoreReqLines."No.";
                    PurchaseLine."Document Type":=PurchaseLine."Document Type"::Quote;
                    PurchaseLine.Description:=StoreReqLines.Description;
                    PurchaseLine.Quantity:=StoreReqLines.Quantity;
                    PurchaseLine."Unit of Measure":=StoreReqLines."Unit of Measure";
                    PurchaseLine.INSERT;
                  UNTIL StoreReqLines.NEXT=0;
                END ELSE
                BEGIN
                    MESSAGE('NOT FOUND');
                
                  REPEAT
                    LineNo:=LineNo+10000;
                    PurchaseLine.INIT;
                    PurchaseLine."Line No.":=LineNo;
                    PurchaseLine."Document No.":="No.";
                    PurchaseLine."No.":=StoreReqLines."No.";
                    PurchaseLine."Document Type":=PurchaseLine."Document Type"::Quote;
                    PurchaseLine.Description:=StoreReqLines.Description;
                    PurchaseLine.Quantity:=StoreReqLines.Quantity;
                    PurchaseLine."Unit of Measure":=StoreReqLines."Unit of Measure";
                
                    PurchaseLine.INSERT;
                  UNTIL StoreReqLines.NEXT=0;
                
                  END;
                
                END;
                
                */

            end;
        }
        field(50010; Replenishment; Boolean)
        {

        }
        field(50011; Description; Text[250])
        {


            trigger OnValidate()
            begin
                //Ushindi///
                TestField(Status, Status::Open);
            end;
        }
        field(50012; "Requisition Type"; Option)
        {

            OptionCaption = ' ,Internal Use,Project,Stock Replenishment,Technical Installation,Technical Maintenance,Stock Return';
            OptionMembers = " ","Internal Use",Project,"Stock Replenishment","Technical Installation","Technical Maintenance","Stock Return";

            trigger OnValidate()
            begin

                TestField(Status, Status::Open);
                // PurchLine.Reset;
                // PurchLine.SetRange(PurchLine."Document Type",PurchLine."document type"::"Store Requisition");
                // PurchLine.SetRange(PurchLine."Document No.","No.");

                // if PurchLine.FindFirst then begin
                // Error('You must first delete the Requsisition lines below.Please check!!');
                // end;

                /*
                //Ensure CTW IRs are either Internal use or Return only..
                //Ushindi...
                IF "ChargeToWork?"=TRUE THEN BEGIN
                 IF ("Requisition Type"<>"Requisition Type"::"Internal Use") AND   ("Requisition Type"<>"Requisition Type"::"Stock Return")
                 THEN ERROR('CTW Requisitions can only be of either Type Internal Use or Return, Please check!');
                
                END;
                //End ..Ushindi
                
                */

            end;
        }
        field(50013; "Taken By"; Code[60])
        {

        }
        field(50014; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50015; "Project Name"; Code[600])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Valid to Date"; Date)
        {


            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
            begin
                /*
               //CMM 271008 CHECK RIGHTS TO CHANGE VALIDITY DATE
                  IF ("Valid to Date" <> xRec."Valid to Date") AND (xRec."Valid to Date"<>0D) THEN BEGIN
                     IF UserSetup.GET(USERID)  THEN
                         IF UserSetup."Extend Purch. Quote/LPO Period" <> TRUE THEN
                           ERROR('You do not have suuficient rights to change the validity date');
                  END;
               //END CMM
                 */

            end;
        }
        field(50017; "Request-By No."; Code[10])
        {

            Editable = false;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                //CAW 240908 EALAYER
                Empl.Reset;
                Empl.SetRange(Empl."No.", "Request-By No.");
                if Empl.Find('-') then begin
                    HOD := Empl.HOD;
                    "Directorate Code" := Empl."Directorate Code";
                    "Department Code" := Empl."Department Code";
                    "Request-By Name" := Empl."First Name" + ' ' + Empl."Middle Name" + ' ' + Empl."Last Name";
                    Region := Empl."Global Dimension 1 Code";
                    // "Shortcut Dimension 1 Code":=Empl."Global Dimension 1 Code";
                    Division := Empl.Division;
                    "Shortcut Dimension 1 Code" := Empl."Global Dimension 1 Code";
                    //VALIDATE("Shortcut Dimension 1 Code");
                    //"Shortcut Dimension 3 Code":=Empl."Shortcut Dimension 3";
                    // VALIDATE("Shortcut Dimension 2 Code");
                end;

                TestField(Status, Status::Open);
                if ("Request-By No." <> xRec."Request-By No.") and
                 (xRec."Request-By No." <> '')
                 then begin
                    //   if HideValidationDialog then
                    //     Confirmed := true
                    //   else
                    //     Confirmed := Confirm(ConfirmChangeQst,false,FieldCaption("Request-By No."));

                    //       if Confirmed then begin
                    //         PurchLine.SetRange("Document Type","Document Type");
                    //         PurchLine.SetRange("Document No.","No.");
                    //            if "Request-By No." = '' then begin
                    //              if not PurchLine.IsEmpty then begin
                    //                Error(
                    //                Text005,
                    //                FieldCaption("Request-By No."));
                    //                Init;
                    //                PurchSetup.Get;
                    //               "No. Series" := xRec."No. Series";
                    //                InitRecord;
                    //              end;

                    if xRec."Posting No." <> '' then begin
                        "Posting No. Series" := xRec."Posting No. Series";
                        "Posting No." := xRec."Posting No.";
                    end;

                    //        if ("Document Type" = "document type"::"Store Requisition") or ("Document Type"="document type"::"IEC Materials") then
                    //           PurchLine.SetFilter("Qty. Requested",'<>0');
                    //        end;

                    //     PurchLine.Reset;

                    //     end else begin
                    //     Rec := xRec;
                    //     exit;

                    //    end;
                end;
            end;
        }
        field(50018; "Request-By Name"; Text[50])
        {
            Editable = false;
        }
        field(50019; "Requester ID"; Code[50])
        {

            Editable = true;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if UsersRec.Get(UserId) then begin
                    if UsersRec."Portal User" = false then begin //exempt the portal user name
                                                                 //"Requester ID":=USERID;
                        "Request-By Name" := UsersRec."Employee Name";
                        "Request-By No." := UsersRec."Employee No.";
                        "Responsibility Center" := UsersRec."Purchase Resp. Ctr. Filter";
                        "Shortcut Dimension 1 Code" := UsersRec."Region Code";
                        Message("Shortcut Dimension 1 Code");
                        Validate("Shortcut Dimension 1 Code");

                    end;
                end;
            end;
        }
        field(50020; "Purchase Requisition No."; Code[20])
        {

            Enabled = true;
        }
        field(50021; "Created Quotes"; Integer)
        {

        }
        field(50022; "Store Requisition No."; Code[20])
        {

        }
        field(50023; "Budgeted  Name"; Code[10])
        {

            TableRelation = "G/L Budget Name";
        }
        field(50024; "Requisition Expense Group"; Code[10])
        {
            Caption = 'Requisition Expense Group';

            Description = '//Track IR Expense A/C---Used to map to Inv Adj A/c...Ushindi';
            TableRelation = "Gen. Business Posting Group" where("Auto Link Internal Requisition" = const(true));

            trigger OnValidate()
            begin
                /*
                IF ("Document Type" = "Document Type"::"Store Requisition") OR ("Document Type"="Document Type"::"IEC Materials")  THEN BEGIN
                  IF GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp,"Gen. Bus. Posting Group") THEN BEGIN
                    "VAT Bus. Posting Group" := GenBusPostingGrp."Def. VAT Bus. Posting Group";
                    RecreatePurchLines(FIELDCAPTION("Gen. Bus. Posting Group"));
                     END;
                     END;
                
                   //Ushindi...Ensure any existing IR lines have to be deleted before changing expense group
                 TESTFIELD(Status,Status::Open);
                PurchLine.RESET;
                PurchLine.SETRANGE(PurchLine."Document Type",PurchLine."Document Type"::"Store Requisition");
                PurchLine.SETRANGE(PurchLine."Document No.","No.");
                
                IF PurchLine.FINDFIRST THEN BEGIN
                ERROR('You must first delete the Requsisition lines before updating the Expense Group.Please check!!');
                END;
                
                //Ushindi..>Ensure Gen Business PG is initialized as the Expense Category
                "Gen. Bus. Posting Group":="Requisition Expense Group";
                VALIDATE("Gen. Bus. Posting Group");
                //Ushindi
                
                //All other purchase documents need vendor gen business posting grp validation
                IF "Document Type" <> "Document Type"::"Store Requisition"  THEN BEGIN
                IF (xRec."Buy-from Vendor No." = "Buy-from Vendor No.") AND
                   (xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group")
                THEN
                  IF GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp,"Gen. Bus. Posting Group") THEN BEGIN
                    "VAT Bus. Posting Group" := GenBusPostingGrp."Def. VAT Bus. Posting Group";
                    RecreatePurchLines(FIELDCAPTION("Gen. Bus. Posting Group"));
                  END;
                  END;
                
                //
                */

            end;
        }
        field(50025; "ChargeToWork?"; Boolean)
        {

            Description = '//Track CTW IRs....Ushindi';

            trigger OnValidate()
            begin

                /*
                //Ushindi changes.....21st Jan 2015

               //Ensure all CTW IRs have the relevant CTW Expense Group
               TESTFIELD("Requisition Expense Group");
               //CTW IR should not be linked to Stock Replenishment IR Type
               IF "Requisition Type"="Requisition Type"::"Stock Replenishment"
               THEN ERROR('Charge To Work IRs can not be tied to Stock Replenishment Type, Please check!');
                */

            end;
        }
        field(50027; "Beneficiary Name"; Text[30])
        {

        }
        field(50028; "Beneficiary Address"; Text[30])
        {

        }
        field(50029; "Beneficiary Address 2"; Text[20])
        {

        }
        field(50030; "Beneficiary City"; Text[30])
        {

        }
        field(50031; "IR External Document No"; Code[35])
        {

            Description = 'Track External Doc No';
        }
        field(50061; "PO Type"; Option)
        {

            OptionCaption = ' ,LSO,LPO';
            OptionMembers = " ",LSO,LPO;
        }
        field(50069; "Vote Item"; Code[20])
        {

            Editable = false;
            TableRelation = "G/L Account";
        }
        field(50070; "Vote Amount"; Decimal)
        {
            CalcFormula = lookup("G/L Budget Entry".Amount where("G/L Account No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50072; "Budget Commitments"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Budget Commitments" where("Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(51001; "Inspection Team Setup?"; Boolean)
        {
            CalcFormula = exist("Goods & Services Inspection" where("No." = field("No."),
                                                                     "Vendor Shipment No." = field("Vendor Shipment No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(51002; "Inspection Completed?"; Boolean)
        {
            CalcFormula = - exist("Goods & Services Inspection" where("No." = field("No."),
                                                                      "Vendor Shipment No." = field("Vendor Shipment No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59000; "Contract No."; Code[25])
        {

        }
        field(59001; "Contract Name"; Text[250])
        {

        }
        field(59009; "Sending Time"; Time)
        {

        }
        field(59021; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';

            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job));

            trigger OnValidate()
            var
                purchline: Record "Purchase Line";
            begin
                /*
                TESTFIELD("Receipt No.",'');
                
                IF "Job Task No." <> xRec."Job Task No." THEN BEGIN
                  VALIDATE("Job Planning Line No.",0);
                  IF "Document Type" = "Document Type"::Order THEN
                    TESTFIELD("Quantity Received",0);
                END;
                
                IF "Job Task No." = '' THEN BEGIN
                  CLEAR(JobJnlLine);
                  "Job Line Type" := "Job Line Type"::" ";
                  UpdateJobPrices;
                  EXIT;
                END;
                
                JobSetCurrencyFactor;
                IF JobTaskIsSet THEN BEGIN
                  CreateTempJobJnlLine(TRUE);
                  UpdateJobPrices;
                END;
                UpdateDimensionsFromJobTask;
                
                */

                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.", Job);
                //JobPlanningLine.SETRANGE(JobPlanningLine."Job Task No.","Job Task No.");
                if JobPlanningLine.FindSet then begin
                    PurchLine.Reset;
                    PurchLine.SetRange(PurchLine."Job No.", JobPlanningLine."Job No.");
                    PurchLine.SetRange(PurchLine."Job Task No.", JobPlanningLine."Job Task No.");
                    if PurchLine.FindSet then
                        PurchLine.DeleteAll;
                    repeat
                        PurchLine.Init;
                        PurchLine."Document Type" := "Document Type";
                        PurchLine."Document No." := "No.";
                        PurchLine.Reset;
                        PurchLine.SetRange("Document No.", "No.");
                        if PurchLine.FindLast then
                            PurchLine."Line No." := PurchLine."Line No." + 10;
                        PurchLine.Quantity := JobPlanningLine.Quantity;
                        PurchLine.Validate(Quantity);
                        PurchLine.Type := PurchLine.Type::Item;
                        PurchLine."Item Category Code" := JobPlanningLine."Road Activity Categories";
                        PurchLine."No." := JobPlanningLine."No.";
                        PurchLine.Validate("No.");
                        PurchLine.Description := JobPlanningLine.Description;
                        PurchLine."Unit of Measure" := JobPlanningLine."Unit of Measure";
                        PurchLine."Unit of Measure Code" := JobPlanningLine."Unit of Measure Code";
                        PurchLine."Unit of Measure" := JobPlanningLine."Unit of Measure Code";
                        PurchLine."Unit of Measure Code" := JobPlanningLine."Unit of Measure";
                        PurchLine."Direct Unit Cost" := JobPlanningLine."Unit Cost";
                        PurchLine.VALIDATE("Direct Unit Cost");
                        PurchLine."Technology Code" := JobPlanningLine."Road Technology";
                        PurchLine."Labour %" := JobPlanningLine."Labour (%)";
                        PurchLine."Contract Type" := JobPlanningLine."Contract Type";
                        purchline."Road Code." := JobPlanningLine."Road Code";
                        //added for Reversion Type
                        PurchLine."Reversion Type" := JobPlanningLine."Reversion Type";
                        JobTask.Reset;
                        JobTask.SetRange(JobTask."Job Task No.", JobPlanningLine."Job Task No.");
                        if JobTask.FindSet then begin
                            PurchLine."Start Chainage(Km)" := JobTask."Start Point(Km)";
                            PurchLine."End Chainage(Km)" := JobTask."End Point(Km)";

                        end;
                        PurchLine.Insert;

                    until JobPlanningLine.Next = 0;
                end;

                JobS.Reset;
                JobS.SetRange(JobS."No.", Job);
                if JobS.FindSet then begin
                    "Road Code" := JobS."Road Code";
                    Validate("Road Code");
                end;

            end;
        }
        field(59024; "Budget Item"; Code[20])
        {
            CalcFormula = lookup("Purchase Line"."Vote Item" where("Document No." = field("No.")));
            Caption = 'Job No.';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = Job;

            trigger OnValidate()
            var
                Job: Record Job;
            begin
                /*TESTFIELD("Drop Shipment",FALSE);
                TESTFIELD("Special Order",FALSE);
                TESTFIELD("Receipt No.",'');
                IF "Document Type" = "Document Type"::Order THEN
                  TESTFIELD("Quantity Received",0);
                
                IF ReservEntryExist THEN
                  TESTFIELD("Job No.",'');
                
                IF "Job No." <> xRec."Job No." THEN BEGIN
                  VALIDATE("Job Task No.",'');
                  VALIDATE("Job Planning Line No.",0);
                END;
                
                IF "Job No." = '' THEN BEGIN
                  CreateDim(
                    DATABASE::Job,"Job No.",
                    DimMgt.TypeToTableID3(Type),"No.",
                    DATABASE::"Responsibility Center","Responsibility Center",
                    DATABASE::"Work Center","Work Center No.");
                  EXIT;
                END;
                
                IF NOT (Type IN [Type::Item,Type::"G/L Account"]) THEN
                  FIELDERROR("Job No.",STRSUBSTNO(Text012,FIELDCAPTION(Type),Type));
                Job.GET("Job No.");
                Job.TestBlocked;
                "Job Currency Code" := Job."Currency Code";
                
                CreateDim(
                  DATABASE::Job,"Job No.",
                  DimMgt.TypeToTableID3(Type),"No.",
                  DATABASE::"Responsibility Center","Responsibility Center",
                  DATABASE::"Work Center","Work Center No.");
                
                */


                /*
                IF Jobs.GET("Budget Item") THEN BEGIN
                Jobs.CALCFIELDS(Jobs."Recog. Costs G/L Amount",Jobs."Actual Project Costs");
                
                IF Harvest=TRUE THEN
                "Total Project Cost":=Jobs."Actual Project Costs";
                END;
                */

            end;
        }
        field(59025; "Buget Desc"; Text[50])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("Budget Item")));
            FieldClass = FlowField;
        }
        field(59030; "Budgeted Amount"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Vote Amount" where("Document No." = field("No.")));
            Description = '//daudi changed for schedule to Budget as per the new structure';
            Editable = false;
            FieldClass = FlowField;
        }
        field(59031; "Actual Budget Costs"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Actual To Date" where("Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59033; "Available Funds"; Decimal)
        {
            CalcFormula = average("Purchase Line"."Available Funds" where("Document No." = field("No.")));
            FieldClass = FlowField;
        }
        field(59034; "Requisition Amount"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document Type" = field("Document Type"),
                                                                   "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59035; "Remaining Budget"; Decimal)
        {

            Editable = false;
        }
        field(59036; "Required Date"; Date)
        {

        }
        field(59037; "Function Name"; Text[50])
        {

            Description = 'Stores the name of the function in the database';
        }
        field(59038; "Budget Center Name"; Text[45])
        {

            Description = 'Stores the name of the budget center in the database';
        }
        field(59039; "Store Requisition Type"; Option)
        {

            OptionMembers = " ",Item,"Minor Asset";
        }
        field(59040; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';

            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(59041; "Unit  Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 3 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(59042; "Total Project Cost"; Decimal)
        {

        }
        field(59043; Harvest; Boolean)
        {


            trigger OnValidate()
            begin
                //VALIDATE("Budget Item");
            end;
        }
        field(59044; "Procurement Type"; Code[20])
        {

            TableRelation = "Procurement Types".Code;
        }
        field(59045; "Contract Number"; Code[25])
        {

        }
        field(59046; "Date received"; Date)
        {

        }
        field(59047; "Approved Requisition Amount"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69013; "Order types"; Option)
        {

            OptionCaption = 'LPO,LSO';
            OptionMembers = LPO,LSO;
        }
        field(69020; "Reason to reopen"; Text[20])
        {

        }
        field(69021; "Reason to Cancel"; Text[20])
        {

        }
        field(69022; "Order Number"; Code[20])
        {

        }
        field(70000; Committed; Boolean)
        {

        }
        field(70001; CommittedBy; Code[30])
        {

        }
        field(70002; "Procurement Plan"; Code[10])
        {

            TableRelation = "Procurement Header".No;
        }
        field(70003; "Procurement Plan Item"; Code[10])
        {

            TableRelation = "Procurement Plan1"."Plan Item No" where("Plan Year" = field("Procurement Plan"));

            trigger OnValidate()
            begin
                PlanItem.Reset;
                PlanItem.SetRange("Plan Item No", "Procurement Plan Item");
                if PlanItem.Find('-') then
                    "Procurement Plan Item Descript" := PlanItem."Item Description";
            end;
        }
        field(70004; "Request Ref No"; Code[10])
        {

        }
        field(70005; "Supplier Type"; Code[30])
        {

        }
        field(70006; "Process Type"; Code[20])
        {

            TableRelation = "Procurement Method".Code;

            trigger OnValidate()
            begin

                //   PurchSetup.Get; //"Max Low Value Proc Amount"

                if "Process Type" <> '' then
                    if Confirm(Text0061, true, "Process Type") then begin
                        ProcCeiling.Reset;
                        ProcCeiling.SetRange(ProcCeiling."Method of Procurement", "Process Type");
                        if ProcCeiling.FindSet then begin
                            CalcFields(Amount);
                            if Amount > ProcCeiling."Maximum Ceiling" then
                                Error(Text0059, "Process Type", ProcCeiling."Maximum Ceiling");
                            if Amount < ProcCeiling."Minimum Ceiling" then
                                Error(Text0060, "Process Type", ProcCeiling."Minimum Ceiling");
                        end;
                    end
                    else
                        "Process Type" := '';
            end;
        }
        field(70007; "Purchase Type"; Code[30])
        {

            TableRelation = "Purchases Types";
        }
        field(70008; "Requisition No"; Code[20])
        {

            TableRelation = "Purchase Header"."No." where("Document Type" = const("Purchase Requisition"),
                                                           Status = const(Released));

            trigger OnValidate()
            begin
                if "Requisition No" <> '' then begin
                    RequisitionLines.Reset;
                    // RequisitionLines.SetRange(RequisitionLines."Requisition No","Requisition No");
                    if RequisitionLines.Find('-') then
                        //"Activity Type":=RequisitionLines."Activity Type";
                        // Activity:=RequisitionLines.Activity;
                        repeat
                        //  PurchLine."Document Type":=PurchLine."document type"::Order;
                        //  PurchLine."Document No.":="No.";


                        //  PurchLine.Reset;
                        //  PurchLine.SetRange(PurchLine."Document No.","No.");
                        //  if PurchLine.Find('+') then
                        //  PurchLine."Line No.":=PurchLine."Line No."+10000;

                        //  if RequisitionLines.Type=RequisitionLines.Type::"G/L Account" then
                        //  PurchLine.Type:=PurchLine.Type::"G/L Account"
                        //  else
                        //  PurchLine.Type:=RequisitionLines.Type;

                        //  PurchLine."No.":=RequisitionLines."No.";
                        //  PurchLine.Validate(PurchLine."No.");
                        //  PurchLine."Buy-from Vendor No." := "Buy-from Vendor No.";
                        //  PurchLine."Gen. Bus. Posting Group" := "Gen. Bus. Posting Group";
                        //  PurchLine."VAT Bus. Posting Group" := "VAT Bus. Posting Group";
                        // // PurchLine."VAT Prod. Posting Group" := ;
                        //  PurchLine."Pay-to Vendor No." := "Pay-to Vendor No.";
                        //  PurchLine.Description:=RequisitionLines.Description;
                        //  PurchLine.Quantity:=RequisitionLines.Quantity;
                        //  PurchLine."Unit of Measure":=RequisitionLines."Unit of Measure";
                        //  PurchLine."Shortcut Dimension 1 Code" := RequisitionLines."Shortcut Dimension 1 Code";
                        //  PurchLine."Shortcut Dimension 2 Code" := RequisitionLines."Shortcut Dimension 2 Code";

                        // PurchLine."Unit Price (LCY)":=RequisitionLines."Unit Price";
                        // PurchLine.Amount:=RequisitionLines.Amount;
                        //  PurchLine.Insert;
                        until RequisitionLines.Next = 0;
                end;
            end;
        }
        field(70009; Ordered; Boolean)
        {

            Editable = false;
        }
        field(70010; HOD; Boolean)
        {

            Editable = false;
        }
        field(70014; "Department Code"; Code[100]) // Amos --> Increased the field length from 30 to 100 (25/07/2023)
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
            trigger OnValidate()
            var
                resp: record "Responsibility Center";
            begin
                if resp.get(rec."Department Code") then
                    REC."Department Name2" := RESP.Name;

            end;
        }
        field(70018; "Directorate Code"; Code[100])// Amos --> Increased the field length from 50 to 100 (25/07/2023)
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
            trigger OnValidate()
            var
                resp: record "Responsibility Center";
            begin
                if resp.get(rec."DIRECTORATE CODE") then
                    REC."Directorate Name" := RESP.Name;

            end;
        }
        field(70019; Division; Code[50])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));

        }
        field(70020; Job; Code[50])
        {
            TableRelation = Job;
            Caption = 'Project No.';
            trigger OnValidate()
            var
                JobRec: Record Job;
            begin
                if JobRec.Get(Job) then begin
                    "Job Name" := JobRec.Description;
                    Approver := JobRec."Project Manager";

                end;
            end;
        }
        field(70021; "Job Name"; Text[250])
        {

        }
        field(70022; Approver; Code[30])
        {

            TableRelation = "User Setup";
        }
        field(70023; "Supplier Code"; Code[20])
        {

            TableRelation = Vendor;

            trigger OnValidate()
            var
                vend: Record vendor;
            begin
                if Vend.Get("Supplier Code") then
                    Supplier := Vend.Name;
            end;
        }
        field(70024; Supplier; Text[100])
        {

        }
        field(70025; Specifications; Text[250])
        {

        }
        field(70026; "Item Category"; Code[20])
        {

            TableRelation = "Item Category".Code where(Indentation = const(0));

            trigger OnValidate()
            begin
                /*ItemCategory.RESET;
                ItemCategory.SETRANGE("Item No","Item Category Description");
                IF ItemCategory.FIND('-') THEN
                  "Item Category Description":=ItemCategory.Description;*/

            end;
        }
        field(70027; "General Item Category"; Code[20])
        {

            TableRelation = "General Item Categories".Code;
        }
        field(70028; "Archive Requisitions"; Boolean)
        {

        }
        field(70029; Consitituency; Code[30])
        {

            TableRelation = Constituency;
        }
        field(70030; "Priority Level"; Option)
        {

            OptionCaption = ',Low,Normal,High,Critical';
            OptionMembers = ,Low,Normal,High,Critical;
        }
        field(70031; "Planned Commencement Date"; Date)
        {

        }
        field(70032; "Road Code"; Code[20])
        {

            //    TableRelation = "Road Inventory";

            trigger OnValidate()
            begin
                // Roadinve.Reset;
                // if Roadinve.Get("Road Code")then begin
                //   "Link Name":=Roadinve."Link Name";
                //   Modify(true);
                //  end;
            end;
        }
        field(70033; "Link Name"; Text[200])
        {

        }
        field(70034; "Works Length (Km)"; Decimal)
        {

        }
        field(70035; Region; Code[50])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(70036; "Funding Agency"; Code[20])
        {

            TableRelation = "Funding Agency";
        }
        field(70037; "Funding Source"; Code[20])
        {

            TableRelation = "Funding Source";
        }
        field(70038; "Solicitation Type"; Code[30])
        {

        }
        field(70040; "Requisition Product Group"; Option)
        {

            Description = 'New field used to categorize the Items further into Goods, Works, Services and Assets. NB: In most organizations, the Works, Services and Assets shall be setup under TYPE:SERVICE';
            OptionCaption = 'Goods,Services,Works,Assets';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(70041; "IFS Linked"; Boolean)
        {

        }
        field(70042; "Requisition Template ID"; Code[30])
        {

            TableRelation = if ("PRN Type" = const(Standard)) "Purchase Requisition Template".Code where("Template Type" = const(Standard))
            else
            if ("PRN Type" = const("Project Works")) "Purchase Requisition Template".Code where("Template Type" = const(BoQ));
        }
        field(70043; "PRN Type"; Option)
        {

            OptionCaption = 'Standard,Project Works';
            OptionMembers = Standard,"Project Works";
        }
        field(70044; "Project Staffing Template ID"; Code[30])
        {

            TableRelation = "Project Key Staff Template".Code where(Blocked = filter(false));
        }
        field(70045; "Works Equipment Template ID"; Code[30])
        {

            TableRelation = "Works Equipment Template".Code;
        }
        field(70046; "Procurement Plan ID"; Code[10])
        {

            TableRelation = "Procurement Plan".Code;
        }
        field(70047; "Procurement Plan Entry No"; Integer)
        {

            TableRelation = if ("PRN Type" = const(Standard)) "Procurement Plan Entry"."Entry No." where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                                                        "Requisition Product Group" = field("Requisition Product Group"),
                                                                                                        Region = field(Region),
                                                                                                        Directorate = field("Directorate Code"),
                                                                                                        Department = field("Department Code"),
                                                                                                        "Procurement Use" = const("Standard (Internal Use)"))
            else
            if ("PRN Type" = const("Project Works")) "Procurement Plan Entry"."Entry No." where("Procurement Plan ID" =
            field("Procurement Plan ID"),
                                            "Requisition Product Group" = const(Works),
                                             Region = FIELD("Shortcut Dimension 1 Code"),
"Entry Used" = const(false),
                                            "Directorate" = field("Directorate Code"),

                                             "Department" = field("Department Code"),
            "Procurement Use" = const("Project-Specific Use"));

            trigger OnValidate()
            begin
                // PPlanEntry.Reset;
                // PPlanEntry.SetRange(PPlanEntry."Entry No.", "Procurement Plan Entry No");
                // if PPlanEntry.Find('-') then begin
                //     PPlanEntry."Entry Used" := true;
                //     PPlanEntry.modify(True);
                // end;

                PPlanEntry.Reset;
                PPlanEntry.SetRange(PPlanEntry."Entry No.", "Procurement Plan Entry No");
                if PPlanEntry.Find('-') then begin

                    //MESSAGE(FORMAT(PPlanEntry."Entry No."));
                    PPlanEntry.CalcFields("Total Purchase Commitments");
                    PPlanEntry.CalcFields("Total PO Commitments");
                    PPlanEntry.CalcFields("Total PRN Commitments");
                    TotalCommitments := PPlanEntry."Total PO Commitments" + PPlanEntry."Total PRN Commitments";
                    AvaillableBudget := PPlanEntry."Line Budget Cost" - TotalCommitments;
                    "PP Planning Category" := PPlanEntry."Planning Category";
                    "Procurement Plan Item Descript" := PPlanEntry.Description;
                    // Amos (14/08/2023) --> Commented out this to prevent overwriting the description entered from the portal when creating a requisition
                    // rec.Description := PPlanEntry."Item Description";
                    "PP Funding Source ID" := PPlanEntry."Funding Source ID";
                    "Shortcut Dimension 2 Code" := PPlanEntry."Funding Source ID";
                    rec."Estimated Cost" := PPlanEntry."Estimated Cost of Project";
                    "PP Total Budget" := PPlanEntry."Line Budget Cost";
                    "PP Total Actual Costs" := PPlanEntry."Total Actual Costs";
                    "PP Total Commitments" := TotalCommitments;
                    "PP Solicitation Type" := PPlanEntry."Solicitation Type";
                    "PP Procurement Method" := PPlanEntry."Procurement Method";
                    "PP Total Available Budget" := AvaillableBudget;
                    "PP Preference/Reservation Code" := PPlanEntry."Preference/Reservation Code";
                    Job := PPlanEntry."Budget Control Job No";
                    "Budget Item" := PPlanEntry."Budget Control Job No";
                    //MESSAGE(Job);
                    "Job Task No." := PPlanEntry."Budget Control Job Task No.";
                    //MESSAGE('job No %1 job task no',Job,"Job Task No.");
                    "PP  Invitation Notice Type" := PPlanEntry."Invitation Notice Type";
                    Consitituency := PPlanEntry.Constituency;
                    "Road Code" := PPlanEntry."Road No.";
                    "Link Name" := PPlanEntry."Road Name";
                    "Works Length (Km)" := PPlanEntry."Section Length(Km)";
                    SoliType.Reset;
                    SoliType.SetRange(Code, PPlanEntry."Solicitation Type");
                    if SoliType.FindSet then begin
                        "PP Bid Selection Method" := SoliType."Default Bid Selection Method";
                    end;
                end;
                if "Requisition Product Group" = "requisition product group"::Works then
                    Validate("Job Task No.");
            end;
        }
        field(70048; "PP Planning Category"; Code[20])
        {

            TableRelation = "Procurement Plan Entry"."Planning Category";
            trigger OnValidate()
            begin

                PPlanEntry.Reset;
                PPlanEntry.SetRange(PPlanEntry."Planning Category", "PP Planning Category");
                if PPlanEntry.Find('-') then begin

                    PPlanEntry.CalcFields("Total Purchase Commitments");
                    PPlanEntry.CalcFields("Total PO Commitments");
                    PPlanEntry.CalcFields("Total PRN Commitments");
                    TotalCommitments := PPlanEntry."Total PO Commitments" + PPlanEntry."Total PRN Commitments";
                    AvaillableBudget := PPlanEntry."Line Budget Cost" - TotalCommitments;
                    "PP Planning Category" := PPlanEntry."Planning Category";
                    "Procurement Plan Item Descript" := PPlanEntry.Description;
                    "PP Funding Source ID" := PPlanEntry."Funding Source ID";
                    "Shortcut Dimension 2 Code" := PPlanEntry."Funding Source ID";
                    rec."Estimated Cost" := PPlanEntry."Estimated Cost of Project";
                    "PP Total Budget" := PPlanEntry."Line Budget Cost";
                    "PP Total Actual Costs" := PPlanEntry."Total Actual Costs";
                    "PP Total Commitments" := TotalCommitments;
                    "PP Solicitation Type" := PPlanEntry."Solicitation Type";
                    "PP Procurement Method" := PPlanEntry."Procurement Method";
                    "PP Total Available Budget" := AvaillableBudget;
                    "PP Preference/Reservation Code" := PPlanEntry."Preference/Reservation Code";
                    Job := PPlanEntry."Budget Control Job No";
                    "Budget Item" := PPlanEntry."Budget Control Job No";
                    //MESSAGE(Job);
                    "Job Task No." := PPlanEntry."Budget Control Job Task No.";
                    //MESSAGE('job No %1 job task no',Job,"Job Task No.");
                    "PP  Invitation Notice Type" := PPlanEntry."Invitation Notice Type";
                    Consitituency := PPlanEntry.Constituency;
                    "Road Code" := PPlanEntry."Road No.";
                    "Link Name" := PPlanEntry."Road Name";
                    "Works Length (Km)" := PPlanEntry."Section Length(Km)";
                    SoliType.Reset;
                    SoliType.SetRange(Code, PPlanEntry."Solicitation Type");
                    if SoliType.FindSet then begin
                        "PP Bid Selection Method" := SoliType."Default Bid Selection Method";
                    end;
                end;
                if "Requisition Product Group" = "requisition product group"::Works then
                    Validate("Job Task No.");


            end;
        }
        field(70049; "PP Funding Source ID"; Code[20])
        {

            TableRelation = "Procurement Plan Entry"."Funding Source ID";
        }
        field(70050; "PP Total Budget"; Decimal)
        {

            Editable = false;
        }
        field(70051; "PP Total Actual Costs"; Decimal)
        {

            Editable = false;
        }
        field(70052; "PP Total Commitments"; Decimal)
        {

            Editable = false;
            trigger OnValidate()
            begin

            end;
        }
        field(70053; "PP Total Available Budget"; Decimal)
        {

            Editable = false;
        }
        field(70054; "PP Solicitation Type"; Code[30])
        {

            TableRelation = "Solicitation Type".Code;

            trigger OnValidate()
            begin
                if UserSetup.Get(UserId) then begin
                    if "Document Type" = "document type"::"Purchase Requisition" then begin
                        if UserSetup."Procurement Manager" = false then
                            Error('Sorry, You are not allowed to Change this');
                    end;
                end;
                SoliType.Reset;
                SoliType.SetRange(Code, "PP Solicitation Type");
                if SoliType.FindSet then begin
                    "PP Procurement Method" := SoliType."Default Procurement Method";
                    "PP  Invitation Notice Type" := SoliType."PP  Invitation Notice Type";
                end;
            end;
        }
        field(70055; "PP Procurement Method"; Option)
        {

            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(70056; "PP Preference/Reservation Code"; Code[10])
        {

            TableRelation = "Special Vendor Category".Code;
        }
        field(70057; "PRN Conversion Procedure"; Option)
        {

            OptionCaption = 'Invitation For Bids,Direct PO';
            OptionMembers = "Invitation For Supply","Direct PO";
        }
        field(70058; "Ordered PRN"; Boolean)
        {

        }
        field(70059; "Linked IFS No."; Code[30])
        {

        }
        field(70060; "Linked LPO No."; Code[30])
        {

        }
        field(70061; "Works Category"; Code[30])
        {

            TableRelation = "Works Category".Code;

            trigger OnValidate()
            begin
                WorksCategory.Reset;
                WorksCategory.SetRange(Code, "Works Category");
                if WorksCategory.FindSet then
                    "Works Description" := WorksCategory.Description;
            end;
        }
        field(70062; "Works Description"; Text[100])
        {

            Editable = false;
        }
        field(70063; "Total PRN Amount"; Decimal)
        {
            //from amount including vat
            CalcFormula = sum("Purchase Line"."Amount" where("Document Type" = field("Document Type"),
                                                                            "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70064; "Total PRN Amount (LCY)"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Amount Including VAT" where("Document Type" = field("Document Type"),
                                                                            "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70065; "PP  Invitation Notice Type"; Option)
        {

            OptionCaption = ',Single  Stage Tender,Two Stage Tender,RFQ,Low Value Procurement,Direct Procurement';
            OptionMembers = ,"Single  Stage Tender","Two Stage Tender",RFQ,"Low Value Procurement","Direct Procurement";
        }
        field(70066; "PP Bid Selection Method"; Code[20])
        {

        }
        field(70067; "PRN Order Date/Time"; DateTime)
        {

        }
        field(70068; "Document Status"; Option)
        {

            OptionCaption = 'Draft,Submitted,Withdrawn,Opened,Evaluation,Awarded,Lost,Cancelled,Pending Submission';
            OptionMembers = Draft,Submitted,Withdrawn,Opened,Evaluation,Awarded,Lost,Cancelled,"Pending Submission";
        }
        field(70069; "Bidder Type"; Option)
        {

            Description = 'Bid Response';
            OptionCaption = 'Single Entity,Joint Venture';
            OptionMembers = "Single Entity","Joint Venture";
        }
        field(70070; "Joint Venture Partner"; Text[50])
        {

        }
        field(70071; "Invitation For Supply No"; Code[20])
        {

            TableRelation = "Standard Purchase Code".Code where("Global Dimension 1 Code"=field("Shortcut Dimension 1 filter"));

            trigger OnValidate()
            begin
                //Procurement.UpdateBidResponseFromITT(Rec);
                IFS.RESET;
                IFS.SETRANGE(Code, "Invitation For Supply No");
                IF IFS.FindFirst() THEN BEGIN
                    //Purch.INIT;
                    "Document Type" := "Document Type"::Quote;
                    "Invitation Notice Type" := IFS."Invitation Notice Type";
                    "Bid Envelope Type" := IFS."Bid Envelop Type";
                    "PP Bid Selection Method" := IFS."Bid Selection Method";
                    "PP Procurement Method" := IFS."PP Procurement Method";
                    "PP Solicitation Type" := IFS."PP Solicitation Type";
                    "Procurement Plan ID" := IFS."Procurement Plan ID";
                    "Procurement Plan Entry No" := IFS."Procurement Plan Entry No";
                    "Tender Description" := IFS."Tender Summary";
                    "Tender Name" := IFS."Tender Name";
                    //"Responsibility Center" := IFS."Responsibility Center";
                    // VALIDATE("Location Code", IFS."Location Code");
                    "Language Code" := IFS."Language Code";
                    // VALIDATE("Purchaser Code", IFS."Purchaser Code");
                    "Currency Code" := IFS."Currency Code";
                    "IFS Code" := "Invitation For Supply No";
                    "Bid Charge Code" := IFS."Bid Charge Code";
                    "Bid Charge (LCY)" := IFS."Bid Charge (LCY)";
                    "Works Category" := IFS."Works Category";
                    "Road Code" := IFS."Road Code";
                    "Link Name" := IFS."Road Link Name";
                    Consitituency := IFS."Constituency ID";
                    "Engineer Estimate (LCY)" := IFS."Engineer Estimate (LCY)";
                    //"Max Works Completion Duration":=FORMAT(IFS."Max Works Completion Duration");
                    "Max Works Kickoff Duration" := IFS."Max Works Kickoff Duration";
                    "Max Works Charter Duration" := IFS."Max Works Charter Duration";
                    // VALIDATE("Payment Terms Code", IFS."Payment Terms Code");
                    // "Defects Liability Period":=IFS."Defects Liability Period";
                    "Daily Liquidated Dam Unit Cost" := IFS."Daily Liquidated Dam Unit Cost";
                    "Liquidated Damages Limit %" := IFS."Liquidated Damages Limit %";
                    "Payment Retention %" := IFS."Payment Retention %";
                    "Retention Amount Limit %" := IFS."Retention Amount Limit %";
                    "Min Interim Certificate Amount" := IFS."Min Interim Certificate Amount";
                    //CompanyInfo.GET;
                    // "Procuring Entity (PE) Name":=CompanyInfo.Name;

                    UserSetup.GET(USERID);
                    if UserSetup."Portal User" = false then begin
                        "Responsibility Center" := UserSetup."Purchase Resp. Ctr. Filter";

                    end;

                    PurchLines.RESET;
                    PurchLines.SETRANGE("Document No.", "No.");
                    IF PurchLines.FINDSET THEN BEGIN
                        PurchLines.DELETEALL;
                    END;

                    IFSLines.RESET;
                    IFSLines.SETRANGE("Standard Purchase Code", "Invitation For Supply No");
                    IF IFSLines.FINDSET() THEN BEGIN
                        REPEAT
                            PurchLines.INIT;
                            PurchLines."Document Type" := PurchLines."Document Type"::Quote;
                            PurchLines."Document No." := "No.";
                            PurchLines."Line No." := IFSLines."Line No.";
                            // //PurchLines.VALIDATE("Buy-from Vendor No.");


                            PurchLines.Type := IFSLines.Type;
                            PurchLines."No." := IFSLines."No.";
                            // //  PurchLines."Location Code" := IFS."Location Code";
                            // //PurchLines."Posting Group":=IFSLines
                            PurchLines.Description3 := IFSLines.Description;
                            // PurchLines."Description 2" := IFSLines.Description;
                            PurchLines."Unit of Measure Code" := IFSLines."Unit of Measure Code";
                            // //PurchLines."Unit of Measure":=IFSLines."Unit of Measure Code";
                            // //PurchLines.VALIDATE(PurchLines.Description,IFSLines.Description);
                            // PurchLines.VALIDATE(PurchLines.Quantity, IFSLines.Quantity);
                            // //MESSAGE('%1',PurchLines.Quantity);
                            PurchLines.Quantity := IFSLines.Quantity;
                            PurchLines."Direct Unit Cost" := IFSLines."Amount Excl. VAT";

                            // PurchLines."Shortcut Dimension 1 Code" := IFSLines."Shortcut Dimension 2 Code";
                            // PurchLines."Shortcut Dimension 2 Code" := IFSLines."Shortcut Dimension 2 Code";
                            // PurchLines."Contract Type" := IFSLines."Contract Type";
                            PurchLines."Procurement Plan ID" := IFSLines."Procurement Plan ID";
                            PurchLines."Procurement Plan Entry No" := IFSLines."Procurement Plan Entry No";
                            //PurchLines."Variant Code" := IFSLines."Variant Code";
                            // PurchLines."Dimension Set ID" := IFSLines."Dimension Set ID";
                            // PurchLines."Item Category" := IFSLines."Item Category";
                            PurchLines.INSERT(TRUE);

                        UNTIL IFSLines.NEXT = 0;
                    END;

                END;
            END;
        }
        field(70072; "Invitation Notice Type"; Option)
        {

            OptionCaption = ',Single  Stage Tender,Two Stage Tender,RFQ,Low Value Procurement';
            OptionMembers = ,"Single  Stage Tender","Two Stage Tender",RFQ,"Low Value Procurement";
        }
        field(70073; "Bid Envelope Type"; Option)
        {

            OptionCaption = '1-Envelope,2-Envelope';
            OptionMembers = "1-Envelope","2-Envelope";
        }
        field(70074; "Bid Seal Type"; Option)
        {

            OptionCaption = 'Sealed,Unsealed';
            OptionMembers = Sealed,Unsealed;
        }
        field(70075; "Tender Description"; Text[300])
        {

        }
        field(70076; "Bidder Representative Name"; Text[300])
        {

        }
        field(70077; "Bidder Representative Desgn"; Code[50])
        {
            Caption = 'Bidder Representative Designation';

            Description = 'Bidder Representative Designation';
        }
        field(70078; "Bidder Representative Address"; Text[100])
        {

        }
        field(70079; "Bidder Witness Name"; Text[80])
        {

        }
        field(70080; "Bidder Witness Designation"; Code[50])
        {

        }
        field(70081; "Bidder Witness Address"; Text[100])
        {

        }
        field(70082; "Tender Document Source"; Code[50])
        {

            TableRelation = "Tender Document Source".Code;
        }
        field(70083; "Bid Charge Code"; Code[30])
        {

            TableRelation = "Bid Charges Schedule".Code;

            trigger OnValidate()
            begin
                IFSfee.Reset;
                IFSfee.SetRange(Code, "Bid Charge Code");
                if IFSfee.FindSet then begin
                    "Bid Charge (LCY)" := IFSfee.Amount
                end;
            end;
        }
        field(70084; "Bid Charge (LCY)"; Decimal)
        {

            Editable = false;
        }
        field(70085; "Payment Reference No."; Code[30])
        {

        }
        field(70086; "Posted Direct Income Voucher"; Code[30])
        {

        }
        field(70087; "Primary Region"; Code[30])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(70088; "Primary Directorate"; Code[30])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70089; "Primary Department"; Code[30])
        {

            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"),
                                                                "Direct Reports To" = field("Primary Directorate"));
        }
        field(70090; "Primary Branch/Centre"; Code[30])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Branch));
        }
        field(70091; "Building/House No"; Text[50])
        {

        }
        field(70092; "Plot No"; Code[50])
        {

        }
        field(70093; Street; Text[50])
        {

        }
        field(70094; "Nature of Business"; Text[250])
        {

        }
        field(70095; "Current Trade Licence No"; Code[50])
        {

        }
        field(70096; "Trade Licence Expiry Date"; Date)
        {

        }
        field(70097; "Max Value of Business"; Decimal)
        {

        }
        field(70098; "Preferred Bank Account Code"; Code[20])
        {
            Caption = 'Preferred Bank Account Code';

            TableRelation = "Vendor Bank Account".Code where("Vendor No." = field("Vendor No."));
        }
        field(70099; "Bankers Name"; Text[100])
        {
            Editable = false;
        }
        field(70100; "Bankers Branch"; Text[100])
        {
            Editable = false;
        }
        field(70101; "KNTC Agent"; Boolean)
        {

        }
        field(70102; "Business Type"; Code[30])
        {

            Description = 'Used to record the different Business Types based on Ownership categories such as Companies, Partnerships, Sole Ownership etc. Linked to Business Type Table';
            TableRelation = "Business Types".Code;
        }
        field(70103; "Nominal Capital LCY"; Decimal)
        {

        }
        field(70104; "Issued Capital LCY"; Decimal)
        {

        }
        field(70105; "Response is restricted"; Boolean)
        {
            Caption = 'Response is restricted to invited suppliers';

            Description = 'Response is restricted to invited suppliers';
        }
        field(70106; "Supplier to respond"; Boolean)
        {
            Caption = 'Supplier to respond with full quantity on each line';

            Description = 'Supplier to respond with full quantity on each line';
        }
        field(70107; "Procuring Entity can extend"; Boolean)
        {
            Caption = 'Procuring Entity can extend submission deadline through Addendum';

            Description = 'Procuring Entity can extend submission deadline through Addendum';
        }
        field(70108; "Procuring Entity can Cancel"; Boolean)
        {
            Caption = 'Procuring Entity can Cancel Invitation Notice at any stage';

            Description = 'Procuring Entity can Cancel Invitation Notice at any stage';
        }
        field(70109; "No. of Addendum Notices issued"; Integer)
        {
            Editable = false;
        }
        field(70110; "Last Addendum Notice No."; Code[20])
        {
            CalcFormula = lookup("Tender Addendum Notice"."Addendum Notice No." where("Invitation Notice No." = field("Invitation For Supply No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70111; "Read-out Bid Price (A)"; Decimal)
        {

        }
        field(70112; "Arithmetic Corrections (B)"; Decimal)
        {

        }
        field(70113; "Corrected Bid Price (C=A+B)"; Decimal)
        {

        }
        field(70114; "Unconditional Discount % (D)"; Decimal)
        {

        }
        field(70115; "Unconditional Disc Amount (E)"; Decimal)
        {
            Caption = 'Unconditional Discount Amount (E)';

            Description = 'Unconditional Discount Amount (E)';
        }
        field(70116; "Corrected & Disc Bid Price"; Decimal)
        {
            Caption = 'Corrected & Discounted Bid Price (F=C-E)';

            Description = 'Corrected & Discounted Bid Price (F=C-E)';
        }
        field(70117; "Any Additional Adjustments (G)"; Decimal)
        {

        }
        field(70118; "Any Priced Deviations (H))"; Decimal)
        {

        }
        field(70119; "Final Evaluated Bid Price"; Decimal)
        {
            Caption = 'Final Evaluated Bid Price (I=F+G+H)';

            Description = 'Final Evaluated Bid Price (I=F+G+H)';
        }
        field(70120; "Financial Evaluation Date"; Date)
        {

        }
        field(70121; "Weighted Financial Score %"; Decimal)
        {

        }
        field(70122; "Financial Evaluation Ranking"; Code[30])
        {

        }
        field(70123; "Pre-bid Register No."; Code[20])
        {

            TableRelation = "IFS Prebid Register".Code;
        }
        field(70124; "Attended Pre-bid Conference"; Boolean)
        {

        }
        field(70125; "Prebid Conference Date"; Date)
        {

        }
        field(70126; "Bid Opening Register No."; Code[20])
        {

        }
        field(70127; "Bid Opening Date"; Date)
        {

        }
        field(70128; "Late Bid (Opening Stage)"; Boolean)
        {

        }
        field(70129; "Withdrawn Bid (Opening Stage)"; Code[20])
        {

        }
        field(70130; "Withdrawal Notice No"; Code[20])
        {

        }
        field(70131; "Modified Bid (Opening Stage)"; Code[20])
        {

        }
        field(70132; "Succesful Bid (Opening Stage)"; Boolean)
        {

        }
        field(70133; "Preliminary Evaluation Date"; Date)
        {

        }
        field(70134; "Responsive Bid (Evaluation)"; Boolean)
        {
            Caption = 'Responsive Bid (Preliminary Evaluation)';

            Description = 'Responsive Bid (Preliminary Evaluation)';
        }
        field(70135; "Technical Evaluation Date"; Date)
        {

        }
        field(70136; "Weighted Tech Score %"; Decimal)
        {

        }
        field(70137; "Passed Tech Evaluation"; Boolean)
        {

        }
        field(70138; "Tech Evaluation Ranking"; Code[20])
        {

        }
        field(70139; "Aggregate Weighted Score %"; Decimal)
        {

        }
        field(70140; "Aggregate Ranking"; Code[20])
        {

        }
        field(70141; "Final Tender Outcome"; Option)
        {

            OptionCaption = ',Awarded,Unsuccesful,Canceled';
            OptionMembers = ,Awarded,Unsuccesful,Canceled;
        }
        field(70142; "Engineer Estimate (LCY)"; Decimal)
        {

            Description = 'This field is based on estimates for Works that usuallly guide bidders/contarctors in specialized industries such as Road construction';
        }
        field(70143; "Max Works Kickoff Duration"; Code[10])
        {
            Caption = 'Max Works Kickoff Duration (After Contract/Order)';

            Description = 'Max Works Kickoff Duration (After Contract/Order)';
        }
        field(70144; "Max Works Charter Duration"; Code[10])
        {
            Caption = 'Max Works Charter/Program Duration (After Contract/Order)';

            Description = 'Max Works Charter/Program Duration (After Contract/Order)';
        }
        field(70145; "Max Works Completion Duration"; DateFormula)
        {
            Caption = 'Max Works Completion Duration (After Contract/Order';

            Description = 'Max Works Completion Duration (After Contract/Order';

            trigger OnValidate()
            begin
                "Time Of Completion" := CalcDate("Max Works Completion Duration", "Commencement Date");
            end;
        }
        field(70147; "Defects Liability Period"; DateFormula)
        {

            Description = 'Defects Liability (Warranty) Period';
        }
        field(70148; "Daily Liquidated Dam Unit Cost"; Decimal)
        {
            Caption = 'Daily Liquidated Damages Unit Cost (LCY)';

            Description = 'Daily Liquidated Damages Unit Cost (LCY)';
        }
        field(70149; "Liquidated Damages Limit %"; Decimal)
        {
            Caption = 'Liquidated Damages Limit % (Contract Value)';

            Description = 'Liquidated Damages Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(70150; "Payment Retention %"; Decimal)
        {

            MaxValue = 100;
            MinValue = 0;
        }
        field(70151; "Retention Amount Limit %"; Decimal)
        {
            Caption = 'Retention Amount Limit % (Contract Value)';

            Description = 'Retention Amount Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(70152; "Min Interim Certificate Amount"; Decimal)
        {
            Caption = 'Minimum Interim Certificate Amount (LCY)';

        }
        field(70153; "Vendor No."; Code[20])
        {

            TableRelation = Vendor."No." where(Blocked = const(" "));

            trigger OnValidate()
            begin
                "Buy-from Vendor No." := "Vendor No.";
                "Pay-to Vendor No." := "Vendor No.";
                Vendor.Reset;
                Vendor.SetRange("No.", "Vendor No.");
                if Vendor.FindFirst() then begin
                    //Purch.INIT;
                    "Building/House No" := Vendor."Building/House No";
                    "Plot No" := Vendor."Plot No";
                    Street := Vendor.Street;
                    "Nature of Business" := Vendor."Nature of Business";
                    "Current Trade Licence No" := Vendor."Current Trade Licence No";
                    "Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
                    "Max Value of Business" := Vendor."Max Value of Business";
                    "Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
                    "Business Type" := Vendor."Business Type";
                    "Nominal Capital LCY" := Vendor."Nominal Capital LCY";
                    "Issued Capital LCY" := Vendor."Issued Capital LCY";
                    "Buy-from Vendor Name" := Vendor.Name;
                    "Pay-to Name" := Vendor.Name;

                end;
                HeaderPurch.Reset;
                HeaderPurch.SetRange("Document Type", HeaderPurch."document type"::Quote);
                HeaderPurch.SetRange("Invitation For Supply No", "Invitation For Supply No");
                if HeaderPurch.FindLast then begin
                    "Auto Assigned No" := HeaderPurch."Auto Assigned No" + 1;
                end else begin
                    "Auto Assigned No" := 1;
                end;

                Procurement.UpdateBidResponse(Rec);
            end;
        }
        field(70154; "Sealed Bids (Technical)"; Boolean)
        {

        }
        field(70155; "Sealed Bids (Financial)"; Boolean)
        {

        }
        field(70156; "Contract Description"; Text[250])
        {

        }
        field(70157; "Contract Start Date"; Date)
        {

        }
        field(70158; "Contract End Date"; Date)
        {

        }
        field(70159; "Notice of Award No."; Code[20])
        {

            TableRelation = "Bid Tabulation Header" where("Document Type" = filter("Notice of Award"));
        }
        field(70160; "Awarded Bid No"; Code[20])
        {

            TableRelation = "Purchase Header"."No." where("Document Type" = const(Quote));
        }
        field(70161; "Award Tender Sum Inc Taxes"; Decimal)
        {
            Caption = 'Award Tender Sum Inc Taxes (LCY)';

            Description = 'Award Tender Sum Inc Taxes (LCY)';

            trigger OnValidate()
            begin
                if "Currency Code" <> '' then
                    "Award Tender Sum Incl Taxes(FC" := "Currency Factor" * "Award Tender Sum Inc Taxes";
            end;
        }
        field(70162; "IFS Code"; Code[20])
        {
            TableRelation = "Standard Purchase Code".Code;
            trigger OnValidate()
            var
                BidTabulationHeader: Record "Bid Tabulation Header";
                CompanyInfo: Record "Company Information";
            begin
                if Rec."Document Type" = Rec."Document Type"::"Blanket Order" then begin
                    if CompanyInfo.Get() then
                        Rec."Procuring Entity (PE) Name" := CompanyInfo.Name;
                    BidTabulationHeader.Reset();
                    BidTabulationHeader.SetRange("IFS Code", Rec."IFS Code");
                    BidTabulationHeader.SetRange("Approval Status", BidTabulationHeader."Approval Status"::Released);
                    BidTabulationHeader.SetRange("Document Type", BidTabulationHeader."Document Type"::"Notice of Award");
                    if BidTabulationHeader.FindSet() then begin
                        REPEAT
                            case BidTabulationHeader."Document Type" of
                                BidTabulationHeader."Document Type"::"Notice of Award":
                                    begin
                                        Rec.Validate("Notice of Award No.", BidTabulationHeader.Code);
                                        Rec."Award Tender Sum Inc Taxes" := BidTabulationHeader."Award Tender Sum Inc Taxes";
                                        Rec."Invitation For Supply No" := BidTabulationHeader."IFS Code";
                                        Rec."Awarded Bid No" := BidTabulationHeader."Awarded Bid No";
                                        Rec.Validate("Buy-from Vendor No.", BidTabulationHeader."Awarded Bidder No.");
                                    end;
                                BidTabulationHeader."Document Type"::"Evaluation Report":
                                    Rec.Validate("Final Evaluation Report", BidTabulationHeader.Code);
                                BidTabulationHeader."Document Type"::"Professional Opinion":
                                    Rec.Validate("Proffesion Opinion No", BidTabulationHeader.Code);
                            end;
                        UNTIL BidTabulationHeader.Next() = 0;
                    end;
                end;
            end;
        }
        field(70163; "Tender Name"; Text[300])
        {

        }
        field(70164; "Contract Type"; Option)
        {

            OptionCaption = 'Original Contract,Contract Variation';
            OptionMembers = "Original Contract","Contract Variation";
        }
        field(70165; "Parent Contract ID"; Code[30])
        {

        }
        field(70166; "Governing Laws"; Text[250])
        {

        }
        field(70167; "Contract Status"; Enum "Contract Status")
        {

            // OptionCaption = ' ,Signed,Pending Signing,Cancelled';
            // OptionMembers = " ",Signed,"Pending Signing",Cancelled;
        }
        field(70168; "Procuring Entity (PE) Name"; Text[100])
        {

        }
        field(70169; "PE Representative"; Text[80])
        {

        }
        field(70170; "Final Evaluation Report"; Code[20])
        {

        }
        field(70171; "Final Evaluation Report Date"; Date)
        {

        }
        field(70172; "Proffesion Opinion No"; Code[20])
        {

        }
        field(70173; "Proffesion Opinion Date"; Date)
        {

        }
        field(70174; "Due Dilgence Date"; Date)
        {

        }
        field(70175; "Due Diligence Rating"; Code[20])
        {

            Description = 'Due Diligence Assessment Rating';
        }
        field(70176; "Due Diligence Report ID"; Option)
        {

            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(70177; "Due Diligence Voucher"; Code[20])
        {

        }
        field(70178; "Advance Payment Security ID"; Code[20])
        {

        }
        field(70179; "Advance Pmt Guar. Expiry Date"; Date)
        {

        }
        field(70180; "Perforance Security ID"; Code[20])
        {

        }
        field(70181; "Perforamance Sec. Expiry Date"; Date)
        {

        }
        field(70182; "Advance Payment Amount(LCY)"; Decimal)
        {

            Description = 'Advance Payment Amount(LCY)';
        }
        field(70183; "Advance Payment Settled"; Decimal)
        {

        }
        field(70184; "Certificate Number"; Code[30])
        {

        }
        field(70185; "Advance Recovery %"; Decimal)
        {

        }
        field(70186; "Retention %"; Decimal)
        {

        }
        field(70187; "Total Invoiced"; Decimal)
        {
            CalcFormula = - sum("Detailed Vendor Ledg. Entry".Amount where("Document Type" = filter(Invoice),
                                                                           "Vendor No." = field("Buy-from Vendor No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70188; Balance; Decimal)
        {

            Editable = false;
        }
        field(70189; "Project No"; Code[100])
        {

            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.", "Project No");
                if ObjJob.FindFirst() then
                    "Project Name" := ObjJob.Description;
            end;
        }
        field(70190; "Multiple IFS"; Boolean)
        {

        }
        field(70191; "Award Tender Sum Incl Taxes(FC"; Decimal)
        {

            Description = 'Foreign Curreny';
        }
        field(70192; "Contract Sum"; Decimal)
        {


            trigger OnValidate()
            begin
                if "Currency Code" = '' then begin
                    "Contract Sum" := "Contract Sum" * "Negotiated Exchange Rate";
                end;
            end;
        }
        field(70193; "Negotiated Exchange Rate"; Decimal)
        {


            trigger OnValidate()
            begin
                if "Currency Code" = '' then begin
                    "Contract Sum" := "Contract Sum" * "Negotiated Exchange Rate";
                end;
            end;
        }
        field(70194; "Upgrading Works Contract Sum"; Decimal)
        {


            trigger OnValidate()
            begin
                "Contract Sum" := "Upgrading Works Contract Sum" + "PBRM Works Contract Sum";
            end;
        }
        field(70195; "PBRM Works Contract Sum"; Decimal)
        {


            trigger OnValidate()
            begin
                "Contract Sum" := "Upgrading Works Contract Sum" + "PBRM Works Contract Sum";
            end;
        }
        field(70196; "Commencement Date"; Date)
        {

        }
        field(70197; "Time Of Completion"; Date)
        {

            Editable = false;
        }
        field(70198; "Foreign Currency Component(FCY"; Decimal)
        {

        }
        field(70199; "Percentage of Total Payment(%)"; Decimal)
        {

        }
        field(70200; "Local Currency Component(LCY)"; Decimal)
        {

        }
        field(70201; "No. Of Work Orders"; Integer)
        {

        }
        field(70202; "No. Of Program Of Works"; Integer)
        {

        }
        field(70203; "No. Of Insurance Of Works"; Integer)
        {

        }
        field(70204; "No. Of Progress Inspections"; Integer)
        {

        }
        field(70205; "No. Of Appraisal Reports"; Integer)
        {

        }
        field(70206; "No. EOTs"; Integer)
        {

            Description = 'Extension of Time';
        }
        field(70207; "Minutes Of Site Meetings"; Integer)
        {

        }
        field(70208; "Minutes Of Management Meetings"; Integer)
        {

        }
        field(70209; "Evaluator ID"; Code[20])
        {

        }
        field(70210; "Evaluator Name"; Text[250])
        {

        }
        field(70211; "Bid  Committee Evaluated"; Boolean)
        {

        }
        field(70212; "Contractor Request No"; Code[10])
        {

            TableRelation = "Measurement &  Payment Header"."Document No." where("Document Type" = filter("Contractor Payment Request"));
        }
        field(90213; "Price Validity Period"; Code[2048])
        {

        }


        field(70214; "Store Issue No"; Code[2048])
        {

        }
        field(70215; "Bid Sum 1"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = field("Document Type"), "Document No." = field("No.")
           // , "Contract Type" = const(Construction)
            ));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70216; "Bid Sum 2"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = field("Document Type"), "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70217; "Survey/Study/Design Done?"; Option)
        {

            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;

            trigger OnValidate()
            begin
                if "Survey/Study/Design Done?" = "survey/study/design done?"::No then begin
                    if Confirm('Are you sure you want to create a survey/study/design request for this project?', true) = true then begin
                        SurveyRequestHeader.Init;
                        SurveyRequestHeader."Document No." := '';
                        SurveyReqNo := SurveyRequestHeader."Document No.";
                        SurveyRequestHeader."Directorate ID" := "Directorate Code";
                        SurveyRequestHeader.Validate("Directorate ID");
                        SurveyRequestHeader."Department ID" := "Department Code";
                        SurveyRequestHeader.Validate("Department ID");
                        SurveyRequestHeader.Insert(true);

                        SurveyRequestLine.Init;
                        SurveyRequestLine."Document No." := SurveyRequestHeader."Document No.";
                        SurveyRequestLine."Project ID" := Job;
                        SurveyRequestLine.Validate("Project ID");
                        SurveyRequestLine."Region ID" := "Shortcut Dimension 1 Code";
                        SurveyRequestLine.Validate("Region ID");
                        SurveyRequestLine."Directorate ID" := "Directorate Code";
                        SurveyRequestLine.Validate("Directorate ID");
                        SurveyRequestLine."Department ID" := "Department Code";
                        SurveyRequestLine.Validate("Department ID");
                        SurveyRequestLine.Insert(true);

                        //Notify The PDE directorate and the user directorate
                        // ProcurementProcessing.FnNotifyPDEUserDirectorate(Rec);

                        SurveyReqNo := SurveyRequestHeader."Document No.";
                        SurveyRequestLine.Reset;
                        SurveyRequestHeader.SetRange(SurveyRequestHeader."Document No.", SurveyReqNo);
                        SurveyStudyDesignRequest.SetTableview(SurveyRequestHeader);
                        SurveyStudyDesignRequest.Run();
                    end;
                end;
            end;
        }
        field(70218; "Approval Rejection Remarks"; Text[2048])
        {

        }
        field(70219; "Approval OKAY Remarks"; Text[2048])
        {

        }
        field(70220; "Approval Approve Remarks"; Text[2048])
        {

        }
        field(70221; "Sixth Approver ID"; Code[100])
        {

            TableRelation = "User Setup";

            trigger OnValidate()
            begin
                if (("First Approver ID" = '') and ("Second Approver ID" = '') and ("Third Approver ID" = '') and ("Fourth Approver ID" = '') and ("Fifth Approver ID" = '')) then
                    Error('Please enter the preceding approvers');
            end;
        }
        field(70222; "First Approver ID"; Code[100])
        {

            TableRelation = "User Setup";
        }
        field(70223; "Second Approver ID"; Code[100])
        {

            TableRelation = "User Setup";

            trigger OnValidate()
            begin
                if "First Approver ID" = '' then
                    Error('Please enter the first approver');
            end;
        }
        field(70224; "Third Approver ID"; Code[100])
        {

            TableRelation = "User Setup";

            trigger OnValidate()
            begin
                if (("First Approver ID" = '') and ("Second Approver ID" = '')) then
                    Error('Please enter the preceding approvers');
            end;
        }
        field(70225; "Fourth Approver ID"; Code[100])
        {

            TableRelation = "User Setup";

            trigger OnValidate()
            begin
                if (("First Approver ID" = '') and ("Second Approver ID" = '') and ("Third Approver ID" = '')) then
                    Error('Please enter the preceding approvers');
            end;
        }
        field(70226; "Fifth Approver ID"; Code[100])
        {

            TableRelation = "User Setup";

            trigger OnValidate()
            begin
                if (("First Approver ID" = '') and ("Second Approver ID" = '') and ("Third Approver ID" = '') and ("Fifth Approver ID" = '')) then
                    Error('Please enter the preceding approvers');
            end;
        }
        field(70227; "Auto Assigned No"; Integer)
        {

        }
        field(70228; "Last Evaluation Version No."; Integer)
        {

        }
        field(70229; "Acceptance Letter Ref"; Code[30])
        {

        }
        field(70230; "Acceptance Letter Date"; Date)
        {

        }
        field(70231; "Quotation No."; CODE[100])
        {

        }
        field(70233; "Quotation Description"; Text[150])
        {

        }

        field(70232; "Total PRN Commitments"; decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Header"."Total PRN Amount" where(Region = field(Region), "Department Code" = field("Department Code")));
        }
        field(8603700; Test; Code[5])
        {

        }
        field(8603701; "Procurement Plan Item Descript"; Text[250])
        {


            trigger OnValidate()
            begin
                //PPlanEntry.RESET;
            end;
        }
        field(8603702; "Item Category Description"; Text[250])
        {

        }
        field(8603703; "WorkPlan No"; Code[20])
        {

            TableRelation = "Project Funding Request Vouche"."Document No";

            trigger OnValidate()
            var
                purchline: Record "Purchase Line";
            begin
                DetailsOfRoadActivities.Reset;
                DetailsOfRoadActivities.SetRange(DetailsOfRoadActivities."WorkPlan No", "WorkPlan No");
                if DetailsOfRoadActivities.FindSet then begin
                    PurchLine.Reset;
                    PurchLine.SetRange(PurchLine."Document No.", "No.");
                    PurchLine.SetRange(PurchLine."Document Type", "Document Type");
                    if PurchLine.FindSet then
                        PurchLine.DeleteAll(true);
                end;

                DetailsOfRoadActivities.Reset;
                DetailsOfRoadActivities.SetRange(DetailsOfRoadActivities."WorkPlan No", "WorkPlan No");
                if DetailsOfRoadActivities.Find('-') then
                    repeat
                        PurchLine.Init;
                        PurchLine."Document No." := "No.";
                        PurchLine.Reset;
                        PurchLine.SetRange("Document Type", "Document Type");
                        PurchLine.SetRange("Document No.", "No.");
                        if PurchLine.FindLast then
                            PurchLine."Line No." := PurchLine."Line No." + 1000
                        else
                            PurchLine."Line No." := 1000;
                        PurchLine."Document Type" := "Document Type";
                        PurchLine.Type := PurchLine.Type::Item;
                        PurchLine."Item Category Code" := DetailsOfRoadActivities."Bill No";
                        PurchLine."No." := DetailsOfRoadActivities."Item Code";
                        //PurchLine.VALIDATE("No.");
                        PurchLine.Description := DetailsOfRoadActivities.Description;
                        PurchLine."Unit of Measure" := DetailsOfRoadActivities."Unit Of Measure";
                        PurchLine.Quantity := DetailsOfRoadActivities.Quantity;
                        PurchLine.Validate(Quantity);
                        PurchLine."Technology Code" := DetailsOfRoadActivities.Technology;
                        PurchLine."Labour %" := DetailsOfRoadActivities."Labour(%)";
                        PurchLine."Start Chainage(Km)" := DetailsOfRoadActivities."Start Chainage(Km)";
                        PurchLine."End Chainage(Km)" := DetailsOfRoadActivities."End Chainage(Km)";
                        PurchLine."Direct Unit Cost" := DetailsOfRoadActivities."Rate(LCY)";
                        PurchLine.Validate("Direct Unit Cost");
                        if PurchLine."Direct Unit Cost" <> 0 then begin
                            if not PurchLine.Get(PurchLine."Document Type", PurchLine."Document No.") then
                                PurchLine.Insert(true);
                        end;
                    until DetailsOfRoadActivities.Next = 0;
            end;
        }
        field(8603704; "Work Execution Plan No"; Code[20])
        {

        }
        field(8603705; "Engineer Commencement Date"; Date)
        {


            trigger OnValidate()
            begin
                "Commencement Date" := CalcDate('28D', "Engineer Commencement Date");
            end;
        }
        field(8603706; "Contractor Signature"; Blob)
        {

        }
        field(8603707; "Variation of Price %"; Decimal)
        {

        }
        field(8603708; "Contingency Rate"; Decimal)
        {

        }
        field(8603709; "Advance Payment Rate"; Decimal)
        {

        }
        field(8603710; "Variation of Works %"; Decimal)
        {


            trigger OnValidate()
            begin
                if "Variation of Works %" <> 0 then begin
                    "Variation of Works Amount" := ROUND("Contract Sum" * "Variation of Works %" / 100, 1, '>');
                end;
            end;
        }
        field(8603711; "Variation of Works Amount"; Decimal)
        {

            Editable = false;
        }
        field(8603712; "Assigded Procument Officer"; Code[100])
        {
            Caption = 'Assigned Procurement Officer';
            Editable = TRUE;
            TableRelation = "Salesperson/Purchaser".CODE;
            trigger OnValidate()
            var
                usersetup: record "User Setup";
            begin
                usersetup.reset;
                usersetup.setrange(usersetup."Salespers./Purch. Code", "Assigded Procument Officer");
                if usersetup.findset then
                    "Assigned User ID" := usersetup."User ID";
            end;
            ////;

        }
        field(8603713; "Payment Type"; Option)
        {

            Editable = TRUE;
            OptionMembers = "","MilestoneBased","Minimum IPC Amount";
            OptionCaption = ',Milestone Based,Minimum IPC Amount';

        }
        field(8603714; "Bid Scoring Template"; Code[30])
        {

            TableRelation = "Bid Scoring Template".Code;
        }
        field(8603715; "Estimated Cost"; decimal)
        {


        }
        field(8603716; "Entry Used"; boolean)
        {

        }
        field(8603717; "Directorate Name"; Text[1080])
        {

        }
        field(8603718; "Department Name2"; Text[1080])
        {

        }
        //IanCasper
        field(8603719; PRN; Code[20])
        {
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Purchase Requisition"), Status = const(Released), "Ordered PRN" = filter(false), "Responsibility Center" = field("Responsibility Center"));

            trigger OnValidate()
            var
                PRNRec: record "Purchase Header";
                XPRN: Record "Purchase Header";
                Pline: Record "Purchase Line";
                copyline: Record "Purchase Line";
            begin

                if PRNRec.get("Document Type"::"Purchase Requisition", Rec.PRN) then begin
                    PRNRec."Ordered PRN" := true;
                    PRNRec.modify();
                end;
                if XPRN.get("Document Type"::"Purchase Requisition", XRec.PRN) then begin
                    XPRN."Ordered PRN" := false;
                    XPRN.modify();
                end;

                pline.Reset();
                pline.setrange("Document Type", Pline."Document Type"::"Purchase Requisition");
                pline.setrange("Document No.", Rec.PRN);
                if Pline.findset() then begin
                    copyline.reset();
                    copyline.setrange("Document Type", copyline."Document Type"::Order);
                    copyline.SetRange("Document No.", Rec."No.");
                    if copyline.FindSet() then
                        copyline.DeleteAll();

                    repeat
                        copyline.init;
                        copyline.TransferFields(Pline);
                        copyline."Document Type" := copyline."Document Type"::Order;
                        copyline."Document No." := Rec."No.";
                        Copyline.insert();

                    until Pline.next() = 0;
                end;



            end;

        }
        field(8603720; "End Of Contract Date"; Date)
        {

        }
        field(8603721; "PBRM Period"; Duration)
        {

        }
        field(8603722; "Contract Period"; Duration)
        {

        }
        field(8603723; Rejected; Boolean)
        {
        }
        field(8603724; "Shortcut Dimension 1 filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(8603725; "Contract Implementation Team"; Code[20])
        {
            TableRelation = "IFS Tender Committee";
            trigger OnValidate()
            var
                BidEvaluationCommittee: Record "Bid Evaluation Committee";
                IFSTenderCommitte: Record "IFS Tender Committee Member";
                BidCommitte: Record "Bid Evaluation Committee";
            begin
                BidCommitte.Reset;
                BidCommitte.SetRange("Appointed Bid Opening Com","Contract Implementation Team");
                BidCommitte.SetRange(Type, BidCommitte.Type::"Bid Opening");
                BidCommitte.SetRange("Document No.", "No.");
                if BidCommitte.FindSet then begin
                    BidCommitte.DeleteAll;
                end;


                IFSTenderCommitte.Reset();
                IFSTenderCommitte.SetRange("Document No.", "Contract Implementation Team");
                // IFSTenderCommitte.SetRange("IFS Code", Rec."IFS Code");
                IFSTenderCommitte.SetFilter("Member Name", '<>%1', '');
                if IFSTenderCommitte.FindSet() then begin
                    repeat
                        BidCommitte.Init;
                        BidCommitte."Document No." := "No.";
                        BidCommitte."Line No" := IFSTenderCommitte."Line No";
                        BidCommitte."Appointed Bid Opening Com" := Rec."Contract Implementation Team";
                        BidCommitte."Role Type" := IFSTenderCommitte.Role;
                        BidCommitte.Type := BidCommitte.Type::Contract;
                        BidCommitte."Member No." := IFSTenderCommitte."Member No.";
                        BidCommitte."Member Name" := IFSTenderCommitte."Member Name";
                        /*IF BidCommitte."Role Type"=BidCommitte."Role Type"::Chairperson THEN BEGIN
                        "Evaluation Lead":=BidCommitte."Member No.";
                        "Evaluation Lead Name":=BidCommitte."Member Name";
                        END;*/
                        BidCommitte.Designation := IFSTenderCommitte.Designation;
                        BidCommitte."ID/Passport No" := IFSTenderCommitte."ID/Passport No";
                        BidCommitte."Tax Registration (PIN) No." := IFSTenderCommitte."Tax Registration (PIN) No.";
                        BidCommitte.Email := IFSTenderCommitte."Member Email";
                        BidCommitte."Telephone No." := IFSTenderCommitte."Telephone No.";
                        BidCommitte."Staff  No." := IFSTenderCommitte."Staff  No.";
                        BidCommitte."IFS Code" := "IFS Code";
                        BidCommitte.Insert(true);
                    until IFSTenderCommitte.Next = 0;
                end;

            end;
        }
         field(8603726; "Termination Date"; Date)
        {
            
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
            ProcurementSetup: Record "Procurement Setup";
            TemplateLine: Record "Procurement Doc Template Line";
            ContractDocuments: Record "Contract Required Documents";
            begin
                ProcurementSetup.Get();
                TemplateLine.SetRange("Procurement Process",TemplateLine."Procurement Process"::Contract);
                TemplateLine.SetRange("Template ID",ProcurementSetup."Default Procurement Template");
                if TemplateLine.FindSet() then begin
                    repeat
                    ContractDocuments.Init();
                    ContractDocuments."Document No." := Rec."No.";
                    ContractDocuments.Validate("Document Type",TemplateLine."Procurement Document Type");
                    ContractDocuments.Insert();
                    until TemplateLine.Next()=0;
                end
            end;
        }

        //IanCasper


    }


    //Unsupported feature: Code Modification on "OnInsert".



    /// //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    InitInsert;

    IF GETFILTER("Buy-from Vendor No.") <> '' THEN
    #4..8

    IF "Buy-from Vendor No." <> '' THEN
      StandardCodesMgt.CheckShowPurchRecurringLinesNotification(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11


    IF UsersRec.GET(USERID) THEN
      BEGIN
    IF  UsersRec."Portal User" = FALSE THEN BEGIN //exempt the portal user name
       "Requester ID":=USERID;
       "Assigned User ID":=USERID;
       "Purchaser Code":=UserSetup."Salespers./Purch. Code";
       "Request-By Name":=UsersRec."Employee Name";
       "Request-By No.":=UsersRec."Employee No.";
       "Responsibility Center":=UsersRec."Purchase Resp. Ctr. Filter";
       "Location Code":=UsersRec."Purchase Resp. Ctr. Filter";
       // MESSAGE("Responsibility Center");
       //"Shortcut Dimension 1 Code":= UsersRec."Region Code";
       Empl.RESET;
       Empl.SETRANGE("No.","Request-By No.");
    IF Empl.FIND('-') THEN BEGIN
       "Shortcut Dimension 1 Code":=Empl."Global Dimension 1 Code";
      "Shortcut Dimension 2 Code":=Empl."Global Dimension 2 Code";
      END;
       //END;
       END;
    //added on 28/06/2019 to add HOD
    Empl.RESET;
    Empl.SETRANGE("No.","Request-By No.");
    IF Empl.FIND('-') THEN BEGIN
      HOD := Empl.HOD;
      "Directorate Code":=Empl."Directorate Code";
      "Department Code":=Empl."Department Code";
       Region:=Empl."Global Dimension 1 Code";
     // "Shortcut Dimension 1 Code":=Empl."Global Dimension 1 Code";
      Division:=Empl.Division;
      "Shortcut Dimension 1 Code":=Empl."Global Dimension 1 Code";
      "Shortcut Dimension 2 Code":=Empl."Global Dimension 2 Code";
      VALIDATE("Shortcut Dimension 1 Code");
      //VALIDATE("Shortcut Dimension 2 Code");
    END;
    //

    "Order Date":=TODAY;
    {ProcSetup.GET;
    "Procurement Plan ID":=ProcSetup."Effective Procurement Plan";
    VALIDATE("Procurement Plan ID");}
    //Add Default procurement plan
    AnnualReportingCodes.RESET;
    AnnualReportingCodes.SETRANGE("Current Year",TRUE);
    IF AnnualReportingCodes.FINDSET THEN
     "Procurement Plan":=AnnualReportingCodes."Annual Procurement Plan";
    "Taken By":=PurchLine."Employee Name";

    //update defaults for IFS

    IF "Document Type"="Document Type"::"Purchase Requisition" THEN BEGIN
      ProcSetup.GET;
      "PRN Conversion Procedure":=ProcSetup."Default PRN Conversion Proc";
    //IF "No."<>'' THEN BEGIN
    ProcurementSetup.GET;
    ContractIssuanceDocs.RESET;
    ContractIssuanceDocs.SETRANGE("Document ID","No.");
    IF ContractIssuanceDocs.FINDSET THEN
      ContractIssuanceDocs.DELETEALL;
    DocTemplateLine.RESET;
    DocTemplateLine.SETRANGE("Template ID",ProcurementSetup."Default Procurement Template");
    DocTemplateLine.SETRANGE("Procurement Process",DocTemplateLine."Procurement Process"::"Purchase Requisition Notes");
    IF DocTemplateLine.FINDSET THEN BEGIN
      REPEAT
    ContractIssuanceDocs.INIT;
    ContractIssuanceDocs."Document ID":="No.";
    ContractIssuanceDocs."Process Area":=ContractIssuanceDocs."Process Area"::PRN;
    ContractIssuanceDocs."Procurement Document Type":=DocTemplateLine."Procurement Document Type";
    ContractIssuanceDocs.Description:=DocTemplateLine.Description;
    ContractIssuanceDocs."Requirement Type":=DocTemplateLine."Requirement Type";
    ContractIssuanceDocs."Track Certificate Expiry":=DocTemplateLine."Track Certificate Expiry";
    ContractIssuanceDocs."Guidelines/Instruction":=DocTemplateLine."Guidelines/Instruction";
    //ContractIssuanceDocs."Contract ID":="Purchase Contract ID";
    ContractIssuanceDocs."Contract Index":=DocTemplateLine."Contract Index";
    ContractIssuanceDocs."PRN No":="No.";
    //ContractIssuanceDocs."IFS Code":="IFS Code";
    ContractIssuanceDocs.INSERT(TRUE);
        UNTIL DocTemplateLine.NEXT=0;
    END;
    Mergefiles.fnCreateConFolder("No.");
    //END;


      END;

    //Autopopulate The Dimension Values From Employee
    IF UserSetup.GET(USERID) THEN BEGIN
      Empl.RESET;
      Empl.SETRANGE(Empl."No.",UserSetup."Employee No.");
      IF Empl.FINDSET THEN BEGIN
        "Shortcut Dimension 1 Code":=Empl."Global Dimension 1 Code";
        VALIDATE("Shortcut Dimension 1 Code");
        //"Shortcut Dimension 2 Code":=Empl."Global Dimension 2 Code";
        //VALIDATE("Shortcut Dimension 2 Code");
        "Department Code":=Empl."Department Code";
        "Directorate Code":=Empl."Directorate Code";
        END;

      END;
      END;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnModify".

    trigger OnModify()
    begin

        IF (Status = Status::Released) AND ("Document Type" = "Document Type"::"Purchase Requisition") AND
         ("Ordered PRN" = FALSE) THEN BEGIN
            Procurement.FnPRNCommittment(Rec);
            //  EmailNotification.SendPRNApprovedMail(Rec)//
        END;


    end;


    //Unsupported feature: Code Modification on "InitRecord(PROCEDURE 10)".

    //procedure InitRecord();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    PurchSetup.GET;
    IsHandled := FALSE;
    OnBeforeInitRecord(Rec,IsHandled);
    #4..65
      Correction := GLSetup."Mark Cr. Memos as Corrections";
    END;

    "Posting Description" := FORMAT("Document Type") + ' ' + "No.";

    IF InvtSetup.GET THEN
      "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";

    "Responsibility Center" := UserSetupMgt.GetRespCenter(1,"Responsibility Center");
    "Doc. No. Occurrence" := ArchiveManagement.GetNextOccurrenceNo(DATABASE::"Purchase Header","Document Type","No.");

    OnAfterInitRecord(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..68
    //"Posting Description" := FORMAT("Document Type") + ' ' + "No.";
    #70..77
    */
    //end;


    //Unsupported feature: Code Modification on "GetNoSeriesCode(PROCEDURE 9)".

    //procedure GetNoSeriesCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CASE "Document Type" OF
      "Document Type"::Quote:
        NoSeriesCode := PurchSetup."Quote Nos.";
    #4..10
        NoSeriesCode := PurchSetup."Credit Memo Nos.";
      "Document Type"::"Blanket Order":
        NoSeriesCode := PurchSetup."Blanket Order Nos.";
    END;
    OnAfterGetNoSeriesCode(Rec,PurchSetup,NoSeriesCode);
    EXIT(NoSeriesMgt.GetNoSeriesWithCheck(NoSeriesCode,SelectNoSeriesAllowed,"No. Series"));
    */
    //end;
    //>>>> MODIFIED CODE:
    trigger Ondelete()
    BEGIN
        IF Rec."Document Type" = Rec."Document Type"::Invoice then
            Error('You cannot delete %1', Rec.TableCaption);

    END;

    trigger OnBeforeInsert()
    var
        myInt: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PurchSetup: Record "Procurement Setup";
    begin
        if rec."Document Type" = rec."Document Type"::"Purchase Requisition" then begin
            IF rec."No." = '' THEN BEGIN

                PurchSetup.GET;
                PurchSetup.TESTFIELD("Purchase Req No");
                NoSeriesMgt.InitSeries(PurchSetup."Purchase Req No", xRec."No.", 0D, rec."No.", "No. Series");
            END;

        end;
        if rec."Document Type" = rec."Document Type"::"Store Requisition" then begin
            IF rec."No." = '' THEN BEGIN

                PurchSetup.GET;
                PurchSetup.TESTFIELD("Store Req No");
                NoSeriesMgt.InitSeries(PurchSetup."Store Req No", xRec."No.", 0D, rec."No.", "No. Series");
            END;

        end;
    end;


    /*    begin

       //#1..13
         "Document Type"::"Purchase Requisition":
           NoSeriesCode := PurchSetup."Purchase Requisition Nos.";
          "Document Type"::"Store Requisition":
           NoSeriesCode := PurchSetup."Store Requisition Nos.";

       //#14..16

       end; */


    //Unsupported feature: Code Modification on "ValidateShortcutDimCode(PROCEDURE 19)".

    //procedure ValidateShortcutDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OldDimSetID := "Dimension Set ID";
    DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
    IF "No." <> '' THEN
      MODIFY;

    IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
      MODIFY;
      IF PurchLinesExist THEN
        UpdateAllLineDim("Dimension Set ID",OldDimSetID);
    END;

    OnAfterValidateShortcutDimCode(Rec,xRec,FieldNumber,ShortcutDimCode);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
      //MODIFY;

    IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
      //MODIFY;
    #8..12
    */
    //end;


    //Unsupported feature: Code Modification on "PrintRecords(PROCEDURE 74)".

    //procedure PrintRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckMixedDropShipment;

    DocumentSendingProfile.TrySendToPrinterVendor(
      DummyReportSelections.Usage::"P.Order",Rec,FIELDNO("Buy-from Vendor No."),ShowRequestForm);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CheckMixedDropShipment;
    DocumentSendingProfile.TrySendToPrinterVendor(
      DummyReportSelections.Usage::"P.Order",Rec,FIELDNO("Buy-from Vendor No."),ShowRequestForm);
    */
    //end;

    local procedure "........procurement Functions............"()
    begin
    end;

    //cc
    procedure CopyAttachments(var PurchasePrn: Record "Purchase Header"; var PurchaseOrder: Record "Purchase Header")
    var
        FromDocumentAttachment: Record "Document Attachment";
        ToDocumentAttachment: Record "Document Attachment";
        FromFieldRef: FieldRef;
        ToFieldRef: FieldRef;
        FromDocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Purchase Requisition";
        FromLineNo: Integer;
        FromNo: Code[20];
        ToNo: Code[20];
        ToDocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        ToLineNo: Integer;
    begin
        FromDocumentAttachment.SetRange("Table ID", Database::"Purchase Header");
        if FromDocumentAttachment.IsEmpty() then
            exit;
        FromDocumentAttachment.setrange("No.", PurchasePrn."No.");
        if FromDocumentAttachment.FindSet() then begin
            repeat
                Clear(ToDocumentAttachment);
                ToDocumentAttachment.Init();
                ToDocumentAttachment.TransferFields(FromDocumentAttachment);
                ToDocumentAttachment.Validate("Table ID", database::"Purchase Header");
                ToDocumentAttachment.Validate("No.", PurchaseOrder."No.");
                ToDocumentAttachment.Validate("Document Type", Enum::"Purchase Document Type"::Order);
                if not ToDocumentAttachment.Insert(true) then;
                ToDocumentAttachment."Attached Date" := FromDocumentAttachment."Attached Date";
                ToDocumentAttachment.modify();
            until FromDocumentAttachment.Next() = 0;
        end;
        message('Attachments Copied Sucessfully');
    end;


    procedure CreatePurchaseOrderProcMethodLines(var ProcReqLines: Record "Purchase Line")
    var
        PurchaseRec: Record "Purchase Header";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchaseRecLine: Record "Purchase Line";
        ProcReq: Record "Procurement Request";
        ProcReq1: Record "Procurement Request";
        ProcReqLines1: Record "Procurement Request Lines";
        ProcReqLines2: Record "Procurement Request Lines";
        Recordsupdated: Integer;
        GLSETUP: Record "General Ledger Setup";
    begin

        with ProcReqLines do begin

            ProcReqLines2.Reset;
            // ProcReqLines2.SetRange("Requisition No",ProcReqLines."Requisition No");
            ProcReqLines2.SetRange(Select, true);
            ProcReqLines2.SetRange(Ordered, false);
            ProcReqLines2.SetRange("Vendor No", ProcReqLines."Buy-from Vendor No.");
            if ProcReqLines2.Find('-') then begin

                //Purchase Header
                PurchaseHeader.Init;
                PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
                PurchaseHeader."No." := '';
                PurchaseHeader."Buy-from Vendor No." := ProcReqLines2."Vendor No";
                PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
                // if Vend.Get(ProcReqLines2."Vendor No") then
                // PurchaseHeader."Supplier Type":=Vend."Special Groups Type";

                ProcReq.Reset;
                ProcReq.SetRange(ProcReq.No, ProcReqLines2."Requisition No");
                if ProcReq.Find('-') then
                    PurchaseHeader."Requisition No" := ProcReq."Requisition No";
                //IF NOT PurchaseHeader.GET(PurchaseHeader."No.") THEN
                PurchaseHeader.Insert(true);


                repeat
                    //Purchase Lines
                    PurchaseLine.Reset;
                    PurchaseLine.SetRange(PurchaseLine."Document Type", PurchaseLine."document type"::Order);
                    PurchaseLine.SetRange(PurchaseLine."Document No.", PurchaseHeader."No.");
                    PurchaseLine.SetRange(PurchaseLine."Line No.", ProcReqLines2."Line No");
                    PurchaseLine.SetRange(PurchaseLine."Buy-from Vendor No.", ProcReqLines2."Vendor No");
                    if not PurchaseLine.FindFirst then begin
                        PurchaseLine.Init;
                        PurchaseLine."Document Type" := PurchaseLine."document type"::Order;
                        PurchaseLine."Document No." := PurchaseHeader."No.";
                        PurchaseLine."Line No." := ProcReqLines2."Line No";//PurchaseLine.VALIDATE(PurchaseLine."No.");
                        PurchaseLine."Buy-from Vendor No." := ProcReqLines2."Vendor No";

                        if ProcReqLines.Type = ProcReqLines2.Type::"Non Stock Item" then
                            PurchaseLine.Type := PurchaseLine.Type::"G/L Account";
                        if ProcReqLines.Type = ProcReqLines2.Type::"Fixed Asset" then
                            PurchaseLine.Type := PurchaseLine.Type::"Fixed Asset";
                        if ProcReqLines.Type = ProcReqLines2.Type::Item then
                            PurchaseLine.Type := PurchaseLine.Type::Item;

                        PurchaseLine."No." := ProcReqLines2.No;
                        PurchaseLine.Description := ProcReqLines2.Description;
                        PurchaseLine."Unit of Measure" := ProcReqLines2."Unit of Measure";
                        PurchaseLine.Quantity := ProcReqLines2.Quantity;
                        PurchaseLine."Direct Unit Cost" := ProcReqLines2."Unit Price";
                        PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");
                        //PurchaseLine."Location Code":=PurchaseRecLine."Location Code";
                        if not PurchaseLine.Get(PurchaseLine."document type"::Order, PurchaseHeader."No.", ProcReqLines2."Line No") then
                            PurchaseLine.Insert(true);
                    end;
                    //UNTIL ProcReqLines.NEXT = 0;
                    //CODEUNIT.RUN(CODEUNIT::"Purch.-Quote to Order",PurchaseHeader);


                    //Update the Proc Request
                    /*ProcReqLines.RESET;
                    ProcReqLines.SETRANGE("Requisition No",ProcReqLines."Requisition No");
                    ProcReqLines.SETRANGE(Ordered,FALSE);
                    ProcReqLines.SETRANGE(Select,TRUE);
                    IF ProcReqLines.FIND('-') THEN BEGIN
                    REPEAT*/
                    ProcReqLines2.Ordered := true;
                    ProcReqLines2."Order Date" := Today;
                    ProcReqLines2.Modify;
                /*UNTIL ProcReqLines.NEXT =0;
                END;*/

                //END;
                until ProcReqLines2.Next = 0;

                Message(Text001, PurchaseHeader."No.");
            end;//****ProcReqLines2

            //Update Header Fully ordered*****
            Recordsupdated := 0;
            //Update Header Fully ordered
            ProcReqLines1.Reset;
            // ProcReqLines1.SetRange("Requisition No",ProcReqLines."Requisition No");
            ProcReqLines1.SetRange(Ordered, false);
            ProcReqLines1.SetRange(Select, true);
            if ProcReqLines1.Find('-') then begin
                repeat
                    Recordsupdated := Recordsupdated + 1;
                until ProcReqLines1.Next = 0;
            end;


            if Recordsupdated = 0 then begin
                ProcReq.Closed := true;
                ProcReq.Status := ProcReq.Status::"Pending Approval";
                ProcReq.Modify;

                //Update Purch Req
                ProcReq.Reset;
                // ProcReq.SetRange(ProcReq.No,ProcReqLines."Requisition No");
                if ProcReq.Find('-') then
                    if PurchaseRec.Get(ProcReq."Requisition No") then begin
                        PurchaseRec.Ordered := true;
                        PurchaseRec.Modify;
                    end;


            end;
            //Update Header Fully ordered*****


        end;

    end;

    procedure CreatePurchaseOrderProcMethod(var ProcReq: Record "Procurement Request")
    var
        PurchaseRec: Record "Purchase Header";
        PurchaseHeader: Record "Purchase Header";
        ProcReqLines: Record "Procurement Request Lines";
        PurchaseLine: Record "Purchase Line";
    begin

        with ProcReq do begin

            //Purchase Header
            PurchaseHeader.Init;
            PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
            PurchaseHeader."No." := '';
            PurchaseHeader."Buy-from Vendor No." := ProcReq."Vendor No";
            PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
            // Vend.Reset;
            // Vend.SetRange("No.",ProcReq."Vendor No");
            // if Vend.FindSet then
            // PurchaseHeader."Supplier Type":=Vend."Special Groups Type";
            PurchaseHeader."Requisition No" := ProcReq."Requisition No";
            PurchaseHeader."Posting Date" := Today;
            PurchaseHeader."Due Date" := Today;
            PurchaseHeader.Validate(PurchaseHeader."Posting Date");
            PurchaseHeader."Document Date" := Today;
            PurchaseHeader.Validate(PurchaseHeader."Document Date");
            //IF NOT PurchaseHeader.GET(PurchaseHeader."No.") THEN
            PurchaseHeader.Insert(true);


            ProcReqLines.Reset;
            ProcReqLines.SetRange("Requisition No", ProcReq.No);
            if ProcReqLines.Find('-') then begin
                repeat
                    //Purchase Lines
                    PurchaseLine.Reset;
                    PurchaseLine.SetRange(PurchaseLine."Document Type", PurchaseLine."document type"::Order);
                    PurchaseLine.SetRange(PurchaseLine."Document No.", PurchaseHeader."No.");
                    PurchaseLine.SetRange(PurchaseLine."Line No.", ProcReqLines."Line No");
                    PurchaseLine.SetRange(PurchaseLine."Buy-from Vendor No.", ProcReq."Vendor No");
                    if not PurchaseLine.FindFirst then begin
                        PurchaseLine.Init;
                        PurchaseLine."Document Type" := PurchaseLine."document type"::Order;
                        PurchaseLine."Document No." := PurchaseHeader."No.";
                        PurchaseLine."Line No." := ProcReqLines."Line No";//PurchaseLine.VALIDATE(PurchaseLine."No.");
                        PurchaseLine."Buy-from Vendor No." := ProcReq."Vendor No";
                        //PurchaseLine.Type:=ProcReqLines.Type;

                        if ProcReqLines.Type = ProcReqLines.Type::"Non Stock Item" then
                            PurchaseLine.Type := PurchaseLine.Type::"G/L Account";
                        if ProcReqLines.Type = ProcReqLines.Type::"Fixed Asset" then
                            PurchaseLine.Type := PurchaseLine.Type::"Fixed Asset";
                        if ProcReqLines.Type = ProcReqLines.Type::Item then begin
                            PurchaseLine.Type := PurchaseLine.Type::Item;
                        end;
                        PurchaseLine."No." := ProcReqLines.No;
                        PurchaseLine.Validate(PurchaseLine."No.");
                        // PurchaseLine."Activity Type":=ProcReqLines."Activity Type";
                        // PurchaseLine.Activity:=ProcReqLines.Activity;
                        // PurchaseLine."Current Budget":=ProcReqLines."Current Budget";
                        PurchaseLine.Description := ProcReqLines.Description;
                        PurchaseLine."Unit of Measure" := ProcReqLines."Unit of Measure";
                        PurchaseLine.Quantity := ProcReqLines.Quantity;
                        PurchaseLine."Direct Unit Cost" := ProcReqLines.Amount;
                        PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");
                        //PurchaseLine."Location Code":=PurchaseRecLine."Location Code";
                        //  PurchLine.Amount:=PurchaseLine.Quantity* PurchaseLine."Direct Unit Cost";
                        PurchaseLine.Validate(Quantity);
                        PurchaseLine."Direct Unit Cost" := ProcReqLines.Amount;
                        //IF NOT PurchaseLine.GET(PurchaseLine."Document Type"::Order,PurchaseHeader."No.",ProcReqLines."Line No.") THEN
                        PurchaseLine.Insert(true);
                    end;
                until ProcReqLines.Next = 0;
                //CODEUNIT.RUN(CODEUNIT::"Purch.-Quote to Order",PurchaseHeader);
            end;

            Message(Text001, PurchaseHeader."No.");
            PurchaseRec.Reset;
            PurchaseRec.SetRange("No.", ProcReq."Requisition No");
            if PurchaseRec.FindSet then begin
                //IF PurchaseRec.GET(ProcReq."Requisition No") THEN BEGIN
                PurchaseRec.Ordered := true;
                PurchaseRec.Modify;
            end;

            //Update the Proc Request
            ProcReq.Closed := true;
            ProcReq.Status := ProcReq.Status::"Pending Approval";
            ProcReq.Modify;


        end;
    end;

    //Unsupported feature: Insertion (FieldGroupCollection) on "(FieldGroup: DropDown)".


    var
        HeaderPurch: Record "Purchase Header";

    var
        Commitment: Codeunit "Procurement Processing";


        Text0057: label 'Please Select the Supplier';
        Text0058: label 'Purchase Order No %1 has been created';
        Text0059: label 'Process Type %1,  cannot be used when the Amount is above the set limit of %2';
        Text0060: label 'Process Type %1,  cannot be used when the Amount is less than the minimum the set limit of %2';
        Text0061: label 'Are you sure you want to select Process Type as %1 ?';
        ProcCeiling: Record "Procurement Financial ceilings";
        RequisitionHeader: Record "Purchase Header";
        RequisitionLines: Record "Purchase Line";
        RFQLines: Record "Procurement Request Lines";
        VATPostingSetup: Record "VAT Posting Setup";
        UsersRec: Record "User Setup";
        Empl: Record Employee;
        // "...procurement....": ;
        Text001: label 'Purchase Order No %1 has been created';
        AnnualReportingCodes: Record "Annual Reporting Codes";
        PlanItem: Record "Procurement Plan1";
        ItemCategory: Record "Item Category";
        PPlanEntry: Record "Procurement Plan Entry";
        ProcSetup: Record "Procurement Setup";
        WorksCategory: Record "Works Category";
        // EmailNotification: Codeunit "Email Notifications.";
        IFSfee: Record "Bid Charges Schedule";
        DetailsOfRoadActivities: Record "Details Of Road Activities";
        Procurement: Codeunit "Procurement Processing";
        JobPlanningLine: Record "Job Planning Line";
        JobTask: Record "Job Task";
        JobS: Record Job;
        AssignedUserID: CODE[100];
        IFS: Record "Standard Purchase Code";
        IFSLines: Record "Standard Purchase Line";
        PurchLines: Record "Purchase Line";
        Vendor: Record Vendor;
        ApprovalEntry: record 454;
        FixedAsset: Record "Fixed Asset";
        //Roadinve: Record "Road Inventory";
        SoliType: Record "Solicitation Type";
        UserSetup: Record "User Setup";
        TotalCommitments: Decimal;
        AvaillableBudget: Decimal;
        ObjJob: Record Job;
        SurveyRequestHeader: Record "Survey Request Header";
        SurveyRequestLine: Record "Survey Request Line";
        SurveyReqNo: Code[40];
        ProcurementProcessing: Codeunit "Procurement Processing";
        SurveyStudyDesignRequest: Page "Survey/Study/Design Request";
        DocTemplateLine: Record "Procurement Doc Template Line";
        ContractIssuanceDocs: Record "Contract Issuance Requirements";
        ProcurementSetup: Record "Procurement Setup";
        Mergefiles: Codeunit MergeCurriculum;
}

