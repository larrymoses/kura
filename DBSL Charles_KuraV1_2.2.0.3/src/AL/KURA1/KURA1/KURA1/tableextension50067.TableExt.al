#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50067 "tableextension50067" extends "Default Dimension" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""No."(Field 2)".


        //Unsupported feature: Property Modification (Data type) on ""Dimension Code"(Field 3)".


        //Unsupported feature: Property Modification (Data type) on ""Dimension Value Code"(Field 4)".


        //Unsupported feature: Code Modification on ""Table ID"(Field 1).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CALCFIELDS("Table Caption");
            DimMgt.DefaultDimObjectNoList(TempAllObjWithCaption);
            TempAllObjWithCaption."Object Type" := TempAllObjWithCaption."Object Type"::Table;
            TempAllObjWithCaption."Object ID" := "Table ID";
            IF NOT TempAllObjWithCaption.FIND THEN
              FIELDERROR("Table ID");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            {CALCFIELDS("Table Caption");
            #2..5
              FIELDERROR("Table ID");}
            */
        //end;
    }

    //Unsupported feature: Property Modification (Length) on "UpdateGLAccGlobalDimCode(PROCEDURE 26).GLAccNo(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "UpdateGLAccGlobalDimCode(PROCEDURE 26).NewDimValue(Parameter 1000)".


    //Unsupported feature: Property Modification (Length) on "UpdateCustGlobalDimCode(PROCEDURE 27).CustNo(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "UpdateCustGlobalDimCode(PROCEDURE 27).NewDimValue(Parameter 1000)".


    //Unsupported feature: Property Modification (Length) on "UpdateVendGlobalDimCode(PROCEDURE 28).VendNo(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "UpdateVendGlobalDimCode(PROCEDURE 28).NewDimValue(Parameter 1000)".


    //Unsupported feature: Property Modification (Length) on "UpdateItemGlobalDimCode(PROCEDURE 29).ItemNo(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "UpdateItemGlobalDimCode(PROCEDURE 29).NewDimValue(Parameter 1000)".


    //Unsupported feature: Property Modification (Length) on "UpdateJobGlobalDimCode(PROCEDURE 32).JobNo(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "UpdateJobGlobalDimCode(PROCEDURE 32).NewDimValue(Parameter 1000)".


    //Unsupported feature: Property Modification (Length) on "UpdateSalesPurchGlobalDimCode(PROCEDURE 39).SalespersonPurchaserNo(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "UpdateSalesPurchGlobalDimCode(PROCEDURE 39).NewDimValue(Parameter 1000)".


    //Unsupported feature: Property Modification (Length) on "UpdateCampaignGlobalDimCode(PROCEDURE 40).CampaignNo(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "UpdateCampaignGlobalDimCode(PROCEDURE 40).NewDimValue(Parameter 1000)".


    //Unsupported feature: Property Modification (Length) on "UpdateCustTempGlobalDimCode(PROCEDURE 41).CustTemplateNo(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "UpdateCustTempGlobalDimCode(PROCEDURE 41).NewDimValue(Parameter 1000)".


    //Unsupported feature: Property Modification (Length) on "UpdateNeutrPayGlobalDimCode(PROCEDURE 42).CFManualExpenseNo(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "UpdateNeutrPayGlobalDimCode(PROCEDURE 42).NewDimValue(Parameter 1000)".


    //Unsupported feature: Property Modification (Length) on "OnAfterUpdateGlobalDimCode(PROCEDURE 1).AccNo(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "OnAfterUpdateGlobalDimCode(PROCEDURE 1).NewDimValue(Parameter 1000)".


    //Unsupported feature: Property Modification (Length) on "CheckDimension(PROCEDURE 6).DimensionCode(Parameter 1000)".


    //Unsupported feature: Property Modification (Length) on "CheckDimensionValue(PROCEDURE 8).DimensionCode(Parameter 1000)".


    //Unsupported feature: Property Modification (Length) on "CheckDimensionValue(PROCEDURE 8).DimensionValueCode(Parameter 1001)".


    //Unsupported feature: Property Modification (Length) on "SetRangeToLastFieldInPrimaryKey(PROCEDURE 7).Value(Parameter 1001)".

}

