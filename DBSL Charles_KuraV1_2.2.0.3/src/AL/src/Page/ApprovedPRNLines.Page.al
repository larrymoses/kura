#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 50062 "Approved PRN Lines"
{
    // ApplicationArea = Basic;
    // AutoSplitKey = true;
    // Caption = 'Approved PRN Lines';
    // DelayedInsert = true;
    // DeleteAllowed = false;
    // InsertAllowed = false;
    // LinksAllowed = false;
    // MultipleNewLines = true;
    // PageType = List;
    // SourceTable = "Purchase Line";
    // //SourceTableView = where("Document Type"=filter("Purchase Requisition"),
    //   //                      Status=const(Released),
    //     //                    "Fully Issued"=const(false));
    // UsageCategory = Lists;

    // layout
    // {
    // area(content)
    // {
    //     repeater(Control1)
    //     {
    //                 field(Select2;Select2)
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Dimension Set ID";"Dimension Set ID")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Visible = false;
    //                 }
    //                 field("Document Type";"Document Type")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Visible = false;
    //                 }
    //                 field(Ordered;Ordered)
    //                 {
    //                     ApplicationArea = Basic;
    //                     Visible = false;
    //                 }
    //                 field(Decision;Decision)
    //                 {
    //                     ApplicationArea = Basic;
    //                     Visible = false;
    //                 }
    //                 field("PO Type";"PO Type")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Vote Item";"Vote Item")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Buy-from Vendor No.";"Buy-from Vendor No.")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("PO Number";"PO Number")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Visible = false;
    //                 }
    //                 field("Selected By";"Selected By")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;
    //                 }
    //                 field("Document No.";"Document No.")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;
    //                 }
    //                 field("Requestor ID";"Requestor ID")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field(Category;Category)
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;
    //                 }
    //                 field("Service/Item Code";"Service/Item Code")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;
    //                 }
    //                 field(Type;Type)
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;
    //                 }
    //                 field("No.";"No.")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;

    //                     trigger OnValidate()
    //                     begin
    //                         ShowShortcutDimCode(ShortcutDimCode);
    //                         NoOnAfterValidate;
    //                     end;
    //                 }
    //                 field("Type of Vehicle";"Type of Vehicle")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Vehicle Description";"Vehicle Description")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field(Description;Description)
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;
    //                 }
    //                 field("Direct Unit Cost";"Direct Unit Cost")
    //                 {
    //                     ApplicationArea = Basic;
    //                     BlankZero = true;
    //                     Editable = false;
    //                 }
    //                 field("Unit Cost (LCY)";"Unit Cost (LCY)")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;
    //                     Visible = false;
    //                 }
    //                 field("VAT %";"VAT %")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;
    //                 }
    //                 field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Editable = false;
    //                 }
    //                 field("Line Amount";"Line Amount")
    //                 {
    //                     ApplicationArea = Basic;
    //                     BlankZero = true;
    //                     Editable = false;
    //                 }
    //                 field(Amount;Amount)
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //                 field("Amount Including VAT";"Amount Including VAT")
    //                 {
    //                     ApplicationArea = Basic;
    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             group("Purchase Order")
    //             {
    //                 Caption = 'Purchase Order';
    //                 Image = Delivery;
    //                 action("Add to Purchase Order")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Caption = 'Add to Purchase Order';
    //                     Image = AddAction;
    //                     Promoted = true;
    //                     PromotedIsBig = true;
    //                     Visible = false;

    //                     trigger OnAction()
    //                     begin
    //                         //OpenSalesOrderForm;


    //                         if Confirm(Text002,false)=true then begin

    //                         ReqLine.Reset;
    //                         ReqLine.SetRange(ReqLine."Document Type",ReqLine."document type"::"Purchase Requisition");
    //                         ReqLine.SetRange(ReqLine.Select2,true);
    //                         ReqLine.SetRange(ReqLine.Ordered,false);

    //                         ReqLine.SetRange(ReqLine."Selected By",UserId);
    //                         //ReqLine.SETFILTER(ReqLine.Category,'<>%1',ReqLine.Category::Item);
    //                         if ReqLine.Find('-') then begin
    //                         repeat
    //                         PURCHLINE.Reset;
    //                         PURCHLINE.SetRange(PURCHLINE."Document Type",PURCHLINE."document type"::Order);
    //                         PURCHLINE.SetRange(PURCHLINE."Document No.",ReqLine."PO Number");


    //                         if PURCHLINE.Find('-')  then  begin
    //                         repeat
    //                          LineNo:=PURCHLINE."Line No.";
    //                          //MESSAGE('%1',ReqLine."No.");
    //                          until PURCHLINE.Next=0;
    //                         end else begin

    //                          LineNo:=0;
    //                          end;

    //                         /*


    //                         //MESSAGE('%1',ReqLine."No.");
    //                         PURCHLINE.RESET;
    //                         PURCHLINE.SETRANGE(PURCHLINE."Document Type",PURCHLINE."Document Type"::Order);
    //                         PURCHLINE.SETRANGE(PURCHLINE."Document No.",ReqLine."PO Number");
    //                         PURCHLINE.SETRANGE(PURCHLINE.Type,ReqLine.Type);
    //                         PURCHLINE.SETRANGE(PURCHLINE."No.",ReqLine."No.");

    //                         IF PURCHLINE.FINDFIRST=FALSE  THEN BEGIN
    //                         repeat
    //                          // MESSAGE('%1',ReqLine."Service/Item Code");


    //                         */


    //                         //MESSAGE('%1',ReqLine."No.");
    //                         PURCHLINE.Init;
    //                         PURCHLINE."Line No.":=LineNo+10000;

    //                         PURCHLINE."Document Type":=PURCHLINE."document type"::Order;
    //                         PURCHLINE."Document No.":=ReqLine."PO Number";
    //                         //MESSAGE('%1',ReqLine."No.");
    //                         PURCHLINE.Type:=ReqLine.Type;
    //                         //PURCHLINE.VALIDATE(PURCHLINE.Type);
    //                         PURCHLINE."No.":=ReqLine."No.";
    //                         if Type=Type::"G/L Account" then begin
    //                         if Acct.Get(ReqLine."No.") then begin
    //                         PURCHLINE."Gen. Bus. Posting Group":=Acct."Gen. Bus. Posting Group";
    //                         PURCHLINE."Gen. Prod. Posting Group":=Acct."Gen. Prod. Posting Group";
    //                         PURCHLINE."VAT Bus. Posting Group":=Acct."VAT Bus. Posting Group";
    //                         PURCHLINE."VAT Prod. Posting Group":=Acct."VAT Prod. Posting Group";
    //                         end;

    //                         end;
    //                         PURCHLINE.Category:=ReqLine.Category;
    //                         //PURCHLINE.VALIDATE(PURCHLINE.Category);
    //                         PURCHLINE."Item Category":=ReqLine."Item Category";

    //                         PURCHLINE."Service/Item Code":=ReqLine."Service/Item Code";
    //                         PURCHLINE."Location Code":=ReqLine."Location Code";
    //                         //PURCHLINE.VALIDATE(PURCHLINE."Service/Item Code");
    //                         //PURCHLINE.Type:=ReqLine.Type;
    //                         //PURCHLINE.VALIDATE(PURCHLINE.Type);
    //                         PURCHLINE.Quantity:=ReqLine."Qty. Requested";
    //                         //PURCHLINE.VALIDATE(PURCHLINE.Quantity);

    //                         if PURCHLINE.Type=PURCHLINE.Type::"G/L Account" then begin
    //                         PURCHLINE."Job No.":=ReqLine."Job No.";

    //                         PURCHLINE."Job Task No.":=ReqLine."Job Task No.";


    //                         end;

    //                         PURCHLINE.Insert(true);
    //                         //MESSAGE('%1',PURCHLINE."Service/Item Code");
    //                         //END;

    //                         PURCHLINE.Validate("Service/Item Code");
    //                         PURCHLINE."Requisition No.":=ReqLine."No.";

    //                         //IF PURCHLINE.Type=PURCHLINE.Type::"G/L Account" THEN BEGIN
    //                         //PURCHLINE.VALIDATE(PURCHLINE."No.");
    //                         PURCHLINE.Description:=ReqLine.Description;
    //                         PURCHLINE."Direct Unit Cost":=ReqLine."Direct Unit Cost";
    //                         PURCHLINE.Validate(PURCHLINE."Direct Unit Cost");
    //                         PURCHLINE."Dimension Set ID":=ReqLine."Dimension Set ID";
    //                         PURCHLINE.Validate(PURCHLINE."Dimension Set ID");
    //                         //;
    //                         PURCHLINE.Validate("Job No.");
    //                         PURCHLINE.Validate("Job Task No.");
    //                         PURCHLINE.Modify;
    //                          //END;
    //                         //PURCHLINE.VALIDATE("Service/Item Code");
    //                         //PURCHLINE.VALIDATE(PURCHLINE.Category);
    //                         PURCHLINE.Validate(PURCHLINE.Quantity);
    //                         LineNo:=LineNo+10000;
    //                         //END;



    //                         until ReqLine.Next=0;
    //                         end;


    //                         ReqLine.Reset;
    //                         ReqLine.SetRange(ReqLine."Document Type",ReqLine."document type"::"Purchase Requisition");
    //                         ReqLine.SetRange(ReqLine.Select2,true);
    //                         ReqLine.SetRange(ReqLine.Ordered,false);
    //                         ReqLine.SetRange(ReqLine."Selected By",UserId);


    //                         if ReqLine.Find('-') then begin
    //                         repeat

    //                         PURCHLINE.Reset;
    //                         PURCHLINE.SetRange(PURCHLINE."Document Type",PURCHLINE."document type"::Order);
    //                         PURCHLINE.SetRange(PURCHLINE."Document No.",ReqLine."PO Number");
    //                         PURCHLINE.SetRange(PURCHLINE.Type,ReqLine.Type);
    //                         PURCHLINE.SetRange(PURCHLINE."No.",ReqLine."No.");

    //                         if PURCHLINE.FindFirst  then begin



    //                         PURCHLINE.Category:=ReqLine.Category;
    //                         PURCHLINE."Service/Item Code":=ReqLine."Service/Item Code";
    //                         PURCHLINE."Location Code":=ReqLine."Location Code";
    //                         PURCHLINE.Description:=ReqLine.Description;
    //                         PURCHLINE.Modify;
    //                         /*
    //                         //BEGIN--insert line dimension
    //                          DocDim.RESET;
    //                          DocDim.SETRANGE(DocDim."Table ID",39);
    //                          DocDim.SETRANGE(DocDim."Document Type",ReqLine."Document Type");
    //                          DocDim.SETRANGE(DocDim."Document No.",ReqLine."Document No.");
    //                          DocDim.SETRANGE(DocDim."Line No.",ReqLine."Line No.");

    //                          IF DocDim.FIND('-') THEN BEGIN
    //                          REPEAT

    //                          IF DocDim2.GET(38,PURCHLINE."Document Type"::Order,PURCHLINE."Document No.",0,DocDim."Dimension Code")
    //                          THEN BEGIN
    //                          DocDim2."Dimension Code":=DocDim."Dimension Code";
    //                          DocDim2.VALIDATE( DocDim2."Dimension Code");
    //                          DocDim2."Dimension Value Code":=DocDim."Dimension Value Code";
    //                          DocDim2.VALIDATE(DocDim2."Dimension Value Code");
    //                          DocDim2."Dimension Code":=DocDim."Dimension Code";
    //                          DocDim2.MODIFY;

    //                          END ELSE BEGIN
    //                          DocDim2.INIT;
    //                          DocDim2."Table ID":=38;
    //                          DocDim2."Document Type":=PURCHLINE."Document Type";
    //                          DocDim2."Document No.":=PURCHLINE."Document No.";
    //                          DocDim2."Line No.":=0;
    //                          DocDim2."Dimension Code":=DocDim."Dimension Code";
    //                          DocDim2.VALIDATE( DocDim2."Dimension Code");
    //                          DocDim2."Dimension Value Code":=DocDim."Dimension Value Code";
    //                          DocDim2.VALIDATE(DocDim2."Dimension Value Code");
    //                          DocDim2.INSERT(TRUE);

    //                          END;


    //                          IF DocDim2.GET(39,PURCHLINE."Document Type"::Order,PURCHLINE."Document No.",PURCHLINE."Line No.",DocDim."Dimension Code")
    //                          THEN BEGIN
    //                          DocDim2."Dimension Code":=DocDim."Dimension Code";
    //                          DocDim2.VALIDATE( DocDim2."Dimension Code");
    //                          DocDim2."Dimension Value Code":=DocDim."Dimension Value Code";
    //                          DocDim2.VALIDATE(DocDim2."Dimension Value Code");
    //                          DocDim2."Dimension Code":=DocDim."Dimension Code";
    //                          DocDim2.MODIFY;

    //                          END ELSE BEGIN
    //                          DocDim2.INIT;
    //                          DocDim2."Table ID":=39;
    //                          DocDim2."Document Type":=PURCHLINE."Document Type";
    //                          DocDim2."Document No.":=PURCHLINE."Document No.";
    //                          DocDim2."Line No.":=PURCHLINE."Line No.";
    //                          DocDim2."Dimension Code":=DocDim."Dimension Code";
    //                          DocDim2.VALIDATE( DocDim2."Dimension Code");
    //                          DocDim2."Dimension Value Code":=DocDim."Dimension Value Code";
    //                          DocDim2.VALIDATE(DocDim2."Dimension Value Code");
    //                          DocDim2.INSERT(TRUE);

    //                          END;

    //                          UNTIL DocDim.NEXT=0;
    //                          END;


    //                         //END--insert line dimension

    //                         */


    //                         end;

    //                         ReqLine."Ordered by":=UserId;
    //                         ReqLine."Order Creation date":=Today;
    //                         ReqLine."Order Creation Time":=Time;
    //                         ReqLine.Ordered:=true;
    //                         ReqLine.Modify;
    //                         until ReqLine.Next=0;
    //                         end;


    //                          /*

    //                         //MESSAGE('%1',ReqLine."No.");
    //                          ReqLine2.RESET;
    //                          ReqLine2.SETRANGE(ReqLine2.Type,ReqLine.Type);
    //                          ReqLine2.SETRANGE(ReqLine2."No.",ReqLine."No.");
    //                          ReqLine2.SETFILTER(ReqLine2."Document No.",'>%1',ReqLine."Document No.");

    //                         IF ReqLine2.FIND('-') THEN BEGIN

    //                         REPEAT
    //                         //MESSAGE('%1',ReqLine."No.");
    //                         PURCHLINE.RESET;
    //                         PURCHLINE.SETRANGE(PURCHLINE."Document Type",PURCHLINE."Document Type"::Order);
    //                         PURCHLINE.SETRANGE(PURCHLINE."Document No.",ReqLine."PO Number");
    //                         PURCHLINE.SETRANGE(PURCHLINE.Type,ReqLine.Type);
    //                         PURCHLINE.SETRANGE(PURCHLINE."No.",ReqLine."No.");

    //                         IF PURCHLINE.FINDFIRST  THEN BEGIN
    //                         PURCHLINE.Quantity:=PURCHLINE.Quantity+ReqLine2."Qty. Requested";
    //                         PURCHLINE.VALIDATE(PURCHLINE.Quantity);
    //                         PURCHLINE.MODIFY;
    //                         END;


    //                         UNTIL ReqLine2.NEXT=0;
    //                         END;
    //                         */

    //                         end;

    //                     end;
    //                 }
    //                 action("Create Purchase Order")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Caption = 'Create Purchase Order';
    //                     Image = AddAction;
    //                     Promoted = true;
    //                     PromotedIsBig = true;
    //                     Visible = false;

    //                     trigger OnAction()
    //                     begin

    //                         if Confirm(Text003,false)=true then
    //                         begin
    //                           ReqLine.Reset;
    //                           ReqLine.SetRange(ReqLine."Document Type",ReqLine."document type"::"Purchase Requisition");
    //                           ReqLine.SetRange(ReqLine.Select2,true);
    //                           ReqLine.SetRange(ReqLine.Ordered,false);
    //                           ReqLine.SetRange(ReqLine."Selected By",UserId);
    //                           if ReqLine.FindFirst then begin
    //                           //insert purchase header
    //                             //IF ReqLine."Buy-from Vendor No." = xRec."Buy-from Vendor No." THEN BEGIN
    //                               PurchaseHeader.Init;
    //                               GLSetup.Get;
    //                               GLSetup.TestField("Order Nos.");
    //                               GLSetup.TestField("LSO Nos.");
    //                               if ReqLine."PO Type" = ReqLine."po type"::LPO then
    //                               begin
    //                                 NoSeriesMgt.InitSeries(GLSetup."Order Nos.",' ',0D,LineNo2,PurchaseHeader."No. Series");
    //                                 LineNo2 := gCuNoSeriesMngmnt.GetNextNo(GLSetup."Order Nos.",WorkDate,true);
    //                                 PurchaseHeader."No. Series" := GLSetup."Order Nos.";
    //                                 PurchaseHeader."PO Type" := PurchaseHeader."po type"::LPO;
    //                               end else
    //                               if ReqLine."PO Type" = ReqLine."po type"::LSO then
    //                               begin
    //                                 NoSeriesMgt.InitSeries(GLSetup."LSO Nos.",' ',0D,LineNo2,PurchaseHeader."No. Series");
    //                                 LineNo2 := gCuNoSeriesMngmnt.GetNextNo(GLSetup."LSO Nos.",WorkDate,true);
    //                                 PurchaseHeader."No. Series" := GLSetup."LSO Nos.";
    //                                 PurchaseHeader."PO Type" := PurchaseHeader."po type"::LSO;
    //                               end;

    //                               PurchaseHeader."No." := LineNo2;
    //                               PurchaseHeader."Posting No. Series":= GLSetup."Posted Invoice Nos.";
    //                               PurchaseHeader."Buy-from Vendor No." := "Buy-from Vendor No.";
    //                               PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
    //                               PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
    //                               PurchaseHeader."Document Date" := WorkDate;
    //                               PurchaseHeader."Posting Date" := WorkDate;
    //                               PurchaseHeader."Vendor Order No." :="Document No.";
    //                               PurchaseHeader."Order Date" := WorkDate;
    //                               PurchaseHeader."Posting Description" := 'Order  '+ PurchaseHeader."No.";
    //                               PurchaseHeader."Prepayment Due Date" := WorkDate;
    //                               PurchaseHeader."Vendor Invoice No." := ReqLine."No.";
    //                               PurchaseHeader."Assigned User ID" := UserId;
    //                               PurchaseHeader."Pay-to Vendor No." := ReqLine."Buy-from Vendor No.";
    //                               PurchaseHeader.Validate(PurchaseHeader."Pay-to Vendor No.");
    //                               PurchaseHeader."Due Date" := WorkDate;
    //                               PurchaseHeader."Expected Receipt Date" := WorkDate;
    //                               PurchaseHeader."Currency Factor" := 1;
    //                               PurchaseHeader."Dimension Set ID" := ReqLine."Dimension Set ID";
    //                               PurchaseHeader.Insert(true);
    //                               end;

    //                           ReqLine.Reset;
    //                           ReqLine.SetRange(ReqLine."Document Type",ReqLine."document type"::"Purchase Requisition");
    //                           ReqLine.SetRange(ReqLine.Select2,true);
    //                           ReqLine.SetRange(ReqLine.Ordered,false);
    //                           ReqLine.SetRange(ReqLine."Selected By",UserId);
    //                           if ReqLine.Find('-') then
    //                           begin
    //                             repeat

    //                               /*
    //                               //insert the lines
    //                               ReqLine2.RESET;
    //                               ReqLine2.SETRANGE(ReqLine2."Buy-from Vendor No.",ReqLine."Buy-from Vendor No.");
    //                               ReqLine2.SETRANGE(ReqLine2."PO Type",ReqLine."PO Type");
    //                               IF ReqLine2.FIND('-') THEN
    //                               BEGIN
    //                                 REPEAT*/
    //                                   purchaseLine.Init;
    //                                   purchaseLine."Document Type" := purchaseLine."document type"::Order;
    //                                   purchaseLine."Document No." := PurchaseHeader."No.";
    //                                   purchaseLine."Buy-from Vendor No." := ReqLine."Buy-from Vendor No.";
    //                                   purchaseLine."Pay-to Vendor No." := ReqLine."Buy-from Vendor No.";
    //                                   purchaseLine."Line No." := ReqLine."Line No.";
    //                                   purchaseLine.Type := ReqLine.Type;
    //                                   purchaseLine."No." := ReqLine."No.";
    //                                   purchaseLine.Description := PadStr(ReqLine.Description,50);
    //                                   purchaseLine."Service/Item Code" := ReqLine."Service/Item Code";
    //                                   purchaseLine."Job No." := ReqLine."Job No.";
    //                                   purchaseLine."Job Task No." := ReqLine."Job Task No.";
    //                                   purchaseLine.Quantity := ReqLine.Quantity;
    //                                   purchaseLine."Location Code" := ReqLine."Location Code";
    //                                   purchaseLine.Validate(purchaseLine.Quantity);
    //                                   purchaseLine."Direct Unit Cost" := ReqLine."Direct Unit Cost";
    //                                   purchaseLine.Validate(purchaseLine."Direct Unit Cost");
    //                                   purchaseLine."Line Amount" := ReqLine."Line Amount";
    //                                   purchaseLine."Unit of Measure" := ReqLine."Unit of Measure";
    //                                   purchaseLine."Unit of Measure Code" := ReqLine."Unit of Measure Code";
    //                                   purchaseLine."Dimension Set ID" := ReqLine."Dimension Set ID";
    //                                   purchaseLine.Validate(purchaseLine."Shortcut Dimension 1 Code");
    //                                   purchaseLine.Validate(purchaseLine."Shortcut Dimension 2 Code");
    //                                   purchaseLine."Gen. Bus. Posting Group" := ReqLine."Gen. Bus. Posting Group";
    //                                   purchaseLine."Gen. Prod. Posting Group" := ReqLine."Gen. Prod. Posting Group";
    //                                   purchaseLine."VAT Bus. Posting Group" := ReqLine."VAT Bus. Posting Group";
    //                                   purchaseLine."VAT Prod. Posting Group" := ReqLine."VAT Prod. Posting Group";
    //                                   purchaseLine.Insert(true);
    //                                 //UNTIL ReqLine2.NEXT=0;
    //                               //END;
    //                               /*
    //                               ReqLine."Ordered by":=USERID;
    //                               ReqLine."Order Creation date":=TODAY;
    //                               ReqLine."Order Creation Time":=TIME;
    //                               ReqLine.Ordered:=TRUE;
    //                               ReqLine.MODIFY;
    //                               */
    //                               Message('Purchase order no %1 created successfully',PurchaseHeader."No.");
    //                             until ReqLine.Next=0;
    //                             end;

    //                         end;

    //                           //END;
    //                         //END;
    //                         //CurrPage.CLOSE();

    //                     end;
    //                 }
    //                 action(Action1000000017)
    //                 {
    //                     ApplicationArea = Basic;
    //                     Caption = 'Create Purchase Order';
    //                     Image = AddAction;
    //                     Promoted = true;
    //                     PromotedIsBig = true;
    //                     Visible = false;

    //                     trigger OnAction()
    //                     begin

    //                         if Confirm(Text003,false)=true then
    //                         begin

    //                         //different selected lines

    //                         ReqLine.Reset;
    //                         ReqLine.SetRange(ReqLine."Document Type",ReqLine."document type"::"Purchase Requisition");
    //                         ReqLine.SetRange(ReqLine.Select2,true);
    //                         ReqLine.SetRange(ReqLine.Ordered,false);
    //                         ReqLine.SetRange(ReqLine."Selected By",UserId);
    //                         if ReqLine.Find('-') then begin
    //                              repeat
    //                             //insert purchase header
    //                             PurchaseHeader.Init;
    //                             GLSetup.Get;
    //                             GLSetup.TestField("Order Nos.");
    //                             GLSetup.TestField(GLSetup."LSO Nos.");
    //                             if ReqLine."PO Type" = ReqLine."po type"::LPO then
    //                             begin
    //                               NoSeriesMgt.InitSeries(GLSetup."Order Nos.",' ',0D,LineNo2,PurchaseHeader."No. Series");
    //                               LineNo2 := gCuNoSeriesMngmnt.GetNextNo(GLSetup."Order Nos.",WorkDate,true);
    //                               PurchaseHeader."No. Series" := GLSetup."Order Nos.";
    //                               PurchaseHeader."PO Type" := PurchaseHeader."po type"::LPO;
    //                             end else
    //                             if ReqLine."PO Type" = ReqLine."po type"::LSO then
    //                             begin
    //                               NoSeriesMgt.InitSeries(GLSetup."LSO Nos.",' ',0D,LineNo2,PurchaseHeader."No. Series");
    //                               LineNo2 := gCuNoSeriesMngmnt.GetNextNo(GLSetup."LSO Nos.",WorkDate,true);
    //                               PurchaseHeader."No. Series" := GLSetup."LSO Nos.";
    //                               PurchaseHeader."PO Type" := PurchaseHeader."po type"::LSO;
    //                             end;

    //                             PurchaseHeader."No." := LineNo2;
    //                             PurchaseHeader."Posting No. Series":= GLSetup."Posted Invoice Nos.";
    //                             PurchaseHeader."Buy-from Vendor No." := ReqLine."Buy-from Vendor No.";
    //                             PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
    //                             PurchaseHeader."Document Type" := PurchaseHeader."document type"::Order;
    //                             PurchaseHeader."Document Date" := WorkDate;
    //                             PurchaseHeader."Posting Date" := WorkDate;
    //                             PurchaseHeader."Vendor Order No." := ReqLine."Document No.";
    //                             PurchaseHeader."Order Date" := WorkDate;
    //                             PurchaseHeader."Posting Description" := 'Order  '+ PurchaseHeader."No.";
    //                             PurchaseHeader."Prepayment Due Date" := WorkDate;
    //                             PurchaseHeader."Vendor Invoice No." := ReqLine."No.";
    //                             PurchaseHeader."Assigned User ID" := UserId;
    //                             PurchaseHeader."Pay-to Vendor No." := ReqLine."Buy-from Vendor No.";
    //                             PurchaseHeader.Validate(PurchaseHeader."Pay-to Vendor No.");
    //                             PurchaseHeader."Due Date" := WorkDate;
    //                             PurchaseHeader."Expected Receipt Date" := WorkDate;
    //                             PurchaseHeader."Currency Factor" := 1;
    //                             PurchaseHeader."Dimension Set ID" := ReqLine."Dimension Set ID";
    //                             PurchaseHeader.Insert(true);


    //                              //insert the lines
    //                             ReqLine2.Reset;
    //                             ReqLine2.SetRange(ReqLine2."Buy-from Vendor No.",ReqLine."Buy-from Vendor No.");
    //                             ReqLine2.SetRange(ReqLine2."PO Type",ReqLine."PO Type");
    //                             if ReqLine2.Find('-') then
    //                             begin
    //                               repeat
    //                                 purchaseLine.Init;
    //                                 purchaseLine."Document Type" := purchaseLine."document type"::Order;
    //                                 purchaseLine."Document No." := PurchaseHeader."No.";
    //                                 purchaseLine."Buy-from Vendor No." := ReqLine2."Buy-from Vendor No.";
    //                                 purchaseLine."Pay-to Vendor No." := ReqLine2."Buy-from Vendor No.";
    //                                 purchaseLine."Line No." := ReqLine2."Line No.";
    //                                 purchaseLine.Type := ReqLine2.Type;
    //                                 purchaseLine."No." := ReqLine2."No.";
    //                                 purchaseLine.Description := PadStr(ReqLine2.Description,50);
    //                                 purchaseLine."Service/Item Code" := ReqLine2."Service/Item Code";
    //                                 purchaseLine."Job No." := ReqLine2."Job No.";
    //                                 purchaseLine."Job Task No." := ReqLine2."Job Task No.";
    //                                 purchaseLine.Quantity := ReqLine2.Quantity;
    //                                 purchaseLine."Location Code" := ReqLine2."Location Code";
    //                                 purchaseLine.Validate(purchaseLine.Quantity);
    //                                 purchaseLine."Direct Unit Cost" := ReqLine2."Direct Unit Cost";
    //                                 purchaseLine.Validate(purchaseLine."Direct Unit Cost");
    //                                 purchaseLine."Line Amount" := ReqLine2."Line Amount";
    //                                 purchaseLine."Unit of Measure" := ReqLine2."Unit of Measure";
    //                                 purchaseLine."Unit of Measure Code" := ReqLine2."Unit of Measure Code";
    //                                 purchaseLine."Dimension Set ID" := ReqLine."Dimension Set ID";
    //                                 purchaseLine.Validate(purchaseLine."Shortcut Dimension 1 Code");
    //                                 purchaseLine.Validate(purchaseLine."Shortcut Dimension 2 Code");
    //                                 purchaseLine."Gen. Bus. Posting Group" := ReqLine2."Gen. Bus. Posting Group";
    //                                 purchaseLine."Gen. Prod. Posting Group" := ReqLine2."Gen. Prod. Posting Group";
    //                                 purchaseLine."VAT Bus. Posting Group" := ReqLine2."VAT Bus. Posting Group";
    //                                 purchaseLine."VAT Prod. Posting Group" := ReqLine2."VAT Prod. Posting Group";
    //                                 purchaseLine.Insert(true);
    //                               until ReqLine2.Next=0;
    //                               end;


    //                             ReqLine."Ordered by":=UserId;
    //                             ReqLine."Order Creation date":=Today;
    //                             ReqLine."Order Creation Time":=Time;
    //                             ReqLine.Ordered:=true;
    //                             ReqLine.Modify;

    //                             Message('Purchase order no %1 created successfully',PurchaseHeader."No.");
    //                           until ReqLine.Next=0;
    //                         end;
    //                         end;




    //                           //END;
    //                         //END;
    //                         //CurrPage.CLOSE();
    //                     end;
    //                 }
    //                 action("Process Order")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Image = AdjustEntries;
    //                     Promoted = true;
    //                     PromotedCategory = Process;

    //                     trigger OnAction()
    //                     begin
    //                         if Confirm(Text004,false) then begin
    //                           RequsitionManager.RequisitionReview(Rec);
    //                           //RequsitionManager.ChangeDocHeaderStatus("Document No.");

    //                           purchaseLine.Reset;
    //                           purchaseLine.SetRange(purchaseLine.Select2,true);
    //                           if purchaseLine.Find('-') then
    //                           begin
    //                             repeat
    //                               //MESSAGE('%1',purchaseLine."Document No.");
    //                               purchaseLine."Ordered by":=UserId;
    //                               purchaseLine."Order Creation date":=Today;
    //                               purchaseLine."Order Creation Time":=Time;
    //                               purchaseLine.Select2 := false;
    //                               //purchaseLine."Vote Item":="Vote Item";
    //                               //MESSAGE('%1',"Vote Item");
    //                               purchaseLine."Buy-from Vendor No." := "Buy-from Vendor No.";
    //                              // purchaseLine."PO Type" := "PO Type";
    //                               purchaseLine.Ordered:=true;
    //                               purchaseLine.Modify;
    //                             until purchaseLine.Next=0;
    //                           end;

    //                           Message(Text005);
    //                         end;
    //                     end;
    //                 }
    //             }
    //         }
    //     }

    //     trigger OnAfterGetRecord()
    //     begin
    //         ShowShortcutDimCode(ShortcutDimCode);
    //     end;

    //     trigger OnDeleteRecord(): Boolean
    //     var
    //         ReservePurchLine: Codeunit "Purch. Line-Reserve";
    //     begin
    //         if (Quantity <> 0) and ItemExists("No.") then begin
    //           Commit;
    //           if not ReservePurchLine.DeleteLineConfirm(Rec) then
    //             exit(false);
    //           ReservePurchLine.DeleteLine(Rec);
    //         end;
    //     end;

    //     trigger OnNewRecord(BelowxRec: Boolean)
    //     begin
    //         InitType;
    //         Clear(ShortcutDimCode);
    //     end;

    //     trigger OnOpenPage()
    //     begin
    //         if UserSetup.Get(UserId) then begin
    //         if UserSetup."Procurement officer"=false then
    //         Error(Text006);
    //         end;
    //     end;

    //     var
    //         TransferExtendedText: Codeunit "Transfer Extended Text";
    //         ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
    //         ShortcutDimCode: array [8] of Code[20];
    //         UpdateAllowedVar: Boolean;
    //         Text000: label 'Unable to execute this function while in view only mode.';
    //         PurchHeader: Record "Purchase Header";
    //         PurchPriceCalcMgt: Codeunit "Purch. Price Calc. Mgt.";
    //         Text001: label 'You cannot use the Explode BOM function because a prepayment of the purchase order has been invoiced.';
    //         PO: Record "Purchase Header";
    //         PURCHLINE: Record "Purchase Line";
    //         ReqLine: Record "Purchase Line";
    //         ReqLine2: Record "Purchase Line";
    //         LineNo: Integer;
    //         Acct: Record "G/L Account";
    //         DocDim: Record "Dimension Set Entry";
    //         DocDim2: Record "Dimension Set Entry";
    //         Text002: label 'The seleceted lines will be assigned to the specified LPO/LSO. Are you sure this is what you want?';
    //         Text003: label 'The seleceted lines will be used to create LPO/LSO. Are you sure this is what you want?';
    //         GLSetup: Record "Purchases & Payables Setup";
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         LineNo2: Code[20];
    //         gCuNoSeriesMngmnt: Codeunit NoSeriesManagement;
    //         PurchaseHeader: Record "Purchase Header";
    //         purchaseLine: Record "Purchase Line";
    //         Text004: label 'Do you want to proceed and perform the selected action on the purchase requisition lines?';
    //         Text005: label 'Purchase Review process completed';
    //         RequsitionManager: Codeunit "Requisition Management";
    //         UserSetup: Record "User Setup";
    //         Text006: label 'Access to approved purchase Lines is denied!';


    //     procedure ApproveCalcInvDisc()
    //     begin
    //         Codeunit.Run(Codeunit::"Purch.-Disc. (Yes/No)",Rec);
    //     end;


    //     procedure CalcInvDisc()
    //     begin
    //         Codeunit.Run(Codeunit::"Purch.-Calc.Discount",Rec);
    //     end;


    //     procedure ExplodeBOM()
    //     begin
    //         if "Prepmt. Amt. Inv." <> 0 then
    //           Error(Text001);
    //         Codeunit.Run(Codeunit::"Purch.-Explode BOM",Rec);
    //     end;


    //     procedure OpenSalesOrderForm()
    //     var
    //         SalesHeader: Record "Sales Header";
    //         SalesOrder: Page "Sales Order";
    //     begin
    //         TestField("Sales Order No.");
    //         SalesHeader.SetRange("No.","Sales Order No.");
    //         SalesOrder.SetTableview(SalesHeader);
    //         SalesOrder.Editable := false;
    //         SalesOrder.Run;
    //     end;


    //     procedure InsertExtendedText(Unconditionally: Boolean)
    //     begin
    //         if TransferExtendedText.PurchCheckIfAnyExtText(Rec,Unconditionally) then begin
    //           CurrPage.SaveRecord;
    //           TransferExtendedText.InsertPurchExtText(Rec);
    //         end;
    //         if TransferExtendedText.MakeUpdate then
    //           UpdateForm(true);
    //     end;


    //     procedure ShowTracking()
    //     var
    //         TrackingForm: Page "Order Tracking";
    //     begin
    //         TrackingForm.SetPurchLine(Rec);
    //         TrackingForm.RunModal;
    //     end;


    //     procedure OpenSpecOrderSalesOrderForm()
    //     var
    //         SalesHeader: Record "Sales Header";
    //         SalesOrder: Page "Sales Order";
    //     begin
    //         TestField("Special Order Sales No.");
    //         SalesHeader.SetRange("No.","Special Order Sales No.");
    //         SalesOrder.SetTableview(SalesHeader);
    //         SalesOrder.Editable := false;
    //         SalesOrder.Run;
    //     end;


    //     procedure UpdateForm(SetSaveRecord: Boolean)
    //     begin
    //         CurrPage.Update(SetSaveRecord);
    //     end;


    //     procedure SetUpdateAllowed(UpdateAllowed: Boolean)
    //     begin
    //         UpdateAllowedVar := UpdateAllowed;
    //     end;


    //     procedure UpdateAllowed(): Boolean
    //     begin
    //         if UpdateAllowedVar = false then begin
    //           Message(Text000);
    //           exit(false);
    //         end;
    //         exit(true);
    //     end;


    //     procedure ShowPrices()
    //     begin
    //         PurchHeader.Get("Document Type","Document No.");
    //         Clear(PurchPriceCalcMgt);
    //         PurchPriceCalcMgt.GetPurchLinePrice(PurchHeader,Rec);
    //     end;


    //     procedure ShowLineDisc()
    //     begin
    //         PurchHeader.Get("Document Type","Document No.");
    //         Clear(PurchPriceCalcMgt);
    //         PurchPriceCalcMgt.GetPurchLineLineDisc(PurchHeader,Rec);
    //     end;

    //     local procedure NoOnAfterValidate()
    //     begin
    //         InsertExtendedText(false);
    //         if (Type = Type::"Charge (Item)") and ("No." <> xRec."No.") and
    //            (xRec."No." <> '')
    //         then
    //           CurrPage.SaveRecord;
    //     end;

    //     local procedure CrossReferenceNoOnAfterValidat()
    //     begin
    //         InsertExtendedText(false);
    //     end;
    // }
}

//}