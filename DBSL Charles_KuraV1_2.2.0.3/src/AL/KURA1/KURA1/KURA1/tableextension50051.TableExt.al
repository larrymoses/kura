#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50051 "tableextension50051" extends "Bank Account Statement" 
{
    fields
    {
        field(50000;"Cash Book Balance";Decimal)
        {
            Editable = false;
        }
        field(50001;"Responsibility Center";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));
        }
    }


    //Unsupported feature: Code Insertion on "OnInsert".

    //trigger OnInsert()
    //begin
        /*
        IF UserSetup.GET(USERID) THEN
          "Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
        */
    //end;

    var
        UserSetup: Record "User Setup";
}

