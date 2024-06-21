#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50049 "tableextension50049" extends "Bank Acc. Reconciliation"
{
    fields
    {
        field(481; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Open,Pending Approval,Rejected,Released';
            OptionMembers = " ",Open,"Pending Approval",Rejected,Released;
        }
        field(482; "Responsibility Center"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        modify("Bank Account No.")
        {
            TableRelation = "Bank Account"."No." where("Responsibility Center" = field("Responsibility Center"));
        }
    }




    trigger OnInsert()

    begin

        TESTFIELD("Statement No.");
        TESTFIELD("Bank Account No.");
        IF UserSetup.GET(USERID) THEN BEGIN
            "Responsibility Center" := UserSetup."Responsibility Center";
        END;

    END;

    trigger OnDelete()
    begin
        Error('You cannot delete %1', Rec.TableCaption);
    end;



    var
        UserSetup: Record "User Setup";
}



