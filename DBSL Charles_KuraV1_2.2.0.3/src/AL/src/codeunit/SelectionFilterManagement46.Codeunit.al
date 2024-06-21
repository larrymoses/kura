#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 99506 "SelectionFilterManagement46"
{

    trigger OnRun()
    begin

        //  OBJECT Modification SelectionFilterManagement(Codeunit 46)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=05122020D;
        //      Time=144704T;
        //      Modified=Yes;
        //      Version List=NAVW114.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target=SelectionFilterManagement(Codeunit 46);
        //    }
        //    CHANGES
        //    {
        //      { Insertion         ;InsertAfter=GetSelectionFilterForFixedAsset(PROCEDURE 36);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             LOCAL PROCEDURE "...........addded By Daudi....................."@34();
        //                             BEGIN
        //                             END;
        //  
        //                             [External]
        //                             PROCEDURE GetSelectionFilterForWorksCategory@37(VAR ItemCategory@1000 : Record "Works Category") : Text;
        //                             VAR
        //                               RecRef@1001 : RecordRef;
        //                             BEGIN
        //                               RecRef.GETTABLE(ItemCategory);
        //                               EXIT(GetSelectionFilter(RecRef,ItemCategory.FIELDNO(Code)));
        //                             END;
        //  
        //                           }
        //                            }
        //    }
        //    CODE
        //    {
        //  
        //      BEGIN
        //      END.
        //    }
        //  }
        //  
        //  

    end;
}

