#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 70005 "Works Category Management"
{
    // EventSubscriberInstance = Manual;

    // trigger OnRun()
    // begin
    // end;

    // var
    //     TempItemCategory: Record "Works Category" temporary;

    // [EventSubscriber(ObjectType::Table, Database::"Item Category", 'OnAfterRenameEvent', '', false, false)]
    // local procedure UpdatedPresentationOrderOnAfterRenameItemCategory(var Rec: Record "Works Category";var xRec: Record "Works Category";RunTrigger: Boolean)
    // begin
    //     UpdatePresentationOrder;
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Item Category", 'OnAfterModifyEvent', '', false, false)]
    // local procedure UpdatePresentationOrderOnAfterModifyItemCategory(var Rec: Record "Works Category";var xRec: Record "Works Category";RunTrigger: Boolean)
    // var
    //     NewParentItemCategory: Record "Works Category";
    // begin
    //     if not Rec.IsTemporary then
    //       if xRec."Road Project Category" <> Rec."Road Project Category" then begin
    //         UpdatePresentationOrder;
    //         if NewParentItemCategory.Get(Rec."Road Project Category") then
    //           Rec.Validate("Default BoQ Template Code",NewParentItemCategory."Default BoQ Template Code" + 1)
    //         else
    //           Rec.Validate("Default BoQ Template Code",0);
    //         Rec.Modify;
    //       end;
    // end;

    // [EventSubscriber(ObjectType::Table, Database::"Item Category", 'OnAfterInsertEvent', '', false, false)]
    // local procedure UpdatePresentationOrdOnAfterInsertItemCategory(var Rec: Record "Works Category";RunTrigger: Boolean)
    // var
    //     NewParentItemCategory: Record "Works Category";
    // begin
    //     if not Rec.IsTemporary then begin
    //       UpdatePresentationOrder;
    //       if NewParentItemCategory.Get(Rec."Road Project Category") then begin
    //         Rec.Validate("Default BoQ Template Code",NewParentItemCategory."Default BoQ Template Code" + 1);
    //         Rec.Modify;
    //       end;
    //     end;
    // end;

    // procedure UpdatePresentationOrder()
    // var
    //     ItemCategory: Record "Works Category";
    // begin
    //     TempItemCategory.Reset;
    //     TempItemCategory.DeleteAll;

    //     // This is to cleanup wrong created blank entries created by an import mistake
    //     if ItemCategory.Get('') then
    //       ItemCategory.Delete;

    //     if ItemCategory.FindSet(false,false) then
    //       repeat
    //         TempItemCategory.TransferFields(ItemCategory);
    //         TempItemCategory.Insert;
    //       until ItemCategory.Next = 0;
    //     UpdatePresentationOrderIterative;
    // end;

    // local procedure UpdatePresentationOrderIterative()
    // var
    //     ItemCategory: Record "Works Category";
    //     TempStack: Record TempStack temporary;
    //     TempCurItemCategory: Record "Works Category" temporary;
    //     CurItemCategoryID: RecordID;
    //     PresentationOrder: Integer;
    //     Indentation: Integer;
    //     HasChildren: Boolean;
    // begin
    //     PresentationOrder := 0;

    //     TempCurItemCategory.Copy(TempItemCategory,true);

    //     TempItemCategory.SetCurrentkey("Road Project Category");
    //     TempItemCategory.Ascending(false);
    //     TempItemCategory.SetRange("Road Project Category",'');
    //     if TempItemCategory.FindSet(false,false) then
    //       repeat
    //         TempStack.Push(TempItemCategory.RecordId);
    //       until TempItemCategory.Next = 0;

    //     while TempStack.Pop(CurItemCategoryID) do begin
    //       TempCurItemCategory.Get(CurItemCategoryID);
    //       HasChildren := false;

    //       TempItemCategory.SetRange("Road Project Category",TempCurItemCategory.Code);
    //       if TempItemCategory.FindSet(false,false) then
    //         repeat
    //           TempStack.Push(TempItemCategory.RecordId);
    //           HasChildren := true;
    //         until TempItemCategory.Next = 0;

    //       if TempCurItemCategory."Road Project Category" <> '' then begin
    //         TempItemCategory.Get(TempCurItemCategory."Road Project Category");
    //         Indentation := TempItemCategory."Default BoQ Template Code" + 1;
    //       end else
    //         Indentation := 0;
    //       PresentationOrder := PresentationOrder + 1;

    //       if (TempCurItemCategory."Default Directorate" <> PresentationOrder) or
    //          (TempCurItemCategory."Default BoQ Template Code" <> Indentation) or (TempCurItemCategory."Default Department" <> HasChildren)
    //       then begin
    //         ItemCategory.Get(TempCurItemCategory.Code);
    //         ItemCategory.Validate("Default Directorate",PresentationOrder);
    //         ItemCategory.Validate("Default BoQ Template Code",Indentation);
    //         ItemCategory.Validate("Default Department",HasChildren);
    //         ItemCategory.Modify;
    //         TempItemCategory.Get(TempCurItemCategory.Code);
    //         TempItemCategory.Validate("Default Directorate",PresentationOrder);
    //         TempItemCategory.Validate("Default BoQ Template Code",Indentation);
    //         TempItemCategory.Validate("Default Department",HasChildren);
    //         TempItemCategory.Modify;
    //       end;
    //     end;
    // end;

    // procedure DoesValueExistInItemCategories(Text: Code[20];var ItemCategory: Record "Works Category"): Boolean
    // begin
    //     ItemCategory.Reset;
    //     ItemCategory.SetFilter(Code,'@' + Text);
    //     exit(ItemCategory.FindSet);
    // end;
}

